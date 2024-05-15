import 'package:flutter/material.dart';

class PinPad extends StatefulWidget {

  final Function(String)? onCompleted;

  const PinPad({super.key, this.onCompleted,});


  @override
  State<PinPad> createState() => _PinPadState();
}

class _PinPadState extends State<PinPad> {
  static const length = 4;
  String pinCode = '';

  Widget buildBottomRow() {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const TextButton(onPressed: null, child: SizedBox()),
          buildNumButton('0'),
          buildDeleteButton()
        ],
      ),
    );
  }

  Widget buildNumberedRow(List<String> numbers) {
    List<Widget> numberList =
    numbers.map((number) => buildNumButton(number)).toList();
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: numberList,
      ),
    );
  }

  Widget buildNumButton(String num) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Theme.of(context).primaryColor,
        shape: const CircleBorder(),
      ),
      onPressed: () {
        if (pinCode.length < length) {
          setState(() {
            pinCode += num;
          });
          if(pinCode.length == length){
            if(widget.onCompleted!=null){
              widget.onCompleted!('onCompleted! pin: $pinCode');
            }
          }
        }
      },
      child: Text(num, style: const TextStyle(fontSize: 24)),
    );
  }

  Widget buildDeleteButton() {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Theme.of(context).primaryColor,
        shape: const CircleBorder(),
      ),
      onPressed: () {
        setState(() {
          if (pinCode.isNotEmpty) {
            pinCode = pinCode.substring(0, pinCode.length - 1);
          }
        });
      },
      child: const Icon(Icons.backspace),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < length; i++)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: pinCode.length > i
                        ? Colors.green[800]
                        : Colors.grey[400],
                    shape: BoxShape.circle,
                  ),
                ),
              ),
          ],
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                buildNumberedRow(['1', '2', '3']),
                buildNumberedRow(['4', '5', '6']),
                buildNumberedRow(['7', '8', '9']),
                buildBottomRow()
              ],
            ),
          ),
        ),
      ],
    );
  }
}
