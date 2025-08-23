enum AnswerChoice { sd, d, n, a, sa } // 20,40,60,80,100

int mapChoiceToPercent(AnswerChoice c) {
  switch (c) {
    case AnswerChoice.sd:
      return 20;
    case AnswerChoice.d:
      return 40;
    case AnswerChoice.n:
      return 60;
    case AnswerChoice.a:
      return 80;
    case AnswerChoice.sa:
      return 100;
  }
}

class Question {
  final int id; // 1..20
  final String text;
  final String? category; // e.g., 'Maturity'
  const Question({required this.id, required this.text, this.category});
}

class CategoryScore {
  final String category; // 'Career', etc.
  final double percent; // 20..100
  const CategoryScore(this.category, this.percent);
}

class QuizResult {
  final double totalPercent;
  final List<CategoryScore> breakdown;
  const QuizResult(this.totalPercent, this.breakdown);
}

class UserInfo {
  final int age;
  final String? email;
  const UserInfo({required this.age, this.email});
}
