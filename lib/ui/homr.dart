import 'package:TrueCitizenTest/model/question.dart';
import 'package:flutter/material.dart';

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _currentQuestionIndex =0;
  List questionBank = [
    Question("1 this is your name: Eugene", false),
    Question("2 this is your name: Eugene", true),
    Question("3 this is your name: Eugene", false),
    Question("4 this is your name: Eugene", true),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("True citizen"),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.blueGrey,
      body: Builder(
        builder:(BuildContext context ) => Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Image.asset("images/kenya.png", height: 250, width: 180,)),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  child: Center(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(questionBank[_currentQuestionIndex%questionBank.length].questionText,
                    style: TextStyle(
                      fontSize: 16.9,
                      color: Colors.white,
                    ),
                    ),
                  )),
                  height: 120.0,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: Colors.blueGrey.shade400,
                      style: BorderStyle.solid
                    )
                  ),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RaisedButton(child:Text("True", style: TextStyle(color: Colors.white),),onPressed: ()=>_checkAnswer(true, context),color: Colors.blueGrey.shade900,),
                  RaisedButton(child:Text("False", style: TextStyle(color: Colors.white),), onPressed: ()=>_checkAnswer(false, context),color: Colors.blueGrey.shade900,),
                  RaisedButton(child:Icon(Icons.arrow_forward, color: Colors.white,) , onPressed: ()=>_nextQuestion(),color: Colors.blueGrey.shade900,),

                ],
              ),
              Spacer(),
            ],

          ),
        ),
      ),
    );
  }

  _checkAnswer(bool userChoice, BuildContext context) {
     if(userChoice == questionBank[_currentQuestionIndex].isCorrect){
       final snackBar = SnackBar(
         content: Text('Is Correct', style: TextStyle(color: Colors.white),),
         backgroundColor: Colors.green,
         duration: Duration(milliseconds: 500),
       );
       Scaffold.of(context).showSnackBar(snackBar);
       setState(() {
         _currentQuestionIndex++;
       });
     }
     else{
       final snackBar = SnackBar(
         content: Text('Is InCorrect', style: TextStyle(color: Colors.white),),
         backgroundColor: Colors.red,
         duration: Duration(milliseconds: 500),
         // duration: Duration.secondsPerMinute.,
       );
       Scaffold.of(context).showSnackBar(snackBar);
       setState(() {
         _currentQuestionIndex++;
       });
     }
  }

  _nextQuestion() {
    setState(() {
      _currentQuestionIndex++;
    });
  }
}


