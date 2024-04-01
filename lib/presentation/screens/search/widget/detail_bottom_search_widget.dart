import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/core/constants/app_colors.dart';
import 'package:weather/gen/assets.gen.dart';

class DetailBottomSearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.w),
      child: Column(
        children: [
          Row(
            children: [
              Assets.icons.location.svg(width: 30.r, height: 30.r),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("August, 10th 2020",
                      style: GoogleFonts.poppins(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black)),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text("August, 10th 2020",
                      style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.grey)),
                ],
              ),
              const Spacer(),
              Assets.icons.cloudSunRainWeather.svg(width: 40.r, height: 40.r),
              SizedBox(width: 10.w),
              Text("72°",
                  style: GoogleFonts.poppins(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black)),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Longitude and latitude",
                      style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.grey)),
                  SizedBox(height: 10.h,),
                  Text("52.498611, 13.406889 ",
                      style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Wind",
                      style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.grey)),
                  SizedBox(height: 10.h,),
                  Text("134 mp/h",
                      style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black)),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
