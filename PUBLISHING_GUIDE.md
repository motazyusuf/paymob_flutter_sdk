# Publishing Guide for Paymob Flutter SDK

## Complete Step-by-Step Guide to Publish on pub.dev

### Prerequisites

1. **Create a pub.dev account**: Go to https://pub.dev and sign in with your Google account
2. **Verify your email**: Make sure your email is verified on pub.dev
3. **Install Flutter**: Ensure you have Flutter SDK installed and updated

### Step 1: Prepare Your Plugin

1. **Update pubspec.yaml**:
   - Set the correct version (start with 1.0.0)
   - Update homepage URL with your GitHub repository
   - Update description
   - Add your name and email

```yaml
name: paymob_flutter_sdk
description: A Flutter plugin for integrating Paymob payment gateway with native Android and iOS SDKs support.
version: 1.0.0
homepage: https://github.com/YOUR_USERNAME/paymob_flutter_sdk
repository: https://github.com/YOUR_USERNAME/paymob_flutter_sdk

environment:
  sdk: '>=3.0.0 <4.0.0'
  flutter: ">=3.0.0"
```

2. **Update LICENSE**:
   - Replace [Your Name] with your actual name in the LICENSE file

3. **Verify all files are in place**:
   ```
   paymob_flutter_sdk/
   ├── android/
   │   ├── build.gradle
   │   └── src/main/kotlin/com/paymob/flutter/paymob_flutter_sdk/
   │       └── PaymobFlutterSdkPlugin.kt
   ├── ios/
   │   ├── Classes/
   │   │   └── PaymobFlutterSdkPlugin.swift
   │   └── paymob_flutter_sdk.podspec
   ├── lib/
   │   ├── paymob_flutter_sdk.dart
   │   └── src/
   │       ├── models/
   │       │   ├── paymob_payment_result.dart
   │       │   └── paymob_customization.dart
   │       └── paymob_service.dart
   ├── example/
   │   ├── lib/
   │   │   └── main.dart
   │   └── pubspec.yaml
   ├── CHANGELOG.md
   ├── LICENSE
   ├── README.md
   └── pubspec.yaml
   ```

### Step 2: Create GitHub Repository

1. **Create a new repository on GitHub**:
   - Go to https://github.com/new
   - Name it: `paymob_flutter_sdk`
   - Add description: "Flutter plugin for Paymob payment gateway"
   - Make it public
   - Don't initialize with README (you already have one)

2. **Push your code**:
   ```bash
   cd paymob_flutter_sdk
   git init
   git add .
   git commit -m "Initial commit"
   git branch -M main
   git remote add origin https://github.com/YOUR_USERNAME/paymob_flutter_sdk.git
   git push -u origin main
   ```

### Step 3: Test Your Plugin Locally

1. **Create a test app**:
   ```bash
   flutter create test_paymob_app
   cd test_paymob_app
   ```

2. **Add your plugin as a path dependency**:
   ```yaml
   dependencies:
     paymob_flutter_sdk:
       path: ../paymob_flutter_sdk
   ```

3. **Test thoroughly**:
   - Test on Android device/emulator
   - Test on iOS device/simulator
   - Test all payment scenarios (success, rejection, pending)
   - Test error handling

### Step 4: Validate Your Package

1. **Run pub publish dry-run**:
   ```bash
   cd paymob_flutter_sdk
   flutter pub publish --dry-run
   ```

2. **Fix any issues** reported by the dry-run:
   - Missing files
   - Invalid pubspec.yaml
   - Documentation issues
   - Code analysis warnings

3. **Check package score**:
   - Make sure your README.md is comprehensive
   - Add example usage in README
   - Document all public APIs
   - Add screenshots if possible

### Step 5: Publish to pub.dev

1. **Publish the package**:
   ```bash
   flutter pub publish
   ```

2. **Confirm publication**:
   - You'll be asked to confirm the publication
   - Type 'y' to proceed
   - You'll be redirected to a browser for authentication

3. **Wait for processing**:
   - pub.dev will process your package
   - This usually takes a few minutes

### Step 6: Verify Publication

1. **Check your package**:
   - Go to https://pub.dev/packages/paymob_flutter_sdk
   - Verify all information is correct

2. **Check package score**:
   - pub.dev will analyze your package
   - Aim for 100+ points
   - Follow recommendations to improve score

### Step 7: Update Documentation

1. **Add pub.dev badge to README**:
   ```markdown
   [![pub package](https://img.shields.io/pub/v/paymob_flutter_sdk.svg)](https://pub.dev/packages/paymob_flutter_sdk)
   ```

2. **Update homepage links**:
   - Make sure all links in README work
   - Add links to API documentation
   - Add links to example app

### Step 8: Maintain Your Package

1. **Respond to issues**:
   - Monitor GitHub issues
   - Respond promptly to questions
   - Fix reported bugs

2. **Keep dependencies updated**:
   - Update Paymob SDK versions when available
   - Test with new Flutter versions
   - Update dependencies regularly

3. **Release updates**:
   - Update CHANGELOG.md
   - Increment version in pubspec.yaml
   - Run `flutter pub publish`

## Version Numbering Guide

Follow semantic versioning (MAJOR.MINOR.PATCH):

- **PATCH** (1.0.1): Bug fixes, small improvements
- **MINOR** (1.1.0): New features, backward compatible
- **MAJOR** (2.0.0): Breaking changes

## Best Practices

### Documentation

- **README.md**: Comprehensive with examples
- **API documentation**: Document all public classes and methods
- **CHANGELOG.md**: Keep it updated with each release
- **Example app**: Provide a working example

### Code Quality

- **Null safety**: Use null-safe Dart code
- **Error handling**: Handle all error cases
- **Testing**: Write unit and integration tests
- **Code style**: Follow Dart style guide

### Maintenance

- **Responsive**: Reply to issues within 1-2 days
- **Updates**: Release updates for critical bugs quickly
- **Compatibility**: Test with new Flutter/Dart versions
- **Documentation**: Keep documentation in sync with code

## Common Issues and Solutions

### Issue: "Package validation failed"

**Solution**: Run `flutter pub publish --dry-run` and fix all reported issues

### Issue: "Version already exists"

**Solution**: Increment version in pubspec.yaml

### Issue: "Missing documentation"

**Solution**: Add dartdoc comments to all public APIs:
```dart
/// This is a documentation comment
/// 
/// Example:
/// ```dart
/// final result = await paymobService.payWithPaymob(...);
/// ```
```

### Issue: "Low package score"

**Solution**:
- Add comprehensive README
- Add example app
- Write tests
- Follow Dart conventions
- Update dependencies

## Checklist Before Publishing

- [ ] All code is tested and working
- [ ] README.md is comprehensive
- [ ] CHANGELOG.md is updated
- [ ] LICENSE file has correct information
- [ ] pubspec.yaml has correct info (version, homepage, description)
- [ ] Example app works correctly
- [ ] `flutter pub publish --dry-run` passes
- [ ] Code follows Dart style guide
- [ ] All public APIs are documented
- [ ] GitHub repository is public
- [ ] All files are committed and pushed

## After Publishing

1. **Announce your package**:
   - Share on Flutter community
   - Write a blog post
   - Share on social media

2. **Monitor metrics**:
   - Package downloads
   - Package score
   - GitHub stars/forks

3. **Gather feedback**:
   - Read user reviews
   - Monitor GitHub issues
   - Implement feature requests

## Additional Resources

- [pub.dev Publishing Guide](https://dart.dev/tools/pub/publishing)
- [Flutter Plugin Development](https://docs.flutter.dev/development/packages-and-plugins/developing-packages)
- [Effective Dart](https://dart.dev/guides/language/effective-dart)
- [Package Layout Conventions](https://dart.dev/tools/pub/package-layout)

---

Good luck with your package! 🚀
