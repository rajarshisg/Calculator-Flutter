import 'package:flutter/material.dart';
class OperandButton extends StatefulWidget {
  OperandButton({@required this.colour,@required this.number,@required this.bgcolour});
   Color colour;
  final String number;
   Color bgcolour;
  setColor(Color fontcolor,Color bcolor){
    colour=fontcolor;
    bgcolour=bcolor;
  }
  @override
  _OperandButtonState createState() => _OperandButtonState(number: number,colour: colour,bgcolour: this.bgcolour);
}

class _OperandButtonState extends State<OperandButton> {
  _OperandButtonState({@required this.colour,@required this.number,this.bgcolour});
   Color colour;
  final String number;
   Color bgcolour;
  setColor(Color fontcolor,Color bcolor){
    colour=fontcolor;
    bgcolour=bcolor;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height:60.5,
      width:70.0,
      // color: Colors.black,
      child: Center(child: Text(number, style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold,color: colour),)),
      decoration:  BoxDecoration(
        color: bgcolour,
        borderRadius: new BorderRadius.all(Radius.circular(20.0),),),);
  }
}
