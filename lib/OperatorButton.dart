import 'package:flutter/material.dart';
class OperatorButton extends StatefulWidget {
  OperatorButton({@required this.colour,@required this.icon,@required this.bgcolour,this.size});
  final Color colour;
  final IconData icon;
  final Color bgcolour;
  final double size;
  @override
  _OperatorButtonState createState() => _OperatorButtonState(icon: icon,colour: colour,bgcolour: this.bgcolour,size: this.size);
}

class _OperatorButtonState extends State<OperatorButton> {
  double size=0.0;
  _OperatorButtonState({@required this.colour,@required this.icon,this.bgcolour,this.size});
  final Color colour;
  final IconData icon;
  final Color bgcolour;

  @override
  Widget build(BuildContext context) {
    return Container(
      height:60.5,
      width:70.0,
      // color: Colors.black,
      child: Icon(icon,size: (size)==0.0?25.0:size, color: colour),
      decoration:  BoxDecoration(
        color: bgcolour,
        borderRadius: BorderRadius.all(Radius.circular(20.0),),
        ),
      );
  }
}
