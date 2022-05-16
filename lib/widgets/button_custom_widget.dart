import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../utils/constants.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final VoidCallback onPressed;
  final ButtonStyle? style;
  final double? fontSize;
  final Icon? icon;
  final Widget? assetIcon;

  const PrimaryButton({
    Key? key,
    required this.text,
    this.backgroundColor = ConstColors.primary,
    required this.onPressed,
    this.style,
    this.fontSize,
    this.icon,
    this.assetIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.radius),
          ),
          textStyle: TextStyle(
            fontFamily: 'SFPro',
            fontWeight: FontWeight.bold,
            fontSize: fontSize ?? Dimens.title,
          ),
          padding: const EdgeInsets.symmetric(vertical: Dimens.paddingView),
          primary: backgroundColor,
          onPrimary: Colors.white),
      onPressed: onPressed,
      child: (icon != null || assetIcon != null)
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [icon != null ? icon! : assetIcon!, const WidthBox(Dimens.marginView), Text(text)],
            )
          : Text(text),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final VoidCallback onPressed;
  final ButtonStyle? style;
  final double? fontSize;
  final Icon? icon;
  final Widget? assetIcon;

  const SecondaryButton({
    Key? key,
    required this.text,
    this.backgroundColor = ConstColors.primary,
    required this.onPressed,
    this.style,
    this.fontSize,
    this.icon,
    this.assetIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.radius),
        ),
        textStyle: TextStyle(
          fontFamily: 'SFPro',
          fontWeight: FontWeight.bold,
          fontSize: fontSize ?? Dimens.title,
        ),
        primary: backgroundColor,
        side: BorderSide(color: backgroundColor ?? ConstColors.primary, width: 1),
      ),
      onPressed: onPressed,
      child: (icon != null || assetIcon != null)
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [icon != null ? icon! : assetIcon!, const WidthBox(Dimens.spaceText), Text(text)],
            )
          : Text(text),
    );
  }
}

class RatingButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonStyle? style;
  final bool? horizontalPadding;

  const RatingButton({Key? key, required this.text, required this.onPressed, this.style, this.horizontalPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: ConstColors.orange, width: 1.5),
            borderRadius: BorderRadius.circular(Dimens.radius),
          ),
          padding: horizontalPadding == null
              ? const EdgeInsets.symmetric(horizontal: 40, vertical: 10)
              : const EdgeInsets.symmetric(vertical: 10),
          textStyle: const TextStyle(
            fontFamily: 'SFPro',
            fontWeight: FontWeight.bold,
            fontSize: Dimens.title,
          ),
          primary: Colors.white,
          onPrimary: ConstColors.orange),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
