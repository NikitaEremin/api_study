import 'package:flutter/material.dart';

class ConfirmPinCodeScreen extends StatefulWidget {
  final String setCode;

  const ConfirmPinCodeScreen({super.key, required this.setCode});

  @override
  State<ConfirmPinCodeScreen> createState() => _ConfirmPinCodeScreenState();
}

class _ConfirmPinCodeScreenState extends State<ConfirmPinCodeScreen> {
  String _confirmCode = '';

  void _verifyCode() {
    print('confrim code:  $_confirmCode');
    print('set code: ${widget.setCode}');
    if (_confirmCode == widget.setCode) {
      Navigator.of(context).pop;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Пин успешно установлен'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Пин не установлен'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Confirm pincode'),
      content: TextField(
        onChanged: (value) {
          _confirmCode = value;
        },
      ),
      actions: [
        ElevatedButton(
            onPressed: _verifyCode, child: const Text('Подтвердить')),
      ],
    );
  }
}
