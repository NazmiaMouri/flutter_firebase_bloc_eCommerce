import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/view/widgets/circle_image.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: Column(
        children: [
          CircularImageWithBackground(
            foregroundImageURL: "https://i.imgur.com/OB0y6MR.jpg",
            width: 22,
            height: 22,
          ),
          Text('name,'),
          Text('voucher'),
          Text('favourites'),
          Text('Address'),
          Text('Help center'),
          Text('Settings'),
          Text('terms and conditions'),
          Text('logout')
        ],
      )),
    );
  }
}
