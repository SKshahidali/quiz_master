import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_master/constants.dart';

class ResultsBox extends StatelessWidget {
  const ResultsBox({super.key,required this.result,required this.questionLength});

final int result;
final int questionLength;


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: bgcolor,
      content: Padding(
        padding: const EdgeInsets.all(70.0),
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Results',style: GoogleFonts.montserrat(color: neutral,fontSize: 36,fontWeight: FontWeight.bold),),
            const SizedBox(height: 20,),
            CircleAvatar(
              child: Text('$result/$questionLength',style: GoogleFonts.montserrat(fontSize: 24,fontWeight: FontWeight.bold),),
              radius: 60,
            ),

            const SizedBox(height: 25,),
            GestureDetector(
              onTap: () {},
              child: Text("Start Over",style: GoogleFonts.montserrat(fontSize: 20,fontWeight: FontWeight.w700,color: neutral,letterSpacing: 1),))

            
          ],
        ),
      ),
    );
  }
}