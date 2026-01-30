# Paymob Flutter SDK

A Flutter plugin for integrating Paymob payment gateway with native Android and iOS SDKs support.

## Features

- ✅ Native Android SDK integration
- ✅ Native iOS SDK integration  
- ✅ Payment intention API support
- ✅ Customizable payment UI (colors, app name)
- ✅ Save card functionality
- ✅ Comprehensive error handling
- ✅ Type-safe payment results

## Getting Started

### Installation

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

1. Add Paymob SDK repository in your `android/build.gradle`:

```gradle
allprojects {
    repositories {
        google()
        mavenCentral()
        maven { url 'https://jitpack.io' }
    }
}
```

2. Set minimum SDK version in `android/app/build.gradle`:

```gradle
android {
    defaultConfig {
        minSdkVersion 21
    }
}
```

### iOS Setup

1. Set minimum iOS version in `ios/Podfile`:

```ruby
platform :ios, '12.0'
```

2. Run pod install:

```bash
cd ios
pod install
```

## Usage

### Basic Example

```dart
import 'package:paymob_flutter_sdk/paymob_flutter_sdk.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  final paymobService = PaymobService();

  Future<void> initiatePayment() async {
    try {
      // Step 1: Create payment intention
      final credentials = await paymobService.createPaymentIntention(
        secretKey: 'your_secret_key',
        publicKey: 'your_public_key',
        amount: 100, // Amount in EGP (not cents)
        currency: 'EGP',
        integrationId: 1234567,
        billingData: {
          'apartment': 'NA',
          'email': 'customer@example.com',
          'floor': 'NA',
          'first_name': 'John',
          'street': 'NA',
          'building': 'NA',
          'phone_number': '+201000000000',
          'shipping_method': 'NA',
          'postal_code': 'NA',
          'city': 'Cairo',
          'country': 'EG',
          'last_name': 'Doe',
          'state': 'NA'
        },
      );

      // Step 2: Launch payment SDK
      final result = await paymobService.payWithPaymob(
        publicKey: credentials['publicKey']!,
        clientSecret: credentials['clientSecret']!,
        customization: PaymobCustomization(
          appName: 'My App',
          buttonBackgroundColor: Colors.blue,
          buttonTextColor: Colors.white,
          showSaveCard: true,
          saveCardDefault: false,
        ),
      );

      // Step 3: Handle result
      if (result.isSuccessful) {
        print('Payment successful!');
        print('Transaction details: ${result.transactionDetails}');
      } else if (result.isRejected) {
        print('Payment rejected');
      } else if (result.isPending) {
        print('Payment pending');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Paymob Payment')),
      body: Center(
        child: ElevatedButton(
          onPressed: initiatePayment,
          child: Text('Pay Now'),
        ),
      ),
    );
  }
}
```

### Advanced Customization

```dart
final result = await paymobService.payWithPaymob(
  publicKey: publicKey,
  clientSecret: clientSecret,
  customization: PaymobCustomization(
    appName: 'My Store',
    buttonBackgroundColor: Color(0xFF1976D2),
    buttonTextColor: Colors.white,
    showSaveCard: true,
    saveCardDefault: false,
  ),
);
```

## API Reference

### PaymobService

#### `createPaymentIntention()`

Creates a payment intention and returns credentials for the SDK.

**Parameters:**
- `secretKey` (String): Your Paymob secret key
- `publicKey` (String): Your Paymob public key
- `amount` (int): Payment amount in currency's main unit
- `currency` (String): Currency code (e.g., 'EGP')
- `integrationId` (int): Your Paymob integration ID
- `billingData` (Map<String, dynamic>): Customer billing information
- `items` (List<Map<String, dynamic>>?, optional): List of purchase items

**Returns:** `Future<Map<String, String>>` with `publicKey` and `clientSecret`

#### `payWithPaymob()`

Launches the native payment SDK.

**Parameters:**
- `publicKey` (String): Your Paymob public key
- `clientSecret` (String): Client secret from payment intention
- `customization` (PaymobCustomization?, optional): UI customization options

**Returns:** `Future<PaymobPaymentResult>`

### PaymobPaymentResult

**Properties:**
- `status` (PaymentStatus): Payment status (successful, rejected, pending, unknown)
- `transactionDetails` (Map<String, dynamic>?): Transaction details (only for successful payments)
- `errorMessage` (String?): Error message if applicable

**Getters:**
- `isSuccessful` (bool): Returns true if payment was successful
- `isRejected` (bool): Returns true if payment was rejected
- `isPending` (bool): Returns true if payment is pending

### PaymobCustomization

**Properties:**
- `appName` (String?): Custom app name to display
- `buttonBackgroundColor` (Color?): Background color for payment button
- `buttonTextColor` (Color?): Text color for payment button
- `saveCardDefault` (bool?): Whether to save card by default
- `showSaveCard` (bool?): Whether to show save card option

## Testing

Get your test credentials from [Paymob Dashboard](https://accept.paymob.com/):

```dart
// Test credentials
publicKey: 'egy_pk_test_...'
secretKey: 'egy_sk_test_...'
integrationId: 1234567 // Your test integration ID
```

Test cards are available in the Paymob documentation.

## Error Handling

```dart
try {
  final result = await paymobService.payWithPaymob(
    publicKey: publicKey,
    clientSecret: clientSecret,
  );
  
  switch (result.status) {
    case PaymentStatus.successful:
      // Handle success
      break;
    case PaymentStatus.rejected:
      // Handle rejection
      break;
    case PaymentStatus.pending:
      // Handle pending
      break;
    case PaymentStatus.unknown:
      // Handle error
      print('Error: ${result.errorMessage}');
      break;
  }
} catch (e) {
  // Handle exception
  print('Exception: $e');
}
```

## Troubleshooting

### Android

**Issue:** Build fails with "Could not resolve dependency"
**Solution:** Make sure you added the JitPack repository in your `android/build.gradle`

**Issue:** MinSdkVersion error
**Solution:** Set `minSdkVersion 21` or higher in `android/app/build.gradle`

### iOS

**Issue:** Pod install fails
**Solution:** 
```bash
cd ios
pod deintegrate
pod install --repo-update
```

**Issue:** Swift version error
**Solution:** Make sure you're using Xcode 12 or later with Swift 5.0+

## Requirements

- Flutter: >=3.0.0
- Dart: >=3.0.0
- Android: minSdkVersion 21
- iOS: 12.0+

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

For issues and feature requests, please visit the [GitHub repository](https://github.com/yourusername/paymob_flutter_sdk/issues).

For Paymob-specific questions, visit [Paymob Support](https://accept.paymob.com/).
