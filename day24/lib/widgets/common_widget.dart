import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color buttonClr = Color(0xFF5F53D0);
const Color cardClr = Color(0xffBAD7E9);
const Color textlightClr = Color(0xFFAAA1A1);
const Color textdarkClr = Color(0xff1B2430);

mystyle(double size, [Color? clr, FontWeight? fw]) {
  return GoogleFonts.poppins(
    fontSize: size,
    color: clr,
    fontWeight: fw,
  );
}
