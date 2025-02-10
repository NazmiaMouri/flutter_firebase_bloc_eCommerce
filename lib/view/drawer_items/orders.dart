import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your orders'),
      ),
      body: ListView.builder(itemBuilder: (_, int index) {
        return orderTile('121323', DateTime.now(), 'Complete', '1100 BDT');
      }),
    );
  }

  Widget orderTile(
      String orderId, DateTime date, String orderStatus, String amount) {
    return Container(
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(orderId),
              // const Icon(
              //   Icons.content_copy,
              // ),
              Column(
                children: [
                  Text(orderStatus),
                  Text(DateFormat.yMMMd().format(date)),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(amount)
                ],
              )
            ],
          ),
          const Divider(),
          const Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: Row(
                  children: [
                    Icon(
                      Icons.list_alt,
                    ),
                    Text('Details'),
                  ],
                ),
              ),
              InkWell(
                child: Row(
                  children: [
                    Icon(
                      Icons.shopping_bag,
                    ),
                    Text('Reorder'),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
