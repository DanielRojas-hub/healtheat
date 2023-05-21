import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme textThemeMethod(ThemeData base) => base.textTheme.merge(
      TextTheme(
        // displayLarge: GoogleFonts.poppins(fontSize: 96),
        // displayMedium: GoogleFonts.poppins(fontSize: 60),
        // displaySmall: GoogleFonts.poppins(fontSize: 40),
        headlineLarge:
            GoogleFonts.poppins(fontSize: 30, fontWeight: FontWeight.w700),
        headlineMedium:
            GoogleFonts.poppins(fontSize: 26, fontWeight: FontWeight.w700),
        headlineSmall:
            GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w700),
        titleLarge:
            GoogleFonts.poppins(fontSize: 17, fontWeight: FontWeight.w600),
        titleMedium:
            GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600),
        titleSmall:
            GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600),
        bodyLarge: GoogleFonts.poppins(fontSize: 16),
        bodyMedium: GoogleFonts.poppins(fontSize: 15),
        bodySmall: GoogleFonts.poppins(fontSize: 14),
        labelLarge: GoogleFonts.poppins(
            fontSize: 14, color: Colors.black45, fontWeight: FontWeight.w500),
        labelMedium: GoogleFonts.poppins(
            fontSize: 13, color: Colors.black45, fontWeight: FontWeight.w500),
        labelSmall: GoogleFonts.poppins(
            fontSize: 11,
            color: Colors.black45,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.5),
      ),
    );
