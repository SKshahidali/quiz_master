import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OptionsCard extends StatelessWidget {
  const OptionsCard({super.key, required this.option, required this.color, required this.onTap});

  final String option;
  final Color color;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: color,
        child: ListTile(
          title: Text(option,textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 18),),
        ),
      ),
    );
  }
}