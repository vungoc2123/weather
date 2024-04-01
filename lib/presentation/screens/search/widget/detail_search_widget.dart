import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/core/constants/app_colors.dart';
import 'package:weather/core/utils/time_utils.dart';
import 'package:weather/domain/models/weather_model.dart';
import 'package:weather/gen/assets.gen.dart';

class DetailSearchWidget extends StatelessWidget {
  WeatherModel? weather;

  DetailSearchWidget({this.weather});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw - 32.w,
      height: 200.h,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
          color: AppColors.blue,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
                color: AppColors.black.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(0, 3))
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(TimeUtils().formatDateTime(weather?.datetime),
                    style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white)),
                SizedBox(
                  height: 10.h,
                ),
                Text(weather?.weather?['description'] ?? '',
                    style: GoogleFonts.poppins(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white))
              ],
            ),
            Image.network(
                'https://cdn.weatherbit.io/static/img/icons/${weather?.weather?['icon']}.png', width: 100.r,height: 100.r,)
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          children: [
            Assets.icons.location.svg(color: AppColors.white),
            SizedBox(
              width: 10.w,
            ),
            Text('${weather?.city_name}, ${weather?.country_code}',
                style: GoogleFonts.poppins(
                    fontSize: 14.sp, color: AppColors.white))
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("${weather?.app_temp}°C",
                style: GoogleFonts.poppins(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white)),
            item(
                widget: Assets.icons.rain
                    .svg(color: AppColors.white, width: 20.w, height: 20.w),
                text: "${weather?.rh}%"),
            item(
                widget: Assets.icons.sun
                    .svg(color: AppColors.white, width: 20.w, height: 20.w),
                text: "${weather?.uv?.toInt()}"),
            item(
                widget: Assets.icons.wind
                    .svg(color: AppColors.white, width: 20.w, height: 20.w),
                text: "${weather?.wind_spd?.toInt()} mp/h"),
          ],
        )
      ]),
    );
  }

  Widget item({required Widget widget, required String text}) {
    return Row(
      children: [
        widget,
        SizedBox(
          width: 5.w,
        ),
        Text(text,
            style: GoogleFonts.poppins(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.white)),
      ],
    );
  }
}
