import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase_ecommerce/models/user.dart';
import 'package:flutter_firebase_ecommerce/view/widgets/toast.dart';

void createUserCollection(User user) {
  FirebaseFirestore.instance.collection('users').add({
    'name': user.name,
    'email': user.email,
    'phone Number': user.phoneNumber
  });
  ShowToast.successToast('User is registered successfully!');
}
