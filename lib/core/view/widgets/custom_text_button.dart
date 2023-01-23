import 'package:flutter/material.dart';

import '../../resources/resources.dart';
import '../views.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final double textSize;
  final FontWeight fontWeight;
  final Color? textColor;
  final double padding;

  const CustomTextButton({
    this.onPressed,
    required this.text,
    this.textColor,
    this.fontWeight = FontWeightManager.semiBold,
    this.textSize = FontSize.s16,
    this.padding = AppPadding.p8,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(padding),
        child: CustomText(
          text,
          color: textColor,
          fontSize: textSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
