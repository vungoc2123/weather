import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/core/constants/app_colors.dart';

class ItemWeatherHorizontal extends StatelessWidget {
  String? time;
  Widget? widget;
  String? temp;

  ItemWeatherHorizontal({this.time, this.widget, this.temp});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(child: widget),
      SizedBox(
        width: 16.w,
      ),
      Expanded(
        child: Text(
          time ?? '',
          style: GoogleFonts.poppins(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.black),
        ),
      ),
      SizedBox(
        width: 10.w,
      ),
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
