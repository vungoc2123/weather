import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/core/constants/app_colors.dart';

class AppText {
  static Text text12({String? text, FontWeight? fontWeight, Color? color}) {
    return Text(
      text ?? '',
      style: GoogleFonts.poppins(
          fontSize: 12.sp, fontWeight: fontWeight, color: color),
    );
  }

  static Text text14({String? text, FontWeight? fontWeight, Color? color}) {
    return Text(
      text ?? '',
      style: GoogleFonts.poppins(
          fontSize: 14.sp, fontWeight: fontWeight, color: color),
    );
  }

  static Text text16({String? text, FontWeight? fontWeight, Color? color}) {
    return Text(
      text ?? '',
      style: GoogleFonts.poppins(
          fontSize: 16.sp, fontWeight: fontWeight, color: color),
    );
  }

  static Text text24({String? text, FontWeight? fontWeight, Color? color}) {
    return Text(
      text ?? '',
      style: GoogleFonts.poppins(
          fontSize: 24.sp, fontWeight: fontWeight, color: color),
    );
  }
}
