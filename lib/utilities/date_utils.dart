import 'package:intl/intl.dart';

class DateUtils {
  static List<String> days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  static DateTime parseDate(String d) => DateTime.parse(d);

  static String weekDay(DateTime date) => DateUtils.days[date.weekday - 1];

  static final DateFormat _dateFormat = new DateFormat("d MMMM, yyyy");
  static String formatDate(DateTime d) => _dateFormat.format(d);
}