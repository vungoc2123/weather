import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/core/constants/app_colors.dart';

class ItemWeatherVertical extends StatelessWidget {
  String? time;
  Widget? widget;
  String? temp;

  ItemWeatherVertical({this.time, this.widget, this.temp});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        time ?? '',
        style: GoogleFonts.poppins(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.grey),
      ),
      SizedBox(height: 10.h,),
      Container(child: widget),
      SizedBox(height: 10.h,),
      Text(
        temp ?? '',
        style: GoogleFonts.poppins(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.black),
      )
    ]);
  }
}
