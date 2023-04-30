import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme textThemeMethod(ThemeData base) => base.textTheme.merge(
      TextTheme(
        /* displayLarge: GoogleFonts.poppins(fontSize: 96),
        displayMedium: GoogleFonts.poppins(fontSize: 60),
        displaySmall: GoogleFonts.poppins(fontSize: 40), */
        headlineLarge:
            GoogleFonts.poppins(fontSize: 34, fontWeight: FontWeight.w500),
        headlineMedium:
            GoogleFonts.poppins(fontSize: 30, fontWeight: FontWeight.w500),
        headlineSmall:
            GoogleFonts.poppins(fontSize: 25, fontWeight: FontWeight.w500),
        titleLarge:
            GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500),
        titleMedium:
            GoogleFonts.poppins(fontSize: 17, fontWeight: FontWeight.w500),
        titleSmall:
            GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
        bodyLarge: GoogleFonts.poppins(fontSize: 16),
        bodyMedium: GoogleFonts.poppins(fontSize: 15),
        bodySmall: GoogleFonts.poppins(fontSize: 14),
        labelLarge: GoogleFonts.poppins(fontSize: 14, color: Colors.black45),
        labelMedium: GoogleFonts.poppins(fontSize: 13, color: Colors.black45),
        labelSmall: GoogleFonts.poppins(fontSize: 12, color: Colors.black45),
      ),
    );
