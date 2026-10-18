# StudyNest - Assignment 1

StudyNest is a Flutter-based mobile application created for Assignment 1 under the Digital Skills Training Program (DSTP).

This project focuses on translating a Figma design into functional Flutter UI components, implementing screen navigation, and handling basic client-side interactions such as creating and listing study sessions. It is designed as a frontend interface project rather than a full-scale production application with backend services.

---

## Figma Design Reference

The user interface was built by following this Figma design:
- Design Link: https://www.figma.com/design/F8FqJ5cbcCDzD6poRPG2pI/DSTP-Quiz3?node-id=2205-6&t=PvFaPr64mYudeinc-0

Efforts were made to replicate the layout, color palette, typography, and card components as closely as possible to the design board.

---

## What is Implemented

### Authentication Flow
- Login screen with email and password input fields, social login buttons styling, and navigation to registration.
- Sign up screen with custom form fields and action buttons.

### Main Navigation and Dashboard
- Bottom navigation bar allowing users to switch between the Home dashboard and the Profile screen.
- Home screen displaying a list of current and upcoming study sessions, category chips, and overview cards.
- Profile screen showing user information and study statistics.

### Add Study Session Bottom Sheet
- A modal bottom sheet triggered from the action button.
- Title and description input fields.
- Date picker dialog allowing users to pick a session date.
- Time picker dialog allowing users to pick a session time.
- Adding a session dynamically updates the list displayed on the Home screen in real time.

### Reusable Widgets
- CustomButton: A reusable button component used across authentication and session creation.
- CustomTextField: Standardized input field styling.
- CustomHeader: Consistent header widget for auth screens.

---

## Tech Stack and Dependencies

- Flutter SDK (Dart)
- Material 3 Design
- google_fonts: Typography styling
- flutter_svg: Rendering SVG vector assets
- intl: Date and time formatting
- cupertino_icons: Additional icon assets

---

## Getting Started

To run the project locally on your machine:

1. Clone the repository:
   ```bash
   git clone https://github.com/Muqadas1234/Flutter_projects.git
   ```

2. Navigate to the project directory:
   ```bash
   cd "Assignment 1 StudyNest/studynest"
   ```

3. Fetch required packages:
   ```bash
   flutter pub get
   ```

4. Run the app:
   ```bash
   flutter run
   ```

---

## Project Structure

```text
lib/
|-- Model/
|   `-- studynest_model.dart        # Session data model
|-- utils/
|   |-- app_assets.dart             # Asset constants
|   |-- app_colors.dart             # Color constants from Figma
|   `-- global.dart                 # Shared in-memory sessions list
|-- view/
|   |-- components/                 # Reusable UI widgets
|   `-- screens/
|       |-- auth/                   # Login and Signup screens
|       `-- main_screen/            # Bottom nav, Home, and Profile screens
`-- main.dart                       # Application entry point
```

---

## Author

Developed by Muqaddas Akram as part of the Digital Skills Training Program (DSTP) - Assignment 1.
