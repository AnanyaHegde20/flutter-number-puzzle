# Flutter Number Puzzle Game 🎮

A number-matching puzzle game built with *Flutter*.  
Inspired by Number Master (KiwiFun) but customized with clean, modular architecture for this assignment.

---

## 📌 Game Rules
- Tap two cells to match them if:
  - They are *equal*, OR
  - Their *sum = 10*
  - ✅ Match only works if cells are in the *same row/column* and no active numbers are between them.
- On valid match:
  - Both cells remain visible but *fade/dull*.
- On invalid match:
  - Shake + red flash animation.
- Each level lasts *2 minutes*.
- Rows:
  - Start with *3–4 rows*.
  - Use *Add Row* button to insert new rows (limited per level).

---

## 🕹 Features
- 3 Levels of increasing difficulty:
  - *Level 1:* Easy grid, more Add Rows
  - *Level 2:* Medium grid, fewer Add Rows
  - *Level 3:* Hard grid, minimal Add Rows
- *Score system* with combo multipliers
- *Hints* (show one valid pair)
- *Pause/Resume*
- *Local high scores* (per level)
- Built with *Riverpod* for state management

---

## ⚙ Requirements

Before running the project, make sure you have installed:

- [Flutter SDK (stable)](https://flutter.dev/docs/get-started/install) – version 3.x.x or later  
- [Dart SDK](https://dart.dev/get-dart) (comes with Flutter)  
- [Git](https://git-scm.com/downloads) – to clone repositories  
- *Android Studio* or *VS Code* with Flutter & Dart plugins  
- *Android Emulator* or real device (with USB debugging enabled)

---

## 🚀 Setup & Installation

### 1️⃣ Clone the Repository
```bash
git clone https://github.com/AnanyaHegde20/flutter-number-puzzle.git
cd flutter-number-puzzle

Install Dependencies 
flutter pub get

Run the App
flutter run

flutter build apk --release
build/app/outputs/flutter-apk/app-release.apk

```
# number_puzzle_flutter

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
