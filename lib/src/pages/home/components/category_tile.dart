import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greengrocer/src/config/custom_colors.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onPressed,
  });

  final String category;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.transparent,
          ),
          child: Text(
            category,
            style: GoogleFonts.bigshotOne(
              color: isSelected
                  ? CustomColors.customContrastColor
                  : CustomColors.customContrastColorNomeApp,
              fontSize: isSelected ? 16 : 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
