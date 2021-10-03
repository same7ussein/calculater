import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        backgroundColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
        ),
      ),
      themeMode: ThemeMode.dark,
      home: CalculatorApp(),
    );
  }
}

class CalculatorApp extends StatefulWidget {
  @override
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  String equation = "";
  String result = "";
  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;

  buttonPressed(String textButton) {
    setState(() {
      if (textButton == 'AC') {
        equation = "0";
        result = "0";
        equationFontSize = 38.0;
        resultFontSize = 48.0;
      } else if (textButton == 'DEL') {
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        equation = equation.substring(0, equation.length - 1);
        if (equation == '') {
          equation = '0';
        }
      } else if (textButton == '=') {
        equationFontSize = 38.0;
        resultFontSize = 48.0;
        expression = equation;
        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = 'Error';
        }
      } else {
        equationFontSize = 38.0;
        resultFontSize = 48.0;
        if (equation == '0') {
          equation = textButton;
        } else {
          equation = equation + textButton;
        }
      }
    });
  }

  Widget defaultTextButton({
    required String textButton,
    required Color textColor,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.18,
      height: MediaQuery.of(context).size.height * 0.08,
      color: textColor,
      child: TextButton(
        onPressed: () => buttonPressed(textButton),
        child: Text(
          textButton,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.centerRight,
              color: Colors.black,
              height: MediaQuery.of(context).size.height * 0.1,
              width: double.infinity,
              child: Text(
                equation,
                style: TextStyle(
                  fontSize: equationFontSize,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            Container(
              alignment: Alignment.centerRight,
              color: Colors.black,
              height: MediaQuery.of(context).size.height * 0.1,
              width: double.infinity,
              child: Text(
                result,
                style: TextStyle(
                  fontSize: resultFontSize,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                defaultTextButton(
                  textButton: 'AC',
                  textColor: Colors.blueGrey,
                ),
                defaultTextButton(
                  textButton: 'DEL',
                  textColor: Colors.blueGrey,
                ),
                defaultTextButton(
                  textButton: '%',
                  textColor: Colors.blueGrey,
                ),
                defaultTextButton(
                  textButton: '*',
                  textColor: Colors.blueGrey,
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                defaultTextButton(
                  textButton: '7',
                  textColor: Colors.grey[700]!,
                ),
                defaultTextButton(
                  textButton: '8',
                  textColor: Colors.grey[700]!,
                ),
                defaultTextButton(
                  textButton: '9',
                  textColor: Colors.grey[700]!,
                ),
                defaultTextButton(
                  textButton: '/',
                  textColor: Colors.blueGrey,
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                defaultTextButton(
                  textButton: '4',
                  textColor: Colors.grey[700]!,
                ),
                defaultTextButton(
                  textButton: '5',
                  textColor: Colors.grey[700]!,
                ),
                defaultTextButton(
                  textButton: '6',
                  textColor: Colors.grey[700]!,
                ),
                defaultTextButton(
                  textButton: '-',
                  textColor: Colors.blueGrey,
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                defaultTextButton(
                  textButton: '1',
                  textColor: Colors.grey[700]!,
                ),
                defaultTextButton(
                  textButton: '2',
                  textColor: Colors.grey[700]!,
                ),
                defaultTextButton(
                  textButton: '3',
                  textColor: Colors.grey[700]!,
                ),
                defaultTextButton(
                  textButton: '+',
                  textColor: Colors.blueGrey,
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                defaultTextButton(
                  textButton: '0',
                  textColor: Colors.grey[700]!,
                ),
                defaultTextButton(
                  textButton: '00',
                  textColor: Colors.grey[700]!,
                ),
                defaultTextButton(
                  textButton: '.',
                  textColor: Colors.grey[700]!,
                ),
                defaultTextButton(
                  textButton: '=',
                  textColor: Colors.red,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
