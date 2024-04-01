import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/core/constants/app_colors.dart';
import 'package:weather/core/utils/time_utils.dart';
import 'package:weather/domain/models/weather_model.dart';
import 'package:weather/gen/assets.gen.dart';

class WeatherCurrentWidget extends StatefulWidget {
  WeatherModel? weather;


  WeatherCurrentWidget({this.weather});

  @override
  State<StatefulWidget> createState() {
    return WeatherCurrentPage();
  }
}

class WeatherCurrentPage extends State<WeatherCurrentWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
          color: AppColors.blue,
          borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(TimeUtils().formatDateTime(widget.weather?.datetime),
                    style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white)),
                SizedBox(
                  height: 10.h,
                ),
                Text(widget.weather?.weather?['description'] ?? '',
                    style: GoogleFonts.poppins(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white))
              ],
            ),
            Image.network('https://cdn.weatherbit.io/static/img/icons/${widget.weather?.weather?['icon']}.png')
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
            Text('${widget.weather?.city_name}, ${widget.weather?.country_code}',
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
            Text("${widget.weather?.app_temp}°C",
                style: GoogleFonts.poppins(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white)),
            item(
                widget: Assets.icons.rain
                    .svg(color: AppColors.white, width: 20.w, height: 20.w),
                text: "${widget.weather?.rh}%"),

            item(
                widget: Assets.icons.sun
                    .svg(color: AppColors.white, width: 20.w, height: 20.w),
                text: "${widget.weather?.uv?.toInt()}"),
            item(
                widget: Assets.icons.wind
                    .svg(color: AppColors.white, width: 20.w, height: 20.w),
                text: "${widget.weather?.wind_spd} mp/h"),
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
