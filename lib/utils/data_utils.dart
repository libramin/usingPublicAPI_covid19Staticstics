import 'package:intl/intl.dart';

class DataUtils{
  static String numFormat(double value){
    return NumberFormat('###,###,###,###').format(value);
  }

  static String simpleDayFormat (DateTime time){
    return DateFormat('MM.dd').format(time);
  }
}
