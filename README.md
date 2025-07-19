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
│   ├── main.dart
│   └── pages/
│       ├── homepage.dart
│       ├── loginpage.dart
│       └── login_carousel.dart
├── assets/
│   ├── images/                  
│   └── fonts/                   
├── test/
│   └── widget_test.dart
├── android/
├── ios/
├── web/
├── windows/
├── macos/
└── linux/
```

## Getting Started

1. **Install Flutter:** [Flutter installation guide](https://docs.flutter.dev/get-started/install)
2. **Clone this repo:**
   ```sh
   git clone https://github.com/Sriniketh1103/Spence.git
   cd Spence
   ```
3. **Install dependencies:**
   ```sh
   flutter pub get
   ```
4. **Run the app:**
   ```sh
   flutter run
   ```

## Customization

- To change onboarding images, replace files in `assets/images/`.
- To update the launch screen, see `ios/Runner/Assets.xcassets/LaunchImage.imageset/` and `ios/Runner/Base.lproj/Main.storyboard`.
- Fonts can be managed in `assets/fonts/` and configured in `pubspec.yaml`.
