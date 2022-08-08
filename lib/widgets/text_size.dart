import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_payment_app/pages/utils/colors.dart';

class SizedText extends StatelessWidget {
  final String text;
  final Color color;
  final TextOverflow textOverflow;
  const SizedText({Key? key, required this.text, required this.color, this.textOverflow = TextOverflow.ellipsis}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size textSize = _textSize(text);
    return Column(
      children: <Widget>[
        Text(text,
        style: const TextStyle(
            fontSize: 16,
            color:AppColor.green,
            fontWeight: FontWeight.w700,
        ),
          maxLines: 1,
          softWrap: false,
          overflow: TextOverflow.ellipsis,
        ),
        Row(
          children: <Widget>[
            for(int i = 0; i<textSize.width/5; i++)
              i.isEven?Container(
                width: 5,
                color: color,
                height: 2,
              ):Container(
                width: 5,
                color: Colors.white,
                height: 2,
              ),
          ],
        ),
      ],
    );
  }
  Size  _textSize(text) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text,style: const TextStyle(
        fontSize: 16,
        color:AppColor.green,
        fontWeight: FontWeight.w700,
        overflow: TextOverflow.ellipsis,
      )
      ),
        maxLines: 1,
        textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth:double.infinity);
    return textPainter.size;
  }
}
