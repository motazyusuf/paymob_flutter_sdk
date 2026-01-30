# Paymob Flutter SDK

[![pub package](https://img.shields.io/pub/v/paymob_flutter_sdk.svg)](https://pub.dev/packages/paymob_flutter_sdk)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A comprehensive Flutter plugin for integrating Paymob payment gateway with native Android and iOS SDK support. Accept payments seamlessly in your Flutter applications with full customization support.

## ✨ Features

- 🚀 **Easy Integration** - Simple API with minimal setup required
- 📱 **Native SDKs** - Uses official Paymob Android and iOS SDKs under the hood
- 🎨 **Customizable UI** - Customize button colors, app name, and more
- 💳 **Save Card Feature** - Optional card saving functionality
- 🔒 **Secure Payments** - Industry-standard security with PCI compliance
- ✅ **Type-Safe Results** - Strongly typed payment result handling
- 🌍 **Multi-Currency** - Support for multiple currencies (EGP, USD, etc.)
- 📊 **Comprehensive Error Handling** - Clear error messages and states
- 🔄 **Null Safety** - Fully migrated to null-safe Dart
- 🛡️ **Backend Security Mode** - Optional secure backend integration to protect your secret keys

## 🎯 Supported Platforms

| Platform | Minimum Version | Status |
|----------|----------------|--------|
| Android  | API 21 (5.0)   | ✅ Supported |
| iOS      | 13.0           | ✅ Supported |

## 📦 Installation

Add this to your package's `pubspec.yaml` file:
```yaml
dependencies:
  paymob_flutter_sdk: ^1.0.0
```

Then run:
```bash
flutter pub get
```

### Android Setup

#### ⚠️ Important: Configure Maven Repositories

You **must** add the Paymob Maven repository to your Android project for the SDK to work properly.

Open your Android project's `android/settings.gradle.kts` file and add the Paymob repositories:
```gradle
pluginManagement {
    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
        maven { 
            url = uri("https://raw.githubusercontent.com/motazyusuf/paymob-android-repo/main/") 
        }
        maven { 
            url = uri("https://jitpack.io") 
        }
    }
}

dependencyResolutionManagement {
    repositoriesMode.set(RepositoriesMode.PREFER_SETTINGS)
    repositories {
        google()
        mavenCentral()
        maven { 
            url = uri("https://storage.googleapis.com/download.flutter.io") 
        }
        maven { 
            url = uri("https://raw.githubusercontent.com/motazyusuf/paymob-android-repo/main/") 
        }
        maven { 
            url = uri("https://jitpack.io") 
        }
    }
}
```

**What this does:**
- Adds the Paymob Android repository to download the native SDK
- Adds JitPack for additional dependencies
- Ensures Flutter can access all required packages



**Minimum Requirements:**
- minSdkVersion: 21
- Kotlin: 2.1.0+

### iOS Setup

No additional setup required! The plugin automatically includes the Paymob iOS SDK.

**Minimum Requirements:**
- iOS: 12.0+
- Swift: 5.0+


## 🚀 Quick Start

### 1. Import the package
```dart
import 'package:paymob_flutter_sdk/paymob_flutter_sdk.dart';
```

### 2. Initialize the service
```dart
final paymobService = PaymobService();
```

### 3. Create a payment intention

#### 🛡️ Secure Mode (Recommended for Production)

**For production apps, use backend mode to keep your secret key secure:**
```dart
// Step 1: Get credentials from YOUR backend
final response = await http.post(
  Uri.parse('https://your-backend.com/api/create-payment-intention'),
  headers: {'Content-Type': 'application/json'},
  body: jsonEncode({
    'amount': 100,
    'currency': 'EGP',
    'billingData': {
      'first_name': 'John',
      'last_name': 'Doe',
      'email': 'customer@example.com',
      'phone_number': '+201000000000',
      'apartment': 'NA',
      'floor': 'NA',
      'street': 'NA',
      'building': 'NA',
      'shipping_method': 'NA',
      'postal_code': 'NA',
      'city': 'Cairo',
      'country': 'EG',
      'state': 'NA',
    },
  }),
);

final backendCreds = jsonDecode(response.body);

// Step 2: Use SDK with backend credentials
final credentials = await paymobService.createPaymentIntention(
  useBackend: true, // ✅ SECURE MODE
  publicKey: backendCreds['publicKey'],
  clientSecret: backendCreds['clientSecret'],
);
```

#### ⚠️ Direct Mode (For Testing Only)

**Only use this mode for development/testing. NOT recommended for production:**
```dart
final credentials = await paymobService.createPaymentIntention(
  useBackend: false, // ⚠️ NOT SECURE - Secret key exposed in app
  secretKey: 'your_secret_key',
  publicKey: 'your_public_key',
  amount: 100,
  currency: 'EGP',
  integrationId: 1234567,
  billingData: {
    'first_name': 'John',
    'last_name': 'Doe',
    'email': 'customer@example.com',
    'phone_number': '+201000000000',
    'apartment': 'NA',
    'floor': 'NA',
    'street': 'NA',
    'building': 'NA',
    'shipping_method': 'NA',
    'postal_code': 'NA',
    'city': 'Cairo',
    'country': 'EG',
    'state': 'NA',
  },
);
```

### 4. Launch the payment SDK
```dart
final result = await paymobService.payWithPaymob(
  publicKey: credentials['publicKey']!,
  clientSecret: credentials['clientSecret']!,
  customization: PaymobCustomization(
    appName: 'My Store',
    buttonBackgroundColor: Colors.blue,
    buttonTextColor: Colors.white,
    showSaveCard: true,
    saveCardDefault: false,
  ),
);
```

## 🛡️ Security Best Practices

### Why Backend Mode?

Your Paymob **secret key** should never be stored in your Flutter app because:
- Mobile apps can be decompiled and reverse-engineered
- Attackers can extract your secret key from the app binary
- Compromised keys can lead to unauthorized payments and account access

### Setting Up Backend Mode

**1. Create a backend endpoint** 

**2. Use backend mode in Flutter**:
```dart
// Your Flutter app
final response = await http.post(
  Uri.parse('https://your-backend.com/api/create-payment-intention'),
  headers: {'Content-Type': 'application/json'},
  body: jsonEncode({
    'amount': 100,
    'currency': 'EGP',
    'billingData': billingData,
  }),
);

final backendCreds = jsonDecode(response.body);

final credentials = await paymobService.createPaymentIntention(
  useBackend: true, // ✅ Secret key stays on server
  publicKey: backendCreds['publicKey'],
  clientSecret: backendCreds['clientSecret'],
);
```

### Security Checklist

- ✅ **Production**: Always use `useBackend: true`
- ✅ Store secret keys in environment variables on your backend
- ✅ Use HTTPS for all backend communication
- ✅ Implement authentication for your backend API
- ✅ Validate all inputs on the backend
- ❌ **Never** hardcode secret keys in your Flutter app
- ❌ **Never** commit secrets to version control
- ❌ **Never** use `useBackend: false` in production

## 📖 Complete Example

### Secure Production Example
```dart
import 'package:flutter/material.dart';
import 'package:paymob_flutter_sdk/paymob_flutter_sdk.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Paymob Secure Payment')),
        body: Center(
          child: ElevatedButton(
            child: Text('Pay Now'),
            onPressed: () async {
              // Step 1: Get credentials from backend
              final response = await http.post(
                Uri.parse('https://your-backend.com/api/create-payment-intention'),
                headers: {'Content-Type': 'application/json'},
                body: jsonEncode({
                  'amount': 100,
                  'currency': 'EGP',
                  'billingData': {
                    'first_name': 'Test',
                    'last_name': 'User',
                    'email': 'test@test.com',
                    'phone_number': '+201000000000',
                    'apartment': 'NA',
                    'floor': 'NA',
                    'street': 'NA',
                    'building': 'NA',
                    'shipping_method': 'NA',
                    'postal_code': 'NA',
                    'city': 'Cairo',
                    'country': 'EG',
                    'state': 'NA',
                  },
                }),
              );

              final backendCreds = jsonDecode(response.body);

              // Step 2: Create payment intention securely
              final service = PaymobService();
              final creds = await service.createPaymentIntention(
                useBackend: true,
                publicKey: backendCreds['publicKey'],
                clientSecret: backendCreds['clientSecret'],
              );

              // Step 3: Process payment
              final result = await service.payWithPaymob(
                publicKey: creds['publicKey']!,
                clientSecret: creds['clientSecret']!,
                customization: PaymobCustomization(
                  appName: 'My Flutter App',
                  buttonBackgroundColor: Colors.blue,
                  buttonTextColor: Colors.white,
                  saveCardDefault: true,
                  showSaveCard: true,
                ),
              );

              if (result.isSuccessful) {
                print('Payment successful!');
              }
            },
          ),
        ),
      ),
    );
  }
}
```

### Testing/Development Example
```dart
import 'package:flutter/material.dart';
import 'package:paymob_flutter_sdk/paymob_flutter_sdk.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Paymob Test')),
        body: Center(
          child: ElevatedButton(
            child: Text('Test Payment'),
            onPressed: () async {
              final service = PaymobService();
              
              // ⚠️ Only for testing - NOT for production
              final creds = await service.createPaymentIntention(
                useBackend: false,
                secretKey: 'YOUR SECRET KEY',
                publicKey: 'YOUR PUBLIC KEY',
                amount: 100,
                currency: 'EGP',
                integrationId: 1234567,
                billingData: {
                  'first_name': 'Test',
                  'last_name': 'User',
                  'email': 'test@test.com',
                  'phone_number': '+201000000000',
                  'apartment': 'NA',
                  'floor': 'NA',
                  'street': 'NA',
                  'building': 'NA',
                  'shipping_method': 'NA',
                  'postal_code': 'NA',
                  'city': 'Cairo',
                  'country': 'EG',
                  'state': 'NA',
                },
              );

              final result = await service.payWithPaymob(
                publicKey: creds['publicKey']!,
                clientSecret: creds['clientSecret']!,
                customization: PaymobCustomization(
                  appName: 'My Flutter App',
                  buttonBackgroundColor: Colors.blue,
                  buttonTextColor: Colors.white,
                  saveCardDefault: true,
                  showSaveCard: true,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
```

## 🎨 Customization Options

### PaymobCustomization

Customize the payment UI to match your app's branding:
```dart
PaymobCustomization(
  appName: 'My Store',                    // Custom app name
  buttonBackgroundColor: Colors.blue,      // Button background color
  buttonTextColor: Colors.white,           // Button text color
  showSaveCard: true,                      // Show save card option
  saveCardDefault: false,                  // Default save card state
)
```
## 🔐 Getting Your Paymob Credentials

1. **Sign up** at [Paymob Dashboard](https://accept.paymob.com/)
2. **Get your API keys**:
   - Public Key: `egy_pk_test_...`
   - Secret Key: `egy_sk_test_...`
3. **Get Integration ID**:
   - Go to Settings → Payment Integrations
   - Copy your integration ID

### Test Mode

For testing, use test credentials provided by Paymob:
- Test cards are available in Paymob documentation
- No real money is charged in test mode

### Production Mode

For production:
1. Switch to live API keys
2. Use live integration IDs
3. Complete Paymob verification process
4. **Always use backend mode** (`useBackend: true`)

## 🌍 Supported Currencies

The plugin supports multiple currencies including:
- EGP (Egyptian Pound)
- USD (US Dollar)
- SAR (Saudi Riyal)
- AED (UAE Dirham)
- And more...

Check [Paymob documentation](https://accept.paymob.com/docs) for the complete list.

## 🔧 API Reference

### PaymobService

#### createPaymentIntention()

Creates a payment intention and returns credentials for the SDK.

**Parameters:**

**Secure Mode (useBackend: true):**
- `useBackend` (bool): Set to `true` for secure backend mode (default: `true`)
- `publicKey` (String): Your Paymob public key
- `clientSecret` (String): Client secret obtained from your backend

**Direct Mode (useBackend: false) - Not recommended for production:**
- `useBackend` (bool): Set to `false` for direct mode
- `secretKey` (String): Your Paymob secret key
- `publicKey` (String): Your Paymob public key
- `amount` (int): Payment amount in currency's main unit
- `currency` (String): Currency code (e.g., 'EGP')
- `integrationId` (int): Your Paymob integration ID
- `billingData` (Map<String, dynamic>): Customer billing information
- `items` (List<Map<String, dynamic>>?): Optional list of items

**Returns:** `Future<Map<String, String>>` with `publicKey` and `clientSecret`

#### payWithPaymob()

Launches the native payment SDK.

**Parameters:**
- `publicKey` (String): Your Paymob public key
- `clientSecret` (String): Client secret from payment intention
- `customization` (PaymobCustomization?): Optional UI customization

**Returns:** `Future<PaymobPaymentResult>`

## ⚠️ Error Handling

Always wrap payment calls in try-catch blocks:
```dart
try {
  final result = await paymobService.payWithPaymob(
    publicKey: publicKey,
    clientSecret: clientSecret,
  );
  
  // Handle result
} catch (e) {
  print('Payment error: $e');
  // Show error to user
}
```

## 📱 Platform-Specific Notes

### Android
- The plugin uses Paymob Android SDK 1.6.9
- Supports Android 5.0 (API 21) and above
- Works with AndroidX

### iOS
- The plugin uses PaymobSDK 1.0.2
- Supports iOS 13.0 and above
- Requires Swift 5.0+

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📞 Support

- **Issues**: [GitHub Issues](https://github.com/motazyusuf/paymob_flutter_sdk/issues)
- **Paymob Documentation**: [Paymob Docs](https://accept.paymob.com/docs)
- **Email**: motazyusuf@gmail.com

## 🙏 Acknowledgments

- Paymob for providing the payment gateway service
- The Flutter team for the amazing framework
- All contributors who help improve this package

## 📈 Changelog

See [CHANGELOG.md](CHANGELOG.md) for a list of changes.


Made with ❤️ 

**Star ⭐ this repo if you find it useful!**
