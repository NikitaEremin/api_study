import 'package:api_study/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CashierScreen extends StatelessWidget {
  const CashierScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Cashier'),
            FilledButton(
              onPressed: () {
                context.push(AppRoutes.CashBoxScreen.path);
              },
              child: const Text('Cashbox'),
            ),
          ],
        ),
      ),
    );
  }
}
