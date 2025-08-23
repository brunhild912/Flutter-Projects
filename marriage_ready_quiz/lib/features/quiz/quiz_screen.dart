import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models.dart';
import '../../data/questions.dart';
import '../../state/quiz_state.dart';

class QuizScreen extends ConsumerStatefulWidget {
  const QuizScreen({super.key});
  @override
  ConsumerState<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends ConsumerState<QuizScreen> {
  int index = 0; // 0..19

  AnswerChoice? _selectedFor(int qId) {
    return ref.read(quizProvider)[qId];
  }

  void _select(Question q, AnswerChoice choice) {
    ref.read(quizProvider.notifier).answer(q.id, choice);
    setState(() {}); // refresh selection state
  }

  void _next() {
    if (index < kQuestions.length - 1) {
      setState(() => index++);
    } else {
      // Finish → compute result & navigate
      final result = ref.read(quizProvider.notifier).computeResult();
      Navigator.pushReplacementNamed(context, '/results', arguments: result);
    }
  }

  void _prev() {
    if (index > 0) setState(() => index--);
  }

  String _label(AnswerChoice c) {
    switch (c) {
      case AnswerChoice.sd:
        return 'Strongly Disagree (20%)';
      case AnswerChoice.d:
        return 'Disagree (40%)';
      case AnswerChoice.n:
        return 'Neutral (60%)';
      case AnswerChoice.a:
        return 'Agree (80%)';
      case AnswerChoice.sa:
        return 'Strongly Agree (100%)';
    }
  }

  @override
  Widget build(BuildContext context) {
    final q = kQuestions[index];
    final selected = _selectedFor(q.id);

    return Scaffold(
      appBar: AppBar(title: Text('Question ${q.id} of ${kQuestions.length}')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Question text
              Text(
                q.text,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),

              // Choices
              ...AnswerChoice.values.map((c) => RadioListTile<AnswerChoice>(
                    value: c,
                    groupValue: selected,
                    onChanged: (v) => _select(q, v!),
                    title: Text(_label(c)),
                  )),

              const Spacer(),

              // Progress
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  LinearProgressIndicator(
                    value: (index + 1) / kQuestions.length,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: index == 0 ? null : _prev,
                          child: const Text('Previous'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: FilledButton(
                          onPressed: selected == null ? null : _next,
                          child: Text(index == kQuestions.length - 1
                              ? 'Finish'
                              : 'Next'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
