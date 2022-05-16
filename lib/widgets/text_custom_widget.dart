import 'package:flutter/material.dart';

import '../utils/constants.dart';

class TextCustom extends StatelessWidget {
  final String? data;
  final TypeText typeText;
  final double? fontSize;
  final Color color;
  final TextDecoration? decoration;
  final EdgeInsets? margin;
  final TextAlign textAlign;
  final FontWeight? fontWeight;
  final bool hadMaxLines;
  final int? maxLines;

  const TextCustom(
    this.data, {
    Key? key,
    this.typeText = TypeText.title,
    this.fontSize,
    this.color = Colors.black,
    this.decoration,
    this.margin,
    this.textAlign = TextAlign.start,
    this.fontWeight,
    this.hadMaxLines = false,
    this.maxLines = 2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.symmetric(vertical: Dimens.marginView),
      child: Text(
        data ?? '',
        textAlign: textAlign,
        style: TextStyle(
          fontSize: fontSize ??
              ((typeText == (TypeText.title)) ? Dimens.title : Dimens.body),
          fontFamily: 'SFPro',
          fontWeight: (fontWeight != null)
              ? fontWeight
              : (typeText == (TypeText.title))
                  ? FontWeight.bold
                  : FontWeight.normal,
          color: color,
          decoration: decoration,
        ),
        maxLines: maxLines,
        overflow: (hadMaxLines) ? TextOverflow.ellipsis : null,
      ),
    );
  }
}

