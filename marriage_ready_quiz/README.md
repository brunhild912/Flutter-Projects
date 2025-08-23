Marriage Ready Quiz — Flutter MVP
Overview

This is a Flutter-based MVP for the Marriage Ready Quiz, built as part of a paid trial task.
The app enables users to:

Enter their age and optional email.

Complete a 20-question quiz, with answers mapped to a percentage score.

View a total readiness score and category-wise breakdown with clear labels and progress indicators.

The implementation focuses on clean architecture, simple but scalable state management, and a smooth user experience.

Build & Run Instructions
Requirements

Flutter (latest stable channel)

Android Studio, Xcode, or VS Code with Flutter extension

Device or emulator for testing

Steps
# 1. Clone the private repo
git clone <PRIVATE_REPO_URL>
cd marriage_ready_quiz

# 2. Clean and get dependencies
flutter clean
flutter pub get

# 3. Run on a connected device or emulator
flutter run

Features

Email + Age Capture (with validation):

Age is required (16–100).

Email is optional but validated for format.

20-Question Quiz:

Likert-scale options mapped to percentages:

Strongly Disagree → 20%

Disagree → 40%

Neutral → 60%

Agree → 80%

Strongly Agree → 100%

Progress bar and navigation between questions.

Results Screen:

Total readiness score (average of all answers).

Category breakdown with percentages and progress bars.

A short encouraging message based on the score.

State Reset:

Retake option clears answers and restarts the quiz.

Implementation Overview
State Management

Riverpod for reactive, testable state.

Two providers:

quizProvider → Stores answers (questionId → choice) and computes scores.

userInfoProvider → Stores age and optional email.

Scoring Logic

computeResult() in quiz_state.dart:

Averages all 20 responses for total readiness score.

Groups answers by category for the breakdown:

Category	Questions
Career	Q18
Opportunity	Q7, Q8, Q10, Q16
Maturity	Q1, Q2, Q12, Q14
Prevention	Q3, Q5, Q6, Q9
Age	Q4, Q15, Q17
Responsibility	Q11, Q13, Q19
Education	Q20
Architecture
lib/
  core/           # Themes, constants
  data/           # Models, questions
  features/       # Screens: intake, quiz, results
  state/          # Riverpod providers and logic
  app.dart        # App routes and setup
  main.dart       # Entry point

Design Choices

Riverpod for simplicity and scalability.

Material 3 UI for a clean, readable design without heavy styling.

Modular folder structure for maintainability and easy future expansion (e.g., persistence, analytics, localization).

Clean, readable code with small, meaningful functions and comments where needed.

Known Limitations

Data is in-memory only — no Firebase or persistent storage (optional per requirements).

Basic validation only for intake fields.

No offline support or analytics.

Extra Efforts

Clean architecture and separation of concerns for maintainability.

User-friendly validation and progress feedback.

Encouraging message on results for better user engagement.

Demo

Watch the full walkthrough here:
Loom Video Link

Next Steps (Future Enhancements)

Add persistent storage with Firebase or local DB.

Integrate analytics for user behavior tracking.

Add multi-language support.

Include a chart visualization for breakdown scores.
