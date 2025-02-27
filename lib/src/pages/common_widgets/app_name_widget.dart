import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greengrocer/src/config/custom_colors.dart';

class AppNameWidget extends StatelessWidget {
  final Color? greenTileColor;
  final double textSize;

  const AppNameWidget({
    super.key,
    this.greenTileColor,
    this.textSize = 30,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: TextStyle(
          fontSize: textSize,
        ),
        children: [
          TextSpan(
            text: 'Green',
            style: GoogleFonts.satisfy(
              color: greenTileColor ?? CustomColors.customContrastColorNomeApp,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: 'grocer',
            style: GoogleFonts.bigshotOne(
              color: CustomColors.customContrastColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
