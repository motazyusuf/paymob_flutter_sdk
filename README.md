# Paymob Flutter SDK

[![pub package](https://img.shields.io/pub/v/paymob_flutter_sdk.svg)](https://pub.dev/packages/paymob_flutter_sdk)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
![Unit Test](https://img.shields.io/badge/Unit%20Test-Passing-green)
[![Creator](https://img.shields.io/badge/Creator-Moataz%20Yusuf-blue)](https://www.linkedin.com/in/moataz-yusuf-4266a3251/)

A comprehensive Flutter plugin for integrating Paymob payment gateway with native Android and iOS SDK support. Accept payments seamlessly and securly in your Flutter applications with full customization support.

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
| Android  | API 23 (6.0)   | ✅ Supported |
| iOS      | 13.0           | ✅ Supported |

## 🔐 Getting Your Paymob Credentials

1. **Sign up** at Paymob Dashboard
2. **Get your API keys**:
   - Public Key: `egy_pk_test_...`
   - Secret Key: `egy_sk_test_...`
3. **Get Integration ID**:
   - Go to Settings → Payment Integrations
   - Copy your integration ID

### Test Mode

- No real money is charged in test mode
- For testing, use test credentials:

| Type   | Number / PIN        | Expiry | CVV | OTP    |
| ------ | ------------------- | ------ | --- | ------ |
| Card   | 5123 4567 8901 2346 | 12/30  | 123 | -      |
| Wallet | 01010101010         | -      | -   | 123456 |


### Production Mode

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

Refer back to Paymob documentation for the complete list.

## 📱 Platform-Specific Notes

### Android
- The plugin uses Paymob Android SDK 1.6.9
- Supports Android 6.0 (API 23) and above
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
- **Email**: motazyusuf@gmail.com / moataz.medhat@intcore.com

## 🙏 Acknowledgments

- Paymob for providing the payment gateway service
- The Flutter team for the amazing framework
- All contributors who help improve this package
  
Special Thanks to [Mahmoud ElShennawy](https://github.com/dev-mahmoud-elshenawy)
For The Continuous Support And Mentorship.

## 📈 Changelog

See [CHANGELOG.md](CHANGELOG.md) for a list of changes.


Made with ❤️ by **Moataz Medhat Yusuf**  
🔗 **[LinkedIn](https://www.linkedin.com/in/moataz-yusuf-4266a3251/)**  
💻 **[GitHub](https://github.com/motazyusuf)**  

**Star ⭐ this repo if you find it useful!**
