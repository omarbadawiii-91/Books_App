import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Texts {
  static headertitle(String header) {
    return Text(
      header,
      style: GoogleFonts.poppins(
        color: const Color.fromARGB(255, 255, 255, 255),
        fontSize: 30,
        fontWeight: FontWeight.w700,
      ),
    );
  }
  static subtitle(String subtitle) {
    return Text(
      subtitle,
      style: GoogleFonts.arimo(
        color: const Color.fromARGB(255, 255, 255, 255),
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
  static rating (String rating,double size){ {
    return Text(
      rating,
      style: GoogleFonts.arimo(
        color: const Color.fromARGB(255, 255, 255, 255),
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
  
}
static anytext (String tex,double size){ {
    return Text(
      tex,
      style: GoogleFonts.poppins(
        color: const Color.fromARGB(255, 255, 255, 255),
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
  
}
}