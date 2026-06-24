import 'package:intl/intl.dart';

String formatDateTime(DateTime dateTime) {
  return DateFormat('yyyy-MM-dd HH:mm').format(dateTime);
}

String formatDateTimeWithSeconds(DateTime dateTime) {
  return DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
}
