```markdown
# 💳 Paymob Flutter SDK – Seamless Native Payment Integration

**Paymob Flutter SDK** is a professional wrapper around the **Paymob V2 Native SDKs** designed to **simplify** payment processing in Flutter apps. It provides **secure transaction handling, customizable native UI, and real-time status updates**—all while maintaining high performance on both Android and iOS.

With this SDK, you can integrate **Card Payments, Wallets, and Installments** with minimal code, ensuring a **scalable and secure** checkout experience for your users.

[![Pub Package](https://img.shields.io/badge/Pub%20get-paymob__flutter__sdk-blue)](https://pub.dev/packages/paymob_flutter_sdk)
![Build Status](https://img.shields.io/badge/Build-Passing-teal)
[![Creator](https://img.shields.io/badge/Creator-Moataz%20Yusuf-blue)](https://github.com/motazyusuf)

---

## ⚡ Quick Start: Secure Payment Integration

Initialize the service and launch the native payment UI in just a few lines of code.

```dart
// 1. Initialize the service singleton
final _paymobService = PaymobService();

// 2. Obtain credentials (Ideally generated from your backend for security)
final credentials = await _paymobService.createPaymentIntention(
  useBackend: true, // Set to true to use a clientSecret from your server
  publicKey: "YOUR_PUBLIC_KEY",
  clientSecret: "CLIENT_SECRET_FROM_BACKEND", 
);

// 3. Launch the Native SDK UI
PaymobPaymentResult result = await _paymobService.payWithPaymob(
  publicKey: credentials['public_key']!,
  clientSecret: credentials['client_secret']!,
  customization: PaymobCustomization(
    appName: "My Flutter Store",
    buttonBackgroundColor: Colors.blueAccent, // Custom button color
    buttonTextColor: Colors.white,
  ),
);

// 4. Handle the payment result
if (result.isSuccessful) {
  // Payment succeeded! Access transaction details here
  print("Transaction ID: ${result.transactionDetails?['id']}");
} else if (result.isRejected) {
  print("Payment was declined by the issuer");
}

```

---

## 🔥 Why Choose Paymob Flutter SDK?

This plugin bridges the gap between Flutter and Paymob’s native capabilities, offering a robust solution for developers in the MENA region.

✅ **Native UI Support** – Uses native Android Activities and iOS ViewControllers for the most reliable payment experience.

✅ **Hybrid Security** – Supports secure **Backend-to-Backend** intentions to keep your Secret Keys safe.

✅ **Highly Customizable** – Match the payment screens to your brand with custom colors and app names.

✅ **Comprehensive Callbacks** – Detailed `PaymobPaymentResult` providing success, rejection, or pending states.

✅ **Automated Setup** – Android Maven repositories and iOS XCFrameworks are handled automatically during build.

---

## 🛠 Platform Configuration

To ensure compatibility with the latest native Paymob V2 SDKs, please apply the following settings:

### **Android**

* **Java Version:** Your project must use **Java 17**.
* **Compile SDK:** `35`
* **Min SDK:** `23`
* **Note:** The plugin automatically injects the required Maven repository from the Paymob Android repo.

### **iOS**

* **Minimum Deployment Target:** `13.0`
* **Swift Version:** `5.0`
* **Pod Install:** The `PaymobSDK.xcframework` is automatically downloaded and linked during the `pod install` process.

---

## 📖 Feature Breakdown

### 🎨 UI Customization

You can pass a `PaymobCustomization` object to the `payWithPaymob` method to tailor the interface:

| Parameter | Type | Description |
| --- | --- | --- |
| `appName` | `String?` | Title displayed at the top of the payment screen. |
| `buttonBackgroundColor` | `Color?` | The background color of the main "Pay" button. |
| `buttonTextColor` | `Color?` | The color of the text inside the "Pay" button. |
| `showSaveCard` | `bool?` | Whether to show the checkbox to save card data. |
| `saveCardDefault` | `bool?` | Whether the "Save Card" checkbox is checked by default. |

### 🛡 Security First

The service includes a built-in safety check. Using `useBackend: false` is available for rapid prototyping but triggers a warning in logs, as it requires exposing your **Secret Key** within the app.

> **⚠️ WARNING:** Never use legacy mode (insecure) in production. Always generate payment intentions on your server-side.

---

## ❗ Report Issues & Contribute

🔍 **Found a bug? Have a feature request?** Report issues on the **[GitHub Issues page](https://www.google.com/search?q=https://github.com/motazyusuf/paymob_flutter_sdk/issues)**.

When reporting an issue, please provide:

* A clear description of the issue.
* **Steps to reproduce** (if applicable).
* The **Paymob version** in use.
* Relevant **code snippets or screenshots**.

---

## 👤 Created By

Made with ❤️ by **Moataz Yusuf** 🔗 **[GitHub](https://www.google.com/url?sa=E&source=gmail&q=https://github.com/motazyusuf)** 📧 **[Email](mailto:motazyusuf@gmail.com)** 📜 **License:** MIT – See **[LICENSE](https://www.google.com/search?q=https://github.com/motazyusuf/paymob_flutter_sdk/blob/master/LICENSE)**.

```

```
