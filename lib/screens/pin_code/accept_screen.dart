import 'package:api_study/screens/pin_code/confirm_pin_code_screen.dart';
import 'package:flutter/material.dart';

class SetPinCodeScreen extends StatefulWidget {
  const SetPinCodeScreen({super.key});

  @override
  State<SetPinCodeScreen> createState() => _SetPinCodeScreenState();
}

class _SetPinCodeScreenState extends State<SetPinCodeScreen> {
  String _setCode = '';

  void _goToConfirmPinCodeScreen() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ConfirmPinCodeScreen(setCode: _setCode),));
    // showDialog(
    //   context: context,
    //   builder: (context) => ConfirmPinCodeScreen(setCode: _setCode),
    // );
    // context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Установите код'),
      content: TextField(
        onChanged: (value) {
          _setCode = value;
        },
      ),
      actions: [
        ElevatedButton(
            onPressed: _goToConfirmPinCodeScreen,
            child: const Text('Далее')),
      ],
    );
  }
}
