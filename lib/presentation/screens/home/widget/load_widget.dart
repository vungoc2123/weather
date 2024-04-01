import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weather/core/constants/app_colors.dart';

class LoadingWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Shimmer.fromColors(
        baseColor: AppColors.white,
        highlightColor: AppColors.whiteEffect,
        period: const Duration(milliseconds: 1000),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              skeleton(width: 345.w, height: 180.h, border: 15.r),
              SizedBox( height: 20.h,),
              skeleton(width: 100.w, height: 30.h, border: 8.r),
              SizedBox( height: 20.h,),
              skeleton(width: 345.w, height: 180.h, border: 15.r),
              SizedBox( height: 20.h,),
              skeleton(width: 100.w, height: 30.h, border: 8.r),
              SizedBox( height: 20.h,),
              skeleton(width: 345.w, height: 360.h, border: 15.r),
            ],
          ),
        ),
      ),
    );
  }
  Widget skeleton({required double width, required double height, double? border}){
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(border ?? 0)
      ),
    );
  }
}