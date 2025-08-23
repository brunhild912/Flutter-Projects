# 💍 **Marriage Ready Quiz — Flutter MVP**

> A clean, scalable MVP implementation of the Marriage Ready Quiz
> 
> 
> Built as part of the **paid trial task** — designed for clarity, maintainability, and a smooth user experience.
> 

---

## 🚀 **Overview**

This **Flutter-based app** lets users:

- ✍️ **Enter their age and optional email**
- 📝 **Complete a 20-question quiz** with answers mapped to percentage scores
- 📊 **View their total readiness score and category breakdown**
- 🎯 Receive a **personalized, encouraging message** based on their results

The build focuses on **simplicity**, **clean architecture**, and **future scalability**.

---

## 🛠️ **Tech Stack**

- **Flutter** — cross-platform framework
- **Riverpod** — state management for clean, reactive state
- **Material 3 Design** — for a modern and consistent UI

---

## 🧑‍💻 **Build & Run Instructions**

### **Requirements**

- Flutter (latest **stable** channel)
- Android Studio, VS Code, or Xcode (with Flutter plugins)
- Emulator or physical device for testing

### **Steps**

```bash
# 1️⃣ Clone the private repository
git clone <PRIVATE_REPO_URL>
cd marriage_ready_quiz

# 2️⃣ Clean and get dependencies
flutter clean
flutter pub get

# 3️⃣ Run the app
flutter run

```

---

## ✨ **Key Features**

### **1️⃣ Email + Age Capture**

- **Required:** Age (validated for 16–100)
- **Optional:** Email (basic format validation)
- Stored **in-memory** for simplicity

---

### **2️⃣ Quiz Experience**

- **20 questions** with 5-point Likert scale:
    - Strongly Disagree → **20%**
    - Disagree → **40%**
    - Neutral → **60%**
    - Agree → **80%**
    - Strongly Agree → **100%**
- **Smooth navigation** with Next/Previous buttons
- **Progress indicator** for user clarity

---

### **3️⃣ Results**

- **Total Marriage Readiness Score** — average of all 20 responses
- **Category breakdown**, including:
    
    
    | Category | Question IDs |
    | --- | --- |
    | **Career** | Q18 |
    | **Opportunity** | Q7, Q8, Q10, Q16 |
    | **Maturity** | Q1, Q2, Q12, Q14 |
    | **Prevention** | Q3, Q5, Q6, Q9 |
    | **Age** | Q4, Q15, Q17 |
    | **Responsibility** | Q11, Q13, Q19 |
    | **Education** | Q20 |
- **Encouraging message** personalized to user score

---

## 🧩 **Implementation Overview**

### **Folder Structure**

```
lib/
  core/           # Theme, constants
  data/           # Models, question set
  state/          # Riverpod providers, business logic
  features/       # Intake, Quiz, Results screens
  app.dart        # Routes and MaterialApp setup
  main.dart       # Entry point

```

---

### **State Management**

- **Riverpod** ensures:
    - Lightweight, reactive state
    - Easy scalability for persistence or analytics later
- **Providers**:
    - `quizProvider` — Tracks answers and calculates scores
    - `userInfoProvider` — Stores intake data (age/email)

---

### **Scoring Logic**

- Implemented in `computeResult()`:
    - **Total Score** = average of all 20 mapped values
    - **Category Score** = average of mapped answers by group
- Fully modular to allow category updates without touching logic elsewhere.

---

## 🎨 **Design Decisions**

- **Material 3 UI** for modern, clean design
- **Intake before quiz** to reduce user drop-off and allow future analytics
- **Modular architecture** for maintainability and ease of scaling
- **Readable code** with small, focused functions and clear naming conventions

---

## ⚡ **Extra Efforts**

- Added input validation for better UX
- Smooth navigation and progress indicators for clarity
- Encouraging message on results for a more human feel
- Well-documented and logically organized code for easy collaboration

---

## 🎥 **Demo Video**

Watch the walkthrough here:

> ▶ Loom Video Demo (Replace with your Loom link)
> 

---

## 🔮 **Future Enhancements**

- 🔐 **Data persistence** (Firebase or local DB)
- 📊 **Chart visualizations** for category scores
- 🌐 **Multi-language support**
- 📈 **Analytics integration** for insights

---

## 🤝 **Acknowledgements**

Thanks to the reviewing team for this opportunity — I’ve kept the code clean, scalable, and ready for future iterations while staying within the MVP scope and time constraints.
