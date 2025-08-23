import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../state/quiz_state.dart';

class IntakeScreen extends ConsumerStatefulWidget {
  const IntakeScreen({super.key});
  @override
  ConsumerState<IntakeScreen> createState() => _IntakeScreenState();
}

class _IntakeScreenState extends ConsumerState<IntakeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _ageCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();

  @override
  void dispose() {
    _ageCtrl.dispose();
    _emailCtrl.dispose();
    super.dispose();
  }

  String? _validateAge(String? v) {
    if (v == null || v.trim().isEmpty) return 'Age is required';
    final n = int.tryParse(v.trim());
    if (n == null) return 'Enter a valid number';
    if (n < 16 || n > 100) return 'Please enter an age between 16 and 100';
    return null;
  }

  String? _validateEmail(String? v) {
    if (v == null || v.trim().isEmpty) return null; // optional
    final s = v.trim();
    // Simple email pattern (good enough for app intake)
    final emailReg = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
    if (!emailReg.hasMatch(s)) return 'Enter a valid email or leave blank';
    return null;
  }

  void _startQuiz() {
    if (_formKey.currentState!.validate()) {
      final age = int.parse(_ageCtrl.text.trim());
      final email =
          _emailCtrl.text.trim().isEmpty ? null : _emailCtrl.text.trim();
      ref.read(userInfoProvider.notifier).setUserInfo(age: age, email: email);

      // Also clear any previous quiz answers just in case (fresh start)
      ref.read(quizProvider.notifier).state = {};

      Navigator.pushNamed(context, '/quiz');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Marriage Ready Quiz')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Tell us a bit about you',
                    style: theme.textTheme.titleLarge),
                const SizedBox(height: 8),
                Text(
                  'Your email helps us follow up with resources. Age ensures the guidance fits your stage.',
                  style: theme.textTheme.bodyMedium,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _ageCtrl,
                  decoration: const InputDecoration(
                    labelText: 'Age *',
                    hintText: 'e.g., 24',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: _validateAge,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _emailCtrl,
                  decoration: const InputDecoration(
                    labelText: 'Email (optional)',
                    hintText: 'name@example.com',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: _validateEmail,
                ),
                const Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: FilledButton(
                        onPressed: _startQuiz,
                        child: const Text('Start Quiz'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
