import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_master/constants.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key, required this.nextquestion});

  final VoidCallback nextquestion;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: nextquestion,
      child: Container(
        decoration: BoxDecoration(
          color: neutral,
          borderRadius: BorderRadius.circular(12)
        ),
        width: MediaQuery.of(context).size.width * 0.75,
        height: 45,
        child: Center(child: Text('Next Question',textAlign: TextAlign.center,style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 16),)),
      ),
    );
  }
}