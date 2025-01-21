import 'package:calculator/MyButtoms.dart';
import 'package:calculator/main.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> buttons =[
    "c","DEL","%","/",
    "9","8","7","x",
    "6","5","4","-",
    "3","2","1","+",
    "0",".","Ans","="
  ];
  var userQuestion=" ";
  var userAnswer =" ";
  var ans=" ";
  void equalPressed(){
   setState(() {
     String finalQuestion =userQuestion;
     finalQuestion =finalQuestion.replaceAll("x", "*");
     Parser p = Parser();
     
     Expression exp = p.parse(finalQuestion); // to covert the String to an equation (expression ) stored on object
                                              // called exp and it can easily solve the equation --> (2+5*10)=52
     ContextModel cm = ContextModel();
     double eval = exp.evaluate(EvaluationType.REAL, cm);
   
     if(eval%2==0 || eval %2==1)
       {

         userAnswer=eval.toInt().toString();
       }
     else {
       userAnswer=eval.toString();
     }
   });
  }
  void showD(){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("ss"),
        content: Text("data"),
        actions: [MaterialButton(onPressed: (){Navigator.pop(context);},child: Text("data"), )],
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end  ,
        children: [
          Container(
            width: 400,
            height: 75,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)
                

            ),
            child: Center(child: Text( userQuestion ,style: TextStyle(fontSize: 30),)),
          ),
          SizedBox(height: 10,),
          Container(
            width: 400,
            height: 75,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)


            ),
            child: Center(child: Text(userAnswer,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
          ),
          MaterialButton(onPressed: showD, child: Text("data"),),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
              itemCount: buttons.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
              if(index == buttons.length-1)
                {
                  //EQUAL BUTTON ********

                      return GestureDetector(
                          onTap: (){
                               showDialog(context: context, builder: (BuildContext context){
                                return AlertDialog(title: Text("data"),content: Text("data"),);
                               });
                          },

                          child: MyButtoms(text: buttons[index],color:Colors.green,tapped: equalPressed, ));



                }
              else if (index == 1)
                {
                  return MyButtoms(text: buttons[index],color:Colors.red ,tapped: (){
                    setState(() {

                      userQuestion=userQuestion.substring(0,userQuestion.length-1);

                    });
                  },);
                }
              else if (index == 0)
              {
                return MyButtoms(text: buttons[index],color:Colors.red ,tapped: (){
                  setState(() {
                    userQuestion=" ";
                    userAnswer=" ";
                  });
                },);
              }
              else {
                return MyButtoms(text: buttons[index],color:Colors.cyan,tapped:(){
                  setState(() {
                    userQuestion= userQuestion+buttons[index];
                  });
                } , );
              }

              },
            ),
          )
        ],
      ),
    );
  }
}
