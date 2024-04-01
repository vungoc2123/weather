import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/core/constants/app_colors.dart';
import 'package:weather/core/utils/time_utils.dart';
import 'package:weather/domain/models/weather_forecast_model.dart';
import 'package:weather/gen/assets.gen.dart';
import 'package:weather/presentation/common_widget/item_weather_horizontal.dart';

class Weather5DayWidget extends StatefulWidget {
  WeatherForecastModel? weatherForecast;
  Weather5DayWidget({this.weatherForecast});

  @override
  State<StatefulWidget> createState() {
    return Weather5DayPage();
  }
}

class Weather5DayPage extends State<Weather5DayWidget> {
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
              borderRadius: BorderRadius.circular(16.r),),
          child: ListView.separated(
            itemCount: widget.weatherForecast?.data?.length ?? 0,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return ItemWeatherHorizontal(
                  widget: Image.network('https://cdn.weatherbit.io/static/img/icons/${widget.weatherForecast?.data?[index]?.weather?['icon']}.png', width: 40.r, height: 40.r),
                  time: TimeUtils().convertToDayOfWeek(widget.weatherForecast?.data?[index].timestamp_local),
                  temp: "72° / ${widget.weatherForecast?.data?[index].app_temp}°");
            },
            separatorBuilder: (BuildContext context, int index) => SizedBox(
              height: 20.h,
            ),
          ),
        ),
      ],
    );
  }
}
