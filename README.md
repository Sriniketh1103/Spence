# Spence

> Your Budget, On Track

Spence is a modern, cross-platform budgeting app built with Flutter. It helps you track expenses, visualize your budget, set financial goals, and stay on top of your spending with a beautiful and intuitive UI.

## Features

- Google sign-in for secure authentication
- Carousel onboarding with illustrations and captions
- Responsive and expressive UI with gradients, shadows, and custom fonts
- Track expenses and visualize your budget
- Set financial goals and receive notifications
- Cross-platform: Android, iOS, Web, Windows, macOS, Linux

## Folder Structure

```
spence/
├── lib/
│   ├── main.dart                  # App entry point
│   ├── firebase_options.dart      # Firebase config (auto-generated)
│   ├── pages/
│   │   ├── mainpage.dart          # Handles auth state and routing
│   │   ├── homepage.dart          # Main app UI after login
│   │   ├── loginpage.dart         # Login and onboarding UI
│   │   └── login_carousel.dart    # Carousel widget for onboarding
│   └── services/
│       └── authservices/
│           └── googlesignin.dart  # Google sign-in logic
├── assets/
│   ├── images/                    # App images and illustrations
│   └── fonts/                     # Custom fonts (e.g., CalSans)
├── test/
│   └── widget_test.dart           # Widget tests
├── android/                       # Android-specific code
├── ios/                           # iOS-specific code
├── web/                           # Web-specific code
├── windows/                       # Windows-specific code
├── macos/                         # macOS-specific code
└── linux/                         # Linux-specific code
```

