# Expense Tracker

A modern personal finance and expense management mobile application built with Flutter and Dart. Developed as part of the Digital Skills Training Program (DSTP), Expense Tracker helps individuals record daily expenditures, categorize spending habits, set monthly budgets, and visualize their financial health through clean analytical views.

---

## UI / UX Design Reference

The user interface of this project was implemented following the Figma design layout:

- Figma Design: [Kharcha – Expense Tracker on Figma](https://www.figma.com/design/Pcy33ApjHDMmYariEhf7ze/Kharcha-%25E2%2580%2593-Expense-Tracker?node-id=0-1)

The color palette, component styling, input fields, visual indicators, and typography were built to align with the screens specified in the design mockup.

---

## Overview

Managing day-to-day finances manually often leads to unorganized records and difficulty understanding where money is spent. Expense Tracker addresses this by offering a lightweight, intuitive mobile experience where users can quickly log expenses as they happen.

The application organizes data by category, compares total spending against a set monthly budget in real time, and provides clear visual breakdowns to support better financial decisions.

---

## Features

- User Authentication: Clean login and signup screens with formatted input fields and password visibility toggling.
- Financial Dashboard: Home screen featuring current month spending totals, budget limits, remaining balance, and a visual progress indicator.
- Transaction Logging: Add expense flow allowing users to input title, numerical amount, category assignment, and date.
- Expense Inspection and Modification: Detail view to inspect existing transactions, update details, or delete records.
- Categorization System: Color-coded categories (Food, Transport, Health, Shopping, Utility Bills, Entertainment) with custom SVG icons for quick visual identification.
- Spending Analytics: Dedicated summary view displaying category-wise expenditure breakdowns and budget consumption.
- Budget Goal Setting: Monthly budget screen to set and adjust spending thresholds.
- Multi-Tab Navigation: Bottom navigation bar for switching between Home, Expense Management, Summary, and Settings screens.

---

## Project Structure

```text
expense_tracker/
├── assets/
│   └── icons/                 # Custom SVG icons for categories and navigation
├── lib/
│   ├── main.dart              # Application entry point
│   ├── Model/
│   │   └── expense_model.dart # Data models for expenses and categories
│   ├── utils/
│   │   ├── app_assets.dart    # Asset path references
│   │   ├── app_colors.dart    # Application color constants
│   │   └── global.dart        # Global data state and mock transactions
│   └── view/
│       ├── components/        # Reusable buttons and text field widgets
│       └── screens/
│           ├── auth/          # Login and registration screens
│           └── main_screen/   # Dashboard, add expense, edit, and tab screens
├── pubspec.yaml               # Package dependencies and asset configuration
└── README.md                  # Project documentation
```

---

## Built With

- Flutter: Cross-platform UI toolkit.
- Dart: Client-optimized programming language.
- flutter_svg: Vector graphics rendering for category icons.
- google_fonts: Typography rendering across screen sizes.
- intl: Date, time, and numerical formatting.

---

## Getting Started

### Prerequisites

Ensure you have the following installed on your machine:

- Flutter SDK (version 3.11.4 or higher)
- Dart SDK
- An Android device / emulator, iOS simulator, or desktop browser

### Installation and Run

1. Open your terminal and change into the project directory:
   ```bash
   cd expense_tracker
   ```

2. Download and install all dependencies:
   ```bash
   flutter pub get
   ```

3. Launch the application:
   ```bash
   flutter run
   ```

---

## Author

Muqadas Akram  
Digital Skills Training Program (DSTP)
