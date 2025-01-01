import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

const Color black = Color(0xff1A1A1A);

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.onPress,
    required this.text,
    this.color = black,
    this.width = 76.25,
    this.height = 85.2,
  });
  final void Function() onPress;
  final String text;
  final Color color;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      borderRadius: 10,
      height: height,
      width: width,
      backgroundColor: color,
      selectedBackgroundColor: color,
      selectedTextColor: Colors.white,
      text: text,
      transitionType: TransitionType.LEFT_TO_RIGHT,
      onPress: onPress,
      textStyle: TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
