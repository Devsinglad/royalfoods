import 'package:flutter/material.dart';
import 'package:royalfoods/widgets/MyText.dart';

class IconsAndText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final Color iconColor;
  final FontWeight weight;
  final double size;
  const IconsAndText(
      {Key? key,
      required this.icon,
      required this.text,
      required this.color,
      required this.iconColor,
      required this.weight,
      required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
        ),
        MyText(title: text, color: color, weight: weight, size: size)
      ],
    );
  }
}
