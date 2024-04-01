import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weather/core/constants/app_colors.dart';
import 'package:weather/domain/models/location_model.dart';
import 'package:weather/gen/assets.gen.dart';
import 'package:weather/presentation/common_widget/app_bar.dart';
import 'package:weather/presentation/screens/search/bloc/search_cubit.dart';
import 'package:weather/presentation/screens/search/bloc/search_state.dart';
import 'package:weather/presentation/screens/search/widget/detail_bottom_search_widget.dart';
import 'package:weather/presentation/screens/search/widget/detail_search_widget.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SearchPage();
  }
}

class SearchPage extends State<SearchScreen> {
  LatLng myLatLong = const LatLng(21.0108003, 105.7757932);
  final CustomInfoWindowController _customInfoWindowController = CustomInfoWindowController();
  GoogleMapController? _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyE5,
      body: SafeArea(
        child: BlocBuilder<SearchCubit, SearchState>(
          builder: (BuildContext context, SearchState state) {
            if (state.isShow == false) {
              _customInfoWindowController.hideInfoWindow!();
            }else if(state.marker != null){
              _customInfoWindowController.addInfoWindow!(
                DetailSearchWidget(weather: state.weatherModel),
                state.latlng!,
              );
              _controller!.animateCamera(CameraUpdate.newLatLng(state.latlng!));
            }
            return Column(
              children: [
                Container(
                  margin: EdgeInsets.all(16.w),
                  child: AppBarWidget(
                    widgetLeft: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Assets.icons.back.svg(
                            color: AppColors.black, width: 20.r, height: 20.r)),
                    widgetCenter: Text(
                      "Search",
                      style: GoogleFonts.poppins(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black),
                    ),
                    widgetRight: const Icon(Icons.more_vert),
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      GoogleMap(
                          onMapCreated: (controller) {
                            _customInfoWindowController.googleMapController = controller;
                            _controller = controller;
                          },
                          onCameraMove: (position) {
                            _customInfoWindowController.onCameraMove!();
                          },
                          onTap: (LatLng latlng) {
                            LocationModel location = LocationModel(
                                latitude: latlng.latitude,
                                longitude: latlng.longitude);
                            if(state.isShow == false || state.isShow == null){
                              Marker marker = Marker(
                                markerId: const MarkerId('Google'),
                                draggable: true,
                                position: latlng,
                              );
                              BlocProvider.of<SearchCubit>(context)
                                  .fetchData(location, marker, latlng);
                            }else{
                              if(state.marker != null){
                                BlocProvider.of<SearchCubit>(context)
                                    .fetchData(location, state.marker!, latlng);
                              }
                            }
                            // bottomSheet();
                          },
                          initialCameraPosition: CameraPosition(
                            target: myLatLong,
                            zoom: 12,
                          ),
                          markers: state.marker != null
                              ? {state.marker!}
                              : <Marker>{}),
                      CustomInfoWindow(
                        controller: _customInfoWindowController,
                        height: 220.h,
                        width: 1.sw - 32.w,
                        offset: 70,
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  void bottomSheet() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return IntrinsicHeight(
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15.r),
                    topLeft: Radius.circular(15.r),
                  )),
              child: DetailBottomSearchWidget(),
            ),
          );
        });
  }
}
