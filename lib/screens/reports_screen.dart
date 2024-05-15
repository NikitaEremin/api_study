import 'package:api_study/widgets/pin_pad.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  someFunction(String toprint){
    print(toprint);
  }

  @override
  Widget build(BuildContext context) {
    // Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 330,
          width: 330,
          child: PinPad(onCompleted: someFunction,),
        ),
      ),
    );
  }
}

