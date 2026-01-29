import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Texts {
  static headertitle(String header, double sp) {
    return Text(
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      header,
      style: GoogleFonts.arimo(
        color: const Color.fromARGB(255, 255, 255, 255),
        fontSize: sp,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  static subtitle(String subtitle, double sp) {
    return Text(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      subtitle,
      style: GoogleFonts.arimo(
        color: const Color.fromARGB(255, 243, 238, 238),
        fontSize: sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static rating(String rating, double size) {
    {
      return Text(
        rating,
        style: GoogleFonts.notoSerif(
          color: const Color.fromARGB(255, 255, 255, 255),
          fontSize: size,
          fontWeight: FontWeight.bold,
        ),
      );
    }
  }

  static anytext(String tex, double size) {
    {
      return Text(
        tex,
        style: GoogleFonts.notoSerif(
          color: const Color.fromARGB(255, 255, 255, 255),
          fontSize: size,
          fontWeight: FontWeight.bold,
        ),
      );
    }
  }
}
