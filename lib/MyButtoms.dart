import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyButtoms extends StatefulWidget {
   MyButtoms({ required this.text,required this.color, this.tapped,});
   final tapped;
final Color color;
final String text;
  @override
  State<MyButtoms> createState() => _MyButtomsState();
}

class _MyButtomsState extends State<MyButtoms> {


  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: widget.tapped ,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height:50 ,
          width: 50,
          decoration:BoxDecoration(
              color:widget.color
              ,borderRadius: BorderRadius.circular(20)
          ),
          child: Center(
            child: Text( widget.text ,style: TextStyle(color: Colors.white,fontSize: 30),),
          ),
        ),
      ),
    );
  }
}
