import 'package:flutter_firebase_ecommerce/resources/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShowToast {
  static final ShowToast toast = ShowToast._internal();

  factory ShowToast() {
    return toast;
  }

  ShowToast._internal();

  static successToast(msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: successBackground,
        textColor: success,
        fontSize: 16.0);
  }

  static warningToast(msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: warningBackground,
        textColor: warning,
        fontSize: 16.0);
  }

  static errorToast(msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: errorBackground,
        textColor: error,
        fontSize: 16.0);
  }
}
