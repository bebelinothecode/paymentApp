import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../pages/utils/colors.dart';

class Buttons extends StatelessWidget {
  final double? fontSize;
  final IconData icon;
  final Function()? onTap;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? textColor;
  final String? text;
  const Buttons({
    Key? key,
    this.fontSize = 20,
    required this.icon,
    this.onTap,
    this.backgroundColor = AppColor.mainColor,
    this.iconColor = Colors.white,
    this.textColor,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: <Widget>[
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: backgroundColor,
            ),
            child: Icon(icon,
            size: 30,
            color: iconColor,
            ),
          ),
          text!= null? Text(text!,
          style:TextStyle(fontSize: 14,color: textColor)):Container(),
        ],
      ),
    );
  }
}
