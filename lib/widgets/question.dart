import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({super.key, required this.question, required this.indexAction, required this.totalquestions});

  final String question;
  final int indexAction;
  final int totalquestions;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text('Question ${indexAction +1}/$totalquestions\n\n$question',style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
    );
  }
}