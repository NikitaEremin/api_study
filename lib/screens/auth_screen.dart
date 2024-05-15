import 'package:api_study/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _logincontroller =
      TextEditingController(text: '191069649.7@4ek.by');
  final TextEditingController _passwordcontroller =
      TextEditingController(text: '4444');
  final TextEditingController _idpccontroller =
      TextEditingController(text: '28092023119026281004');

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _logincontroller.dispose();
    _passwordcontroller.dispose();
    _idpccontroller.dispose();
    super.dispose();
  }

  /*
  CashBoxToken 28092023119026281004
  login 191069649.7@4ek.by
  pass 4444
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Логин'),
              controller: _logincontroller,
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Пароль'),
              controller: _passwordcontroller,
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'ID ПК'),
              controller: _idpccontroller,
            ),
            const SizedBox(
              height: 8.0,
            ),
            ElevatedButton(
                onPressed: () {
                  context.go(AppRoutes.CashierScreen.path);
                  // ApiV4().auth(
                  //     _logincontroller.text,
                  //     _passwordcontroller.text,
                  //     _idpccontroller.text);
                },
                child: const Text('Войти')),
          ],
        ),
      ),
    );
  }
}
