import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/resources/colors.dart';
import 'package:flutter_firebase_ecommerce/view/widgets/circle_image.dart';
import 'package:flutter_firebase_ecommerce/view/widgets/font.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
            height: 50,
            width: 120,
            decoration: const BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                'assets/images/needle.png',
              ),
            )),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 2.0),
                  child: brandText(
                      text: 'Al - Maequl',
                      style:
                          const TextStyle(fontSize: 20, color: brandTextolor)),
                ),
                malabisCollectionText(fontSize: 6, letterSpacing: 2),
              ],
            )),
        actions: [
          Icon(
            Icons.notifications_outlined,
          ),
        ],
      ),
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
      body: Column(
        children: [
          Container(
              color: Colors.red,
              child: SvgPicture.asset('assets/icons/ic_notification.svg',
                  width: 50, height: 50)),
          SvgPicture.asset('assets/icons/ic_notification.svg'),
        ],
      ),
    );
  }
}
