import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/view/widgets/filled_button.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite'),
      ),
      body: Builder(builder: (context) {
        return ListView.builder(
            itemBuilder: (_, int index) => favTile(context), itemCount: 10);
      }),
    );
  }
}

Widget favTile(BuildContext context) {
  return InkWell(
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 6.0,
              ),
            ]),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Image.network('', loadingBuilder: (context, child, progress) {
                //   return progress == null ? child : LinearProgressIndicator();
                // }),
                Image.asset(
                  'assets/images/profile_pic.png',
                  fit: BoxFit.contain,
                  width: 150,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text('product name'), Text('stock status')],
                ),
                Text('Amount')
              ],
            ),
            Align(
              child: Icon(Icons.arrow_right),
              alignment: Alignment.topRight,
            )
          ],
        ),
      ),
      onTap: () {
        showBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 30.0, horizontal: 15),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Checkout", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        InkWell(
                          child: Icon(Icons.close),
                          onTap: () => Navigator.pop(context),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Delivery"),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextButton.icon(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            onPressed: () {},
                            icon: const Icon(Icons.chevron_left),
                            label: const Text('Select Method'),
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Payment"),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextButton.icon(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            onPressed: () {},
                            icon: const Icon(Icons.chevron_left),
                            label: const Text('Select Method'),
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Promo Code"),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextButton.icon(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            onPressed: () {},
                            icon: const Icon(Icons.chevron_left),
                            label: const Text('Pick discount'),
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total Cost"),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextButton.icon(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            onPressed: () {},
                            icon: const Icon(Icons.chevron_left),
                            label: const Text('amount'),
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    SizedBox(height: 20,),
                    Text(
                      'By placing an order you agree to our ',
                    ),
                    Text(
                      'Terms And Conditions.',
                    ),
                    SizedBox(height: 20,),
                    filledButton(
                          context: context,
                          buttonName: 'Place Order',
                          buttonColour: Colors.black,
                          buttonAction: ()=>Navigator.pushNamed(context,  '/home')
                        )
                  ]));
            });
      });
}
