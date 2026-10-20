import 'package:calculator/calculator/calculator_button.dart';
import 'package:calculator/calculator/calculator_colors.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  static const String routeName = 'calculator';

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String resText = " ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CalculatorColors.blackColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    lhs,
                    style: TextStyle(fontSize: 20, color: Colors.blueGrey),
                  ),
                  Text(
                    operator,
                    style: TextStyle(fontSize: 20, color: Colors.blueGrey),
                  ),
                ],
              ),
              // for result
              Expanded(
                child: Container(
                  alignment: AlignmentGeometry.centerEnd,
                  child: Text(
                    resText,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 30,
                      color: CalculatorColors.whiteColor,
                    ),
                  ),
                ),
              ),

              // for numbers
              Expanded(
                flex: 2,
                child: Row(
                  spacing: 20,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              spacing: 20,
                              children: [
                                CalculatorButton(
                                  operator: 'Ac',
                                  onButtonClick: onClearClick,
                                  buttonBackgroundColor:
                                  CalculatorColors.lightGrayColor,
                                  textColor: CalculatorColors.whiteColor,
                                ),
                                CalculatorButton(
                                  operator: 'backspace',
                                  onButtonClick: onBackSpaceClick,
                                  isIcon: true,
                                  buttonChild: Icon(
                                    Icons.backspace_outlined,
                                    color: CalculatorColors.whiteColor,
                                  ),
                                  buttonBackgroundColor:
                                  CalculatorColors.lightGrayColor,
                                  textColor: CalculatorColors.whiteColor,
                                ),
                                CalculatorButton(
                                  operator: '/',
                                  onButtonClick: onOperatorClick,
                                  buttonBackgroundColor:
                                      CalculatorColors.darkBlueColor,
                                  textColor: CalculatorColors.whiteColor,
                                ),
                              ],
                            ),
                          ),

                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              spacing: 20,
                              children: [
                                CalculatorButton(
                                  operator: '7',
                                  onButtonClick: onDigitClick,
                                ),
                                CalculatorButton(
                                  operator: '8',
                                  onButtonClick: onDigitClick,
                                ),
                                CalculatorButton(
                                  operator: '9',
                                  onButtonClick: onDigitClick,
                                ),
                              ],
                            ),
                          ),

                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              spacing: 20,
                              children: [
                                CalculatorButton(
                                  operator: '4',
                                  onButtonClick: onDigitClick,
                                ),
                                CalculatorButton(
                                  operator: '5',
                                  onButtonClick: onDigitClick,
                                ),
                                CalculatorButton(
                                  operator: '6',
                                  onButtonClick: onDigitClick,
                                ),
                              ],
                            ),
                          ),

                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              spacing: 20,
                              children: [
                                CalculatorButton(
                                  operator: '1',
                                  onButtonClick: onDigitClick,
                                ),
                                CalculatorButton(
                                  operator: '2',
                                  onButtonClick: onDigitClick,
                                ),
                                CalculatorButton(
                                  operator: '3',
                                  onButtonClick: onDigitClick,
                                ),
                              ],
                            ),
                          ),

                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              spacing: 20,
                              children: [
                                CalculatorButton(
                                  flex: 2,
                                  operator: '0',
                                  onButtonClick: onDigitClick,
                                ),
                                CalculatorButton(
                                  operator: '.',
                                  onButtonClick: onDigitClick,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CalculatorButton(
                            // flex: 2,
                            operator: '*',
                            onButtonClick: onOperatorClick,
                            buttonBackgroundColor:
                                CalculatorColors.darkBlueColor,
                            textColor: CalculatorColors.whiteColor,
                          ),

                          CalculatorButton(
                            // flex: 2,
                            operator: '^',
                            onButtonClick: onOperatorClick,
                            buttonBackgroundColor:
                                CalculatorColors.darkBlueColor,
                            textColor: CalculatorColors.whiteColor,
                          ),

                          CalculatorButton(
                            // flex: 2,
                            operator: '-',
                            onButtonClick: onOperatorClick,
                            buttonBackgroundColor:
                                CalculatorColors.darkBlueColor,
                            textColor: CalculatorColors.whiteColor,
                          ),

                          CalculatorButton(
                            // flex: 3,
                            operator: '+',
                            onButtonClick: onOperatorClick,
                            buttonBackgroundColor:
                                CalculatorColors.darkBlueColor,
                            textColor: CalculatorColors.whiteColor,
                          ),

                          CalculatorButton(
                            // flex: 2,
                            operator: '=',
                            onButtonClick: onEqualClick,
                            buttonBackgroundColor:
                            CalculatorColors.lightBlueColor,
                            textColor: CalculatorColors.whiteColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onDigitClick(String text) {
    if (text == '.' && resText.contains('.')) {
      print('done');
      return;
    }

    /// "1" + "2" = "12"
    resText += text;
    setState(() {});
    // print(resText);
  }

  // todo: operators : +, -, *, /
  String lhs = "";
  String operator = "";

  void onOperatorClick(String clickedOperator) {
    if (operator.isEmpty) {
      lhs = resText;
      // operator = clickedOperator;
      // resText = "";
    } else {
      String rhs = resText;
      lhs = calculate(lhs, operator, rhs);
      // operator =clickedOperator;
      // resText = "";
    }
    operator = clickedOperator;
    resText = " ";
    setState(() {});
  }

  String calculate(String lhs, String operator, String rhs) {
    double num1 = double.parse(lhs);
    double num2 = double.parse(rhs);
    double res = 0.0;
    if (operator == "+") {
      res = num1 + num2;
      print(res);
    } else if (operator == "-") {
      res = num1 - num2;
    } else if (operator == "*") {
      res = num1 * num2;
    } else if (operator == "/") {
      if (num2 != 0) {
        res = num1 / num2;
      } else {
        return "Can't divide by zero.";
      }
    } else if (operator == "^") {
      res = 1.0;

      if (num2 < 0 || num2 != num2.truncateToDouble()) {
        return "Invalid exponent";
      }

      int i = 0;
      while (i < num2.toInt()) {
        res *= num1;
        i++;
      }
    }
    return res.toString();
  }

  void onEqualClick(String text) {
    String rhs = resText;
    resText = calculate(lhs, operator, rhs);
    lhs = "";
    operator = "";
    setState(() {});
  }

  void onClearClick(String text) {
    resText = "";
    lhs = "";
    operator = "";
    setState(() {});
  }

  void onBackSpaceClick(String text) {
    if (resText.isEmpty) {
      return;
    }
    resText = resText.substring(0, resText.length - 1);
    setState(() {});
  }
}
