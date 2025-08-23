import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/models.dart';
import '../data/questions.dart';

class QuizNotifier extends StateNotifier<Map<int, AnswerChoice>> {
  QuizNotifier() : super({});

  void answer(int qId, AnswerChoice choice) => state = {...state, qId: choice};

  void clear() => state = {};

  bool get isComplete => state.length == kQuestions.length;

  QuizResult computeResult() {
    // Total (average of all 20 mapped values)
    final total =
        state.values.map(mapChoiceToPercent).fold<int>(0, (a, b) => a + b) /
            kQuestions.length;

    // Category breakdown (average of answered items per category)
    final Map<String, List<int>> buckets = {};
    for (final q in kQuestions) {
      final cat = q.category;
      if (cat == null) continue;
      final ans = state[q.id];
      if (ans == null) continue;
      (buckets[cat] ??= []).add(mapChoiceToPercent(ans));
    }

    final breakdown = buckets.entries.map((e) {
      final avg = e.value.isEmpty
          ? 0.0
          : e.value.reduce((a, b) => a + b) / e.value.length;
      return CategoryScore(e.key, avg);
    }).toList()
      ..sort((a, b) => a.category.compareTo(b.category)); // stable order

    return QuizResult(total, breakdown);
  }
}

final quizProvider =
    StateNotifierProvider<QuizNotifier, Map<int, AnswerChoice>>(
        (ref) => QuizNotifier());

// ---- Intake (from Step 2) ----
class UserInfoNotifier extends StateNotifier<UserInfo?> {
  UserInfoNotifier() : super(null);
  void setUserInfo({required int age, String? email}) {
    state = UserInfo(
        age: age, email: email?.trim().isEmpty == true ? null : email?.trim());
  }

  void clear() => state = null;
}

final userInfoProvider = StateNotifierProvider<UserInfoNotifier, UserInfo?>(
    (ref) => UserInfoNotifier());
