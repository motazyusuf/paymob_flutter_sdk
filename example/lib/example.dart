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

              final creds = await service.createPaymentIntention(
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

              print('Payment result: ${result.status}');
            },
          ),
        ),
      ),
    );
  }
}