import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_master/constants.dart';

class OptionsCard extends StatelessWidget {
  const OptionsCard({super.key, required this.option, required this.color,});

  final String option;
  final Color color;


  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: ListTile(
        title: Text(option,textAlign: TextAlign.center,
        style: GoogleFonts.montserrat(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: color.red != color.green ? neutral : Colors.black
          ),),
      ),
    );
  }
}