import 'package:flutter/material.dart';

import 'calculator_colors.dart';

// مهم عشان لما ابعت المتغير ابعته صح و اكتشف الايرور وقت الرن تايم
// syntax error in compile time
typedef OnButtonClick = void Function(String);
class CalculatorButton extends StatelessWidget {
  String operator;
  Color? buttonBackgroundColor;
  Color? textColor;
  int? flex;
  Widget? buttonChild;
  bool isIcon;
  OnButtonClick onButtonClick;
  CalculatorButton({
    required this.operator,
    required this.onButtonClick,
    this.buttonBackgroundColor,
    this.textColor,
    this.flex,
    this.buttonChild,
    this.isIcon = false,
  });
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex ?? 1,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: FloatingActionButton(
          onPressed: () {
            // todo: click
            onButtonClick(operator);
          },
          backgroundColor: buttonBackgroundColor ?? CalculatorColors.grayColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(16),
          ),
          child: isIcon
              ? buttonChild
              : Text(
                  operator,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: textColor ?? CalculatorColors.lightBlueColor,
                  ),
                ),
        ),
      ),
    );
  }
}
