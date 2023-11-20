import 'package:flutter_firebase_ecommerce/resources/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

class showToast {
  static final showToast toast = showToast._internal();

  factory showToast() {
    return toast;
  }

  showToast._internal();

  void successToast(msgType, msg) {
    Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: success,
        textColor: success,
        fontSize: 16.0);
  }
}
