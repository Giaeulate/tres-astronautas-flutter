import 'package:intl/intl.dart';

final DateFormat formatter = DateFormat('yyyy-MM-dd');

String getCustomDate(DateTime? dateTime) {
  if (dateTime == null) {
    return "Sin información";
  }
  return formatter.format(dateTime);
}
