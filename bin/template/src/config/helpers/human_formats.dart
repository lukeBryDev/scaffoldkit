import 'package:intl/intl.dart';

class HumanFormats {
  static String number(double number, [int decimals = 0]) {
    final formattedNumber = NumberFormat.compactCurrency(
      decimalDigits: decimals,
      symbol: '',
      locale: 'en',
    ).format(number);

    return formattedNumber;
  }

  /// -default format 1/12/2020
  static String date({required DateTime? date, String? format = 'yMd'}) {
    if (date == null || format == null) return "";
    if (date.isUtc) {
      return DateFormat(format, 'ES_es').format(date.toLocal());
    } else {
      return DateFormat(format, 'ES_es').format(date);
    }
  }
}
