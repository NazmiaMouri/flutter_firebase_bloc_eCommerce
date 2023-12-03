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
        backgroundColor: Colors.white,
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
                  child: brandText(text: 'Al - Maequl', style: const TextStyle(fontSize: 20, color: brandTextolor)),
                ),
                malabisCollectionText(fontSize: 6, letterSpacing: 2),
              ],
            )),
        actions: const [
          InkWell(
            child: Icon(
              Icons.notifications_outlined,
            ),
          ),
          SizedBox(width: 10,),
          InkWell(
            child: Icon(
              Icons.shopping_cart_outlined,
            ),
          ),
           SizedBox(width: 10,),
          InkWell(
            child: Icon(
              Icons.favorite_border_outlined,
            ),
          ),
           SizedBox(width: 10,),
          InkWell(
            child: Icon(
              Icons.search_outlined,
            ),
          ),
        ],
      ),
      endDrawer: Drawer(
          child: Column(
        children: [
          CircularImageWithBackground(
            foregroundImageURL: "https://i.imgur.com/OB0y6MR.jpg",
            width: 22,
            height: 22,
          ),
          const Text('name,'),
          const Text('voucher'),
          const Text('favourites'),
          const Text('Address'),
          const Text('Help center'),
          const Text('Settings'),
          const Text('terms and conditions'),
          const Text('logout')
        ],
      )),
      body: Column(
        children: [
         
          SvgPicture.asset('assets/icons/ic_notification.svg'),
        ],
      ),
    );
  }
}
