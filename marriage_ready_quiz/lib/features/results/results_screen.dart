import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models.dart';
import '../../state/quiz_state.dart';

class ResultsScreen extends ConsumerWidget {
  const ResultsScreen({super.key});

  String _message(double total) {
    if (total >= 80) return 'Great foundation — keep nurturing it!';
    if (total >= 60) return 'Good progress — identify gaps and grow.';
    return 'You’ve got insight now — focus on key areas next.';
  }

  String _band(double total) {
    if (total >= 80) return 'Strong';
    if (total >= 60) return 'Moderate';
    return 'Needs Focus';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Prefer passed argument; fall back to compute (defensive)
    final args = ModalRoute.of(context)!.settings.arguments;
    QuizResult? res = args is QuizResult ? args : null;
    res ??= ref.read(quizProvider.notifier).computeResult();

    final total = res.totalPercent.clamp(0, 100).toDouble();
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Your Results')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Total score
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${total.toStringAsFixed(0)}%',
                    style: theme.textTheme.displayMedium,
                  ),
                  const SizedBox(width: 12),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Chip(label: Text(_band(total))),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                _message(total),
                style: theme.textTheme.titleMedium,
              ),

              const SizedBox(height: 20),
              Text('Category breakdown', style: theme.textTheme.titleLarge),
              const SizedBox(height: 8),

              // Breakdown list with progress bars
              Expanded(
                child: ListView.separated(
                  itemCount: res.breakdown.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (context, i) {
                    final c = res!.breakdown[i];
                    final pct = (c.percent).clamp(0, 100).toDouble();
                    return _CategoryTile(name: c.category, percent: pct);
                  },
                ),
              ),

              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: FilledButton(
                      onPressed: () {
                        // Clear quiz answers and return to intake
                        ref.read(quizProvider.notifier).clear();
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/', (_) => false);
                      },
                      child: const Text('Retake'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryTile extends StatelessWidget {
  final String name;
  final double percent;
  const _CategoryTile({required this.name, required this.percent});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                    child: Text(name,
                        style: Theme.of(context).textTheme.titleMedium)),
                Text('${percent.toStringAsFixed(0)}%'),
              ],
            ),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: LinearProgressIndicator(value: percent / 100),
            ),
          ],
        ),
      ),
    );
  }
}
