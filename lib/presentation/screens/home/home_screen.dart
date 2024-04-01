import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/core/constants/app_colors.dart';
import 'package:weather/core/enums/load_status.dart';
import 'package:weather/domain/models/location_model.dart';
import 'package:weather/gen/assets.gen.dart';
import 'package:weather/presentation/common_widget/app_bar.dart';
import 'package:weather/presentation/routers/route_name.dart';
import 'package:weather/presentation/screens/home/bloc/home_cubit.dart';
import 'package:weather/presentation/screens/home/bloc/home_state.dart';
import 'package:weather/presentation/screens/home/widget/load_widget.dart';
import 'package:weather/presentation/screens/home/widget/weather_5day_widget.dart';
import 'package:weather/presentation/screens/home/widget/weather_current_widget.dart';
import 'package:weather/presentation/screens/home/widget/weather_today_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePage();
  }
}

class HomePage extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    LocationModel location = LocationModel(latitude: 21.0108003, longitude: 105.7757932);
    BlocProvider.of<HomeCubit>(context).fetchData(location);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.greyE5,
        body: SafeArea(
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (BuildContext context, HomeState state) {
              if (state.status == LoadStatus.success) {
                return Container(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppBarWidget(
                        widgetLeft: Text(
                          state.currentWeather?.city_name ?? '',
                          style: GoogleFonts.poppins(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black),
                        ),
                        widgetRight: InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                RouteName.search,
                              );
                            },
                            child: Assets.icons.search
                                .svg(color: AppColors.black)),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              WeatherCurrentWidget(
                                  weather: state.currentWeather),
                              SizedBox(
                                height: 15.h,
                              ),
                              WeatherTodayWidget(weather: state.currentWeather,weatherForecast: state.todayForecast ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Weather5DayWidget(weatherForecast: state.fiveDayForecast)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              } else {
                return Container(
                    padding: EdgeInsets.all(16.w),
                    child:  LoadingWidget());
              }
            },
          ),
        ));
  }
}
