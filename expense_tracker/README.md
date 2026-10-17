# Expense Tracker

A personal finance mobile application developed with Flutter and Dart as part of the Digital Skills Training Program (DSTP). This project focuses on translating a Figma user interface design into functional Flutter screens, accompanied by core front-end features for recording and inspecting daily expenses.

---

## UI / UX Design Reference

The user interface of this project was implemented following the Figma design mockup:

- Figma Design: [Kharcha – Expense Tracker on Figma](https://www.figma.com/design/Pcy33ApjHDMmYariEhf7ze/Kharcha-%25E2%2580%2593-Expense-Tracker?node-id=0-1)

Component dimensions, border radiuses, color schemes, SVG iconography, and typography were styled to closely replicate the layout and aesthetic of the design file.

---

## Current Status and Scope

This project is currently centered around UI implementation and select core functionalities:

- Completed UI: Full user interface implementation for login, signup, dashboard, expense creation, transaction details/editing, categories, monthly budget, and settings screens.
- Active Functionalities:
  - Screen routing and bottom navigation across multiple tabs.
  - Adding, viewing, and editing expenses locally using in-memory state.
  - Category selection with custom color indicators and SVG asset rendering.
  - Real-time client-side calculations for budget progress, remaining limit, and formatted timestamps.
- Planned Work: Persistent local storage (e.g. Hive / SQLite), backend API synchronization, and extended reporting charts.

---

## Overview

Tracking daily cash flow often starts with a clear, distraction-free visual layout. Expense Tracker was built to practice converting a production-grade Figma design into reusable Flutter widgets, validating layout responsiveness, and handling basic application states without clutter.

Users can move through authentication, view their current month's spending status against a budget goal, and browse categorized expenses with clean visual cues.

---

## Key Features

- Authentication Screens: Styled login and registration layouts with form inputs and password visibility toggling.
- Financial Dashboard: Home screen featuring current month spending, budget limits, remaining balance, and a linear progress bar.
- Expense Logging: Add expense flow allowing users to input an expense title, amount, category, and date.
- Expense Details and Editing: Screen for inspecting existing transaction information, updating values, or removing entries.
- Category System: Categorization with custom SVG icons and dedicated color palettes (Food, Transport, Health, Shopping, Utility Bills, Entertainment).
- Spending Analytics: Summary view showing category-wise spending distribution and budget consumption.
- Budget Management: Dedicated screen for setting and monitoring monthly expenditure targets.
- Bottom Navigation Bar: Persistent bottom navigation for switching smoothly across tabs.

---

## Project Structure

```text
expense_tracker/
├── assets/
│   └── icons/                 # Custom SVG icons for categories and navigation
├── lib/
│   ├── main.dart              # Application entry point
│   ├── Model/
│   │   └── expense_model.dart # Expense and Category models
│   ├── utils/
│   │   ├── app_assets.dart    # Centralized asset references
│   │   ├── app_colors.dart    # Theme and category color definitions
│   │   └── global.dart        # In-memory mock data and global state
│   └── view/
│       ├── components/        # Reusable custom buttons and text fields
│       └── screens/
│           ├── auth/          # Login and signup screens
│           └── main_screen/   # Dashboard, add expense, edit, and tab screens
├── pubspec.yaml               # Package dependencies and asset configuration
└── README.md                  # Project documentation
```

---

## Built With

- Flutter: Cross-platform UI framework.
- Dart: Programming language.
- flutter_svg: Vector graphic rendering for category icons.
- google_fonts: Typography styling.
- intl: Date and currency formatting.

---

## Getting Started

### Prerequisites

- Flutter SDK (version 3.11.4 or higher)
- Dart SDK
- An Android emulator, physical device, iOS simulator, or browser

### Installation and Run

1. Open your terminal and change into the project directory:
   ```bash
   cd expense_tracker
   ```

2. Install packages:
   ```bash
   flutter pub get
   ```

3. Run the application:
   ```bash
   flutter run
   ```

---

## Author

Muqadas Akram  
Digital Skills Training Program (DSTP)
