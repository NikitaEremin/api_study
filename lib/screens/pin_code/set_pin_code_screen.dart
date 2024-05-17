import 'package:api_study/screens/pin_code/confirm_pin_code_screen.dart';
import 'package:flutter/material.dart';

class SetPinCodeScreen extends StatefulWidget {
  const SetPinCodeScreen({super.key});

  @override
  State<SetPinCodeScreen> createState() => _SetPinCodeScreenState();
}

class _SetPinCodeScreenState extends State<SetPinCodeScreen> {
  String _setCode = '';
  bool isSetCodeLengthMin = false;

  void _goToConfirmPinCodeScreen() {
    Navigator.of(context).pop;
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ConfirmPinCodeScreen(setCode: _setCode),
    ));
    // showDialog(
    //   context: context,
    //   builder: (context) => ConfirmPinCodeScreen(setCode: _setCode),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('SetPinCode'),
      content: Column(
        children: [
          TextField(
            onChanged: (value) {
              _setCode = value;
              if (_setCode.length == 4) {
                setState(() {
                  print(isSetCodeLengthMin);
                  isSetCodeLengthMin = true;
                });
              }
            },
          ),
          if (isSetCodeLengthMin) Text(_setCode),
        ],
      ),
      actions: [
        ElevatedButton(
            onPressed: _goToConfirmPinCodeScreen, child: const Text('Далее')),
      ],
    );
  }
}
