import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'OperatorButton.dart';
import 'OperandButton.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:math_expressions/math_expressions.dart';
import 'dart:math' as math;
Color navibarcolor=Color(0xFF17181A);
Color sttsbarcolor=Color(0xFF17181A);
mixin PortraitModeMixin on StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _portraitModeOnly();
    return null;
  }
}
void _portraitModeOnly() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}
main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor:navibarcolor, // navigation bar color
    statusBarColor: sttsbarcolor, // status bar color
  ));
  runApp(Calculator());
}

class Calculator extends StatefulWidget  {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator>  {
  String num = '0';
  String exp="";
  double s = 60.0;
  var isSelected=[true,false];
  Color bgcolor=Color(0xFF17181A);
  Color buttoncolor=Color(0xFF222427);
  Color fontcolor=Colors.white;
  @override
  Widget build(BuildContext context) {
    //super.build(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        backgroundColor: bgcolor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 10.0),
            Container(
                height: 250.0,
                color: bgcolor,
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        num,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: fontcolor,
                            fontSize: s),
                      ),
                    ))),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                    onTap: () {
                      setState(() {
                        if (num == '0') {
                          num = 'sin(';
                          exp = "sin(";
                        }
                        else if(String.fromCharCode(num.codeUnitAt(num.length-1))=="+" || String.fromCharCode(num.codeUnitAt(num.length-1))=="-" ||String.fromCharCode(num.codeUnitAt(num.length-1))=="x" || String.fromCharCode(num.codeUnitAt(num.length-1))=="/" || String.fromCharCode(num.codeUnitAt(num.length-1))=="("  ||String.fromCharCode(num.codeUnitAt(num.length-1))=="^"){
                          num += 'sin(';
                          exp +="sin(";
                        }
                        else {
                          num += 'xsin(';
                          exp +="*sin(";
                        }
                          if (num.length >= 8)
                          s = 40.0;
                      });
                    },
                    child: OperandButton(
                        number: 'sin',
                        colour: fontcolor,
                        bgcolour: buttoncolor,
                    )),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        if (num == '0') {
                          num = 'cos(';
                          exp="cos(";
                        }
                        else if(String.fromCharCode(num.codeUnitAt(num.length-1))=="+" || String.fromCharCode(num.codeUnitAt(num.length-1))=="-" ||String.fromCharCode(num.codeUnitAt(num.length-1))=="x" || String.fromCharCode(num.codeUnitAt(num.length-1))=="/" || String.fromCharCode(num.codeUnitAt(num.length-1))=="("  ||String.fromCharCode(num.codeUnitAt(num.length-1))=="^"){
                          num += 'cos(';
                          exp +="cos(";
                        }
                        else {
                          num += 'xcos(';
                          exp +="*cos(";
                        }
                        if (num.length >= 8)
                          s = 40.0;
                      });
                    },
                    child: OperandButton(
                        number: 'cos',
                        colour: Colors.white,
                        bgcolour: buttoncolor)),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        if (num == '0') {
                          num = '0';
                          exp="0";
                        }
                        else if(String.fromCharCode(num.codeUnitAt(num.length-1))=="+" || String.fromCharCode(num.codeUnitAt(num.length-1))=="-" ||String.fromCharCode(num.codeUnitAt(num.length-1))=="x" || String.fromCharCode(num.codeUnitAt(num.length-1))=="/" || String.fromCharCode(num.codeUnitAt(num.length-1))=="("  ||String.fromCharCode(num.codeUnitAt(num.length-1))=="^"){
                          num=num;
                          exp=exp;
                        }
                        else {
                          num += '^';
                          exp+="^";
                        }
                        if (num.length >= 8)
                          s = 40.0;
                      });
                    },
                    child: OperandButton(
                      number: '^',
                      colour: Colors.white,
                      bgcolour: buttoncolor,
                    )),
                GestureDetector(
                  onLongPress: (){setState(() {
                    num="0";
                    exp="0";
                  });},
                    onTap: () {
                      setState(() {
                        if (num == '0') {
                          num = '0';
                          exp="0";
                        }
                        else if (num.length == 1) {
                          num = '0';
                          exp="0";
                        }
                        else{
                          num = num.substring(0, num.length - 1);exp=exp.substring(0,exp.length-1);};
                        if (num.length >= 8)
                          s = 40.0;
                        if(num.length<=7)
                          s=80.0;
                      });
                    },
                    child: OperatorButton(
                      icon: Icons.backspace,
                      colour: Colors.white,
                      bgcolour: buttoncolor,
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                    onTap: () {
                      setState(() {
                        num = '0';
                        exp="0";
                        s = 80.0;
                      });
                    },
                    child: OperandButton(
                        number: 'C',
                        colour: Colors.white,
                        bgcolour: Color(0xFFFF9500))),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        if (num == '0') {
                          num = '(';
                          exp="(";
                        }
                        else if(String.fromCharCode(num.codeUnitAt(num.length-1))=="+" || String.fromCharCode(num.codeUnitAt(num.length-1))=="-" ||String.fromCharCode(num.codeUnitAt(num.length-1))=="x" || String.fromCharCode(num.codeUnitAt(num.length-1))=="/" || String.fromCharCode(num.codeUnitAt(num.length-1))=="("  ||String.fromCharCode(num.codeUnitAt(num.length-1))=="^"){
                          num+="(";
                          exp+="(";
                        }
                        else{
                          num += 'x(';
                          exp+="*(";
                        }
                        if (num.length >= 8)
                          s = 40.0;
                      });
                    },
                    child: OperandButton(
                        number: '(',
                        colour: Colors.white,
                        bgcolour: buttoncolor)),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        if (num == '0'){
                          num = '0';
                          exp="0";
                        }
                        else if(String.fromCharCode(num.codeUnitAt(num.length-1))=="+" || String.fromCharCode(num.codeUnitAt(num.length-1))=="-" ||String.fromCharCode(num.codeUnitAt(num.length-1))=="x" || String.fromCharCode(num.codeUnitAt(num.length-1))=="/" || String.fromCharCode(num.codeUnitAt(num.length-1))=="("  ||String.fromCharCode(num.codeUnitAt(num.length-1))=="^"){
                          num=num;
                          exp=exp;
                        }
                        else {
                          num += ')';
                          exp+=")";
                        }
                        if (num.length >= 8)
                          s = 40.0;
                      });
                    },
                    child: OperandButton(
                      number: ')',
                      colour: Colors.white,
                      bgcolour: buttoncolor,
                    )),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        if (num == '0') {
                          num = '0';
                          exp = "0";
                        }
                        else if(String.fromCharCode(num.codeUnitAt(num.length-1))=="+" || String.fromCharCode(num.codeUnitAt(num.length-1))=="-" ||String.fromCharCode(num.codeUnitAt(num.length-1))=="x" || String.fromCharCode(num.codeUnitAt(num.length-1))=="/" || String.fromCharCode(num.codeUnitAt(num.length-1))=="("  ||String.fromCharCode(num.codeUnitAt(num.length-1))=="^"){
                          num=num;
                          exp=exp;
                        }
                        else {
                          num += '/';
                          exp+="/";
                        }
                        if (num.length >= 8)
                          s = 40.0;
                      });
                    },
                    child: OperandButton(
                      number: '/',
                      colour: Colors.white,
                      bgcolour: Color(0xFFFF9500),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                    onTap: () {
                      setState(() {
                        if (num == '0') {
                          num = '7';
                          exp="7";
                        }
                        else if(String.fromCharCode(num.codeUnitAt(num.length-1))==")"){
                          num+="x7";
                          exp+="*7";
                        }
                        else {
                          num += '7';
                          exp+="7";
                        }
                        if (num.length >= 8)
                          s = 40.0;
                      });
                    },
                    child: OperandButton(
                        number: '7',
                        colour: Colors.white,
                        bgcolour: buttoncolor)),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        if (num == '0') {
                          num = '8';
                          exp="8";
                        }
                        else if(String.fromCharCode(num.codeUnitAt(num.length-1))==")"){
                          num+="x8";
                          exp+="*8";
                        }
                        else {
                          num += '8';
                          exp+="8";
                        }
                        if (num.length >= 8)
                          s = 40.0;
                      });
                    },
                    child: OperandButton(
                        number: '8',
                        colour: Colors.white,
                        bgcolour: buttoncolor)),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        if (num == '0') {
                          num = '9';
                          exp="9";
                        }
                        else if(String.fromCharCode(num.codeUnitAt(num.length-1))==")"){
                          num+="x9";
                          exp+="*9";
                        }
                        else{
                          num += '9';
                          exp+="9";
                        }
                        if (num.length >= 8)
                          s = 40.0;
                      });
                    },
                    child: OperandButton(
                        number: '9',
                        colour: Colors.white,
                        bgcolour: buttoncolor)),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        if (num == '0') {
                          num = '0';
                          exp="0";
                        }
                        else if(String.fromCharCode(num.codeUnitAt(num.length-1))=="+" || String.fromCharCode(num.codeUnitAt(num.length-1))=="-" ||String.fromCharCode(num.codeUnitAt(num.length-1))=="x" || String.fromCharCode(num.codeUnitAt(num.length-1))=="/" || String.fromCharCode(num.codeUnitAt(num.length-1))=="("  ||String.fromCharCode(num.codeUnitAt(num.length-1))=="^"){
                          num=num;
                          exp=exp;
                        }
                        else {
                          num += 'x';
                          exp=exp+"*";
                        }
                        if (num.length >= 8)
                          s = 40.0;

                      });
                    },
                    child: OperandButton(
                      number: 'x',
                      colour: Colors.white,
                      bgcolour: Color(0xFFFF9500),
                    )),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                    onTap: () {
                      setState(() {
                        if (num == '0') {
                          num = '4';
                          exp="4";
                        }
                        else if(String.fromCharCode(num.codeUnitAt(num.length-1))==")"){
                          num+="x4";
                          exp+="*4";
                        }
                        else {
                          num += '4';
                          exp+="4";
                        }
                        if (num.length >= 8)
                          s = 40.0;
                      });
                    },
                    child: OperandButton(
                        number: '4',
                        colour: Colors.white,
                        bgcolour: buttoncolor)),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        if (num == '0') {
                          num = '5';
                          exp="5";
                        }
                        else if(String.fromCharCode(num.codeUnitAt(num.length-1))==")"){
                          num+="x5";
                          exp+="*5";
                        }
                        else {
                          num += '5';
                          exp+="5";
                        }
                        if (num.length >= 8)
                          s = 40.0;
                      });
                    },
                    child: OperandButton(
                        number: '5',
                        colour: Colors.white,
                        bgcolour: buttoncolor)),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        if (num == '0') {
                          num = '6';
                          exp="6";
                        }
                        else if(String.fromCharCode(num.codeUnitAt(num.length-1))==")"){
                          num+="x6";
                          exp+="*6";
                        }
                        else {
                          num += '6';
                          exp+="6";
                        }
                        if (num.length >= 8)
                          s = 40.0;
                      });
                    },
                    child: OperandButton(
                        number: '6',
                        colour: Colors.white,
                        bgcolour: buttoncolor)),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        if (num == '0') {
                          num = '-';
                          exp="-";
                        }
                        else if(String.fromCharCode(num.codeUnitAt(num.length-1))=="+" || String.fromCharCode(num.codeUnitAt(num.length-1))=="+"  || String.fromCharCode(num.codeUnitAt(num.length-1))=="-" || String.fromCharCode(num.codeUnitAt(num.length-1))=="/" || String.fromCharCode(num.codeUnitAt(num.length-1))=="("  ||String.fromCharCode(num.codeUnitAt(num.length-1))=="^"){
                          num+="(-";
                          exp+="(-";
                        }
                        else {
                          num += '-';
                          exp+="-";
                        }
                        if (num.length >= 8)
                          s = 40.0;
                      });
                    },
                    child: OperandButton(
                      number: '-',
                      colour: Colors.white,
                      bgcolour: Color(0xFFFF9500),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                    onTap: () {
                      setState(() {
                        if (num == '0') {
                          num = '1';
                          exp="1";
                        }
                        else if(String.fromCharCode(num.codeUnitAt(num.length-1))==")"){
                          num+="x1";
                          exp+="*1";
                        }
                        else {
                          num += '1';
                          exp+="1";
                        }
                        if (num.length >= 8)
                          s = 40.0;
                      });
                    },
                    child: OperandButton(
                        number: '1',
                        colour: Colors.white,
                        bgcolour: buttoncolor)),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        if (num == '0') {
                          num = '2';
                          exp="2";
                        }
                        else if(String.fromCharCode(num.codeUnitAt(num.length-1))==")"){
                          num+="x2";
                          exp+="*2";
                        }
                        else {
                          num += '2';
                          exp+="2";
                        }
                        if (num.length >= 8)
                          s = 40.0;
                      });
                    },
                    child: OperandButton(
                        number: '2',
                        colour: Colors.white,
                        bgcolour: buttoncolor)),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        if (num == '0') {
                          num = '3';
                          exp="3";
                        }
                        else if(String.fromCharCode(num.codeUnitAt(num.length-1))==")"){
                          num+="x3";
                          exp+="*3";
                        }
                        else {
                          num += '3';
                          exp+="3";
                        }
                        if (num.length >= 8)
                          s = 40.0;

                      });
                    },
                    child: OperandButton(
                        number: '3',
                        colour: Colors.white,
                        bgcolour: buttoncolor)),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        if (num == '0') {
                          num = '+';
                          exp="+";
                        }
                        else if(String.fromCharCode(num.codeUnitAt(num.length-1))=="+" || String.fromCharCode(num.codeUnitAt(num.length-1))=="-" ||String.fromCharCode(num.codeUnitAt(num.length-1))=="x" || String.fromCharCode(num.codeUnitAt(num.length-1))=="/" || String.fromCharCode(num.codeUnitAt(num.length-1))=="("  ||String.fromCharCode(num.codeUnitAt(num.length-1))=="^"){
                          num=num;
                          exp=exp;
                        }
                        else {
                          num += '+';
                          exp+= "+";
                        }
                        if (num.length >= 8)
                          s = 40.0;
                      });
                    },
                    child: OperandButton(
                      number: '+',
                      colour: Colors.white,
                      bgcolour: Color(0xFFFF9500),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                    onTap: () {
                      setState(() {
                        if (num == '0') {
                          num = '0';
                          exp="0";
                        }

                        else {
                          num += '%';
                          exp+="/100";
                        }
                        if (num.length >= 8)
                          s = 40.0;
                      });
                    },
                    child: OperandButton(
                        number: '%',
                        colour: Colors.white,
                        bgcolour: buttoncolor)),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        if (num == '0') {
                          num = '0';
                          exp="0";
                        }
                        else if(String.fromCharCode(num.codeUnitAt(num.length-1))==")"){
                          num+="x0";
                          exp+="*0";
                        }
                        else{
                          num += '0';
                          exp+="0";
                        }
                        if (num.length >= 8)
                          s = 40.0;
                      });
                    },
                    child: OperandButton(
                        number: '0',
                        colour: Colors.white,
                        bgcolour: buttoncolor)),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        if (num == '0') {
                          num = '0.';
                          exp="0.";
                        }
                        else if(String.fromCharCode(num.codeUnitAt(num.length-1))=="+" || String.fromCharCode(num.codeUnitAt(num.length-1))=="-" ||String.fromCharCode(num.codeUnitAt(num.length-1))=="x" || String.fromCharCode(num.codeUnitAt(num.length-1))=="/" || String.fromCharCode(num.codeUnitAt(num.length-1))=="("  ||String.fromCharCode(num.codeUnitAt(num.length-1))=="^"){
                          num += '0.';
                          exp +="0.";
                        }
                        else {
                          num += '.';
                          exp += num;
                        }
                      });
                    },
                    child: OperandButton(
                        number: '.',
                        colour: Colors.white,
                        bgcolour: buttoncolor)),
                GestureDetector(
                  onTap: (){setState(() {
                    Parser p=Parser();
                    Expression ex=p.parse(exp);
                    ContextModel cm=ContextModel();
                      double eval = ex.evaluate(EvaluationType.REAL, cm);
                      num = eval.toString();
                      exp=num;
                    if(num.length>7)
                      s=40.0;
                    if(num.length<=7)
                      s=80.0;
                  });},
                  child: OperandButton(
                      number: '=',
                      colour: Colors.white,
                      bgcolour: Color(0xFF2EC973)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
