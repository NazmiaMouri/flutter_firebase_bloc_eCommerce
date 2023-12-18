import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/models/rating.dart';
import 'package:flutter_firebase_ecommerce/resources/colors.dart';
import 'package:flutter_firebase_ecommerce/resources/enums.dart';
import 'package:flutter_firebase_ecommerce/view/widgets/filled_button.dart';

class ViewProductDetail extends StatefulWidget {
  const ViewProductDetail({super.key});

  @override
  State<ViewProductDetail> createState() => _ViewProductDetailState();
}

class _ViewProductDetailState extends State<ViewProductDetail> {
  List<Rating> ratingStar = [
    Rating(),
    Rating(),
    Rating(),
    Rating(),
    Rating(),
  ];

  double ratingNumber = 0;
  int quantity = 1;

  Sizes selection = Sizes.small;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset('assets/images/lime_blue_blur.png'),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const InkWell(
                      child: Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: Icon(
                          Icons.arrow_back,
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: const InkWell(
                        child: Icon(
                          Icons.favorite_border_outlined,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.9,
                child: DraggableScrollableSheet(
                    initialChildSize: 0.5, // Initial size of the sheet
                    minChildSize:
                        0.5, // Minimum size the sheet can be dragged to
                    maxChildSize: 0.5,
                    builder: (context, scrollController) {
                      return SingleChildScrollView(
                        controller: scrollController,
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: const ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                              ),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Name',
                                    style: TextStyle(fontSize: 24),
                                  ),
                                  Text('Price', style: TextStyle(fontSize: 24))
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: ratingStar
                                        .map(
                                          (item) => InkWell(
                                            onTap: () {
                                              setState(() {
                                                ratingNumber = ratingStar
                                                    .indexOf(item)
                                                    .toDouble();
                                              });
                                            },
                                            child: Icon(
                                              Icons.star_outlined,
                                              color: item.rated
                                                  ? rating
                                                  : Colors.black12,
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '($ratingNumber)',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: IntrinsicHeight(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      InkWell(
                                        onTap: () => setState(() {
                                          quantity -= 1;
                                        }),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: const Icon(
                                            Icons.remove_outlined,
                                          ),
                                        ),
                                      ),
                                      const VerticalDivider(
                                        width: 0,
                                        thickness: 1,
                                        indent: 0,
                                        endIndent: 0,
                                        color: Colors.grey,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: Text(
                                          '$quantity',
                                          style: TextStyle(fontSize: 24),
                                        ),
                                      ),
                                      const VerticalDivider(
                                        width: 0,
                                        thickness: 1,
                                        indent: 0,
                                        endIndent: 0,
                                        color: Colors.grey,
                                      ),
                                      InkWell(
                                        onTap: () => setState(() {
                                          quantity += 1;
                                        }),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: const Icon(
                                            Icons.add_outlined,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              const Text('DESCRIPTION'),
                              SizedBox(
                                height: 5,
                              ),
                              const Text('Paragraph'),
                              SizedBox(
                                height: 10,
                              ),
                              const Text('SELECT SIZE'),
                              SegmentedButton<Sizes>(
                                segments: const <ButtonSegment<Sizes>>[
                                  ButtonSegment<Sizes>(
                                      value: Sizes.small, label: Text('S')),
                                  ButtonSegment<Sizes>(
                                      value: Sizes.medium, label: Text('M')),
                                  ButtonSegment<Sizes>(
                                    value: Sizes.large,
                                    label: Text('L'),
                                  ),
                                  ButtonSegment<Sizes>(
                                      value: Sizes.extraLarge,
                                      label: Text('XL')),
                                ],
                                selected: <Sizes>{selection},
                                onSelectionChanged: (Set<Sizes> newSelection) {
                                  setState(() {
                                    selection = newSelection.first;
                                  });
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.straighten,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    'Show size chart',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                        fontSize: 18),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: filledButton(
                                    context: context,
                                    buttonName: 'ADD TO CART',
                                    buttonColour: Colors.black,
                                    buttonAction: () =>
                                        Navigator.pushNamed(context, '/home')),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ],
      ),
    ));
  }
}
