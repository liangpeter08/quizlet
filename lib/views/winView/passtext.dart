import 'package:flutter/material.dart';

class PassText extends StatelessWidget {
  final Animation colorChange;
  const PassText(this.colorChange);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text('You\'ve\nPassed!',
          style: TextStyle(
              fontFamily: 'font2',
              color: this.colorChange.value,
              fontSize: 40)),
    );
  }
}