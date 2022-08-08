import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_payment_app/pages/utils/colors.dart';

class AppLargeButton extends StatelessWidget {
  final Color? background;
  final Color? textColor;
  final Function()? onTap;
  final bool? isBorder;
  final String text;
  const AppLargeButton({Key? key,
    this.background = AppColor.mainColor,
    this.textColor,
    this.onTap,
    this.isBorder = false,
    required this.text
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 45,right: 30),
        height: 60,
        width: MediaQuery.of(context).size.width - 90,
        child: Center(
          child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 35,
            color: textColor,
          ),
          ),
        ),
        decoration: BoxDecoration(
          color: AppColor.mainColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 2,
            color: AppColor.mainColor,
          )
        ),
      ),
    );
  }
}
