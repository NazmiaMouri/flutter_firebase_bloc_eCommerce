import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase_ecommerce/view/widgets/debug_print.dart';

void getUserDetail(email){
  FirebaseFirestore.instance
  .collection('users')
  .where('email', isEqualTo: email)
  .get()
  .then((QuerySnapshot queryResult){
    DebugPrint(queryResult);
  });
}