import 'package:api_study/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            context.go(AppRoutes.AuthScreen.path);
          },
          child: const Text('Go'),
        ),
      ),
    );
  }
}
