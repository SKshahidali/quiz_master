import 'package:flutter/material.dart';
import 'package:quiz_master/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_master/models/question_model.dart';
import 'package:quiz_master/widgets/next_button.dart';
import 'package:quiz_master/widgets/options.dart';
import 'package:quiz_master/widgets/question.dart';
import 'package:quiz_master/widgets/results.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Question> _question = [
    Question(
        id: '1',
        questionText: 'Who is the winner of 2023 ICC Mens World Cup',
        options: {
          'India': false,
          'New Zealand': false,
          'South Africa': false,
          'Australia': true
        }),
    Question(id: '3', questionText: 'Who is most run scorer world cup', options: {
      'Virat Kohli': true,
      'Rohit': false,
      'Babar Azam': false,
      'De kock': false
    }),
    Question(id: '2', questionText: 'Where was the WC final played ', options: {
      'Wankhede Stadium':false,
      'Eden Gardens': false,
      'Narendra Modi Stadium': true,
      'Chinmaswamy Stadium': false
    }),
  ];
  //Index to loop questions from 0 to n-1 //
  int index = 0;
  //Score calculate //
  int Score = 0;
  //Boolean value to check if user has clicked on or not //
  bool isclicked = false;
  //Function to change the question //
  bool isAlreadySelected = false ;
  void nextquestion() {
    if (index == _question.length - 1) {
      // This is where questions end and a box appers //
      showDialog(context: (context), builder:(ctx)=>ResultsBox(result: Score,questionLength: _question.length,));
    } else {
      if(isclicked) {
      setState(() {
        index++;
        isclicked = false; //This will change the questions index //
        isAlreadySelected = false;
      });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content:Text("Please Select a option"),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(vertical: 20),
        ));
      }
    }
  }

   //Function to change the color of the options // 

   void checkAnswerandupdate(bool value) {
    if(isAlreadySelected) {
      return;
    } else {
      if(value == true) {
      Score++;
    setState(() {
      isclicked = true;
      isAlreadySelected = true;
    });
    }
    }
    
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        title: Center(
            child: Text(
          'Quiz Master',
          style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
        )),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical:16.0,horizontal: 12),
            child: Text("Score : $Score",style: GoogleFonts.montserrat(fontSize: 18,fontWeight: FontWeight.bold),),
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              QuestionWidget(
                  question: _question[index].questionText,
                  indexAction: index,
                  totalquestions: _question.length),
              const Divider(
                color: neutral,
              ),
              const SizedBox(height: 40,),
                for(int i =0;i < _question[index].options.length;i++)
                GestureDetector(
                  onTap:() => checkAnswerandupdate(_question[index].options.values.toList()[i]),
                  child: OptionsCard(
                    option:_question[index].options.keys.toList()[i], 
                    color:isclicked ? _question[index].options.values.toList()[i] == true ? correctanswer : incorrectanswer : neutral,
                  
                  ),
                )
            ],
          ),
        ),
      ),
      floatingActionButton: NextButton(nextquestion: nextquestion),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
