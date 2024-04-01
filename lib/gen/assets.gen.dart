/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/back.svg
  SvgGenImage get back => const SvgGenImage('assets/icons/back.svg');

  /// File path: assets/icons/cloud_sun_rain_weather.svg
  SvgGenImage get cloudSunRainWeather =>
      const SvgGenImage('assets/icons/cloud_sun_rain_weather.svg');

  /// File path: assets/icons/cloud_sun_weather.svg
  SvgGenImage get cloudSunWeather =>
      const SvgGenImage('assets/icons/cloud_sun_weather.svg');

  /// File path: assets/icons/cloud_weather.svg
  SvgGenImage get cloudWeather =>
      const SvgGenImage('assets/icons/cloud_weather.svg');

  /// File path: assets/icons/location.svg
  SvgGenImage get location => const SvgGenImage('assets/icons/location.svg');

  /// File path: assets/icons/mostlycloudy.svg
  SvgGenImage get mostlycloudy =>
      const SvgGenImage('assets/icons/mostlycloudy.svg');

  /// File path: assets/icons/rain.svg
  SvgGenImage get rain => const SvgGenImage('assets/icons/rain.svg');

  /// File path: assets/icons/rain_sun_weather.svg
  SvgGenImage get rainSunWeather =>
      const SvgGenImage('assets/icons/rain_sun_weather.svg');

  /// File path: assets/icons/rain_weather.svg
  SvgGenImage get rainWeather =>
      const SvgGenImage('assets/icons/rain_weather.svg');

  /// File path: assets/icons/search.svg
  SvgGenImage get search => const SvgGenImage('assets/icons/search.svg');

  /// File path: assets/icons/snow_weather.svg
  SvgGenImage get snowWeather =>
      const SvgGenImage('assets/icons/snow_weather.svg');

  /// File path: assets/icons/storm_weather.svg
  SvgGenImage get stormWeather =>
      const SvgGenImage('assets/icons/storm_weather.svg');

  /// File path: assets/icons/sun.svg
  SvgGenImage get sun => const SvgGenImage('assets/icons/sun.svg');

  /// File path: assets/icons/sun_weather.svg
  SvgGenImage get sunWeather =>
      const SvgGenImage('assets/icons/sun_weather.svg');

  /// File path: assets/icons/temperature.svg
  SvgGenImage get temperature =>
      const SvgGenImage('assets/icons/temperature.svg');

  /// File path: assets/icons/wind.svg
  SvgGenImage get wind => const SvgGenImage('assets/icons/wind.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        back,
        cloudSunRainWeather,
        cloudSunWeather,
        cloudWeather,
        location,
        mostlycloudy,
        rain,
        rainSunWeather,
        rainWeather,
        search,
        snowWeather,
        stormWeather,
        sun,
        sunWeather,
        temperature,
        wind
      ];
}

class $AssetsTranslationsGen {
  const $AssetsTranslationsGen();

  /// File path: assets/translations/en-US.json
  String get enUS => 'assets/translations/en-US.json';

  /// File path: assets/translations/vi-VN.json
  String get viVN => 'assets/translations/vi-VN.json';

  /// List of all assets
  List<String> get values => [enUS, viVN];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsTranslationsGen translations = $AssetsTranslationsGen();
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
