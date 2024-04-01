import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/core/constants/app_colors.dart';
import 'package:weather/core/utils/time_utils.dart';
import 'package:weather/domain/models/weather_detail_model.dart';
import 'package:weather/domain/models/weather_forecast_model.dart';
import 'package:weather/domain/models/weather_model.dart';
import 'package:weather/gen/assets.gen.dart';
import 'package:weather/presentation/common_widget/item_weather_vertical.dart';

class WeatherTodayWidget extends StatefulWidget {
  WeatherForecastModel? weatherForecast;
  WeatherModel? weather;


  WeatherTodayWidget({this.weatherForecast, this.weather});

  @override
  State<StatefulWidget> createState() {
    return WeatherTodayPage();
  }
}

class WeatherTodayPage extends State<WeatherTodayWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Forecast",
          style: GoogleFonts.poppins(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.black),
        ),
        SizedBox(
          height: 15.h,
        ),
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16.r),
              ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.weatherForecast?.city_name ?? '',
                style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(TimeUtils().formatDateTime(widget.weather?.datetime),
                  style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black)),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  widget.weatherForecast?.data?.length ?? 0,
                  (index) => ItemWeatherVertical(
                      time: TimeUtils().convertTo12HourFormat(widget.weatherForecast?.data?[index].timestamp_local),
                      widget:
                      Image.network('https://cdn.weatherbit.io/static/img/icons/${widget.weatherForecast?.data?[index]?.weather?['icon']}.png', width: 40.r, height: 40.r),
                      temp: '${widget.weatherForecast?.data?[index]?.app_temp.toString()}°C' ??  ''),
                ),
              )

            ],
          ),
        ),
      ],
    );
  }
}
