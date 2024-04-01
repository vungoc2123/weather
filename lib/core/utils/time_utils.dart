import 'package:easy_localization/easy_localization.dart';

class TimeUtils{
  String formatDateTime(String? dateString){
    if(dateString == null) return '';
    dateString = dateString.replaceAll(":", " ");
    dateString = '$dateString:00';
    DateTime dateTime = DateFormat("yyyy-MM-dd HH:mm").parse(dateString);
    String formattedDate = DateFormat("MMMM, dd'th' yyyy").format(dateTime);
    return formattedDate;
  }

  String convertTo12HourFormat(String? timeString) {
    if(timeString == null) return '';
    DateTime dateTime = DateTime.parse(timeString);
    String formattedTime = DateFormat.jm().format(dateTime);
    return formattedTime;
  }

  String convertToDayOfWeek(String? timestamp) {
    if(timestamp == null) return '';
    DateTime dateTime = DateTime.parse(timestamp);
    String dayOfWeek = DateFormat('EEEE').format(dateTime);
    return dayOfWeek;
  }
}