import 'models.dart';

const Map<int, String> kCategory = {
  18: 'Career',
  7: 'Opportunity',
  8: 'Opportunity',
  10: 'Opportunity',
  16: 'Opportunity',
  1: 'Maturity',
  2: 'Maturity',
  12: 'Maturity',
  14: 'Maturity',
  3: 'Prevention',
  5: 'Prevention',
  6: 'Prevention',
  9: 'Prevention',
  4: 'Age',
  15: 'Age',
  17: 'Age',
  11: 'Responsibility',
  13: 'Responsibility',
  19: 'Responsibility',
  20: 'Education',
};

final List<Question> kQuestions = [
  Question(
      id: 1,
      text:
          "I am emotionally mature and able to manage conflicts in a healthy way.",
      category: kCategory[1]),
  Question(
      id: 2,
      text: "I understand my personal values and priorities in life.",
      category: kCategory[2]),
  Question(
      id: 3,
      text:
          "I have learned from past relationship mistakes and avoid repeating them.",
      category: kCategory[3]),
  Question(
      id: 4,
      text:
          "I feel that my current age is appropriate for marriage based on my personal goals.",
      category: kCategory[4]),
  Question(
      id: 5,
      text: "I know how to set healthy boundaries in relationships.",
      category: kCategory[5]),
  Question(
      id: 6,
      text:
          "I can identify red flags and avoid unhealthy relationship patterns.",
      category: kCategory[6]),
  Question(
      id: 7,
      text:
          "I feel I have met or am open to meeting potential compatible partners.",
      category: kCategory[7]),
  Question(
      id: 8,
      text:
          "I have a supportive environment (family, friends, or community) for my relationship.",
      category: kCategory[8]),
  Question(
      id: 9,
      text:
          "I actively seek advice or guidance when facing relationship challenges.",
      category: kCategory[9]),
  Question(
      id: 10,
      text:
          "I have opportunities to grow and develop as a partner within a relationship.",
      category: kCategory[10]),
  Question(
      id: 11,
      text:
          "I am financially responsible and able to budget for shared expenses.",
      category: kCategory[11]),
  Question(
      id: 12,
      text: "I take responsibility for my actions and learn from my mistakes.",
      category: kCategory[12]),
  Question(
      id: 13,
      text: "I am consistent with meeting my commitments and obligations.",
      category: kCategory[13]),
  Question(
      id: 14,
      text:
          "I am patient and willing to work through challenges in a relationship.",
      category: kCategory[14]),
  Question(
      id: 15,
      text:
          "I have experienced enough in life to make a thoughtful decision about marriage.",
      category: kCategory[15]),
  Question(
      id: 16,
      text:
          "I believe my current circumstances make it a good time to consider marriage.",
      category: kCategory[16]),
  Question(
      id: 17,
      text:
          "I have considered how my stage of life affects readiness for a long-term commitment.",
      category: kCategory[17]),
  Question(
      id: 18,
      text: "I am financially stable and confident in my career path.",
      category: kCategory[18]),
  Question(
      id: 19,
      text:
          "I understand the responsibilities involved in building a household and family.",
      category: kCategory[19]),
  Question(
      id: 20,
      text:
          "I value learning and personal growth to support a healthy marriage.",
      category: kCategory[20]),
];
