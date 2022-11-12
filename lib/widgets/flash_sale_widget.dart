import 'package:flutter/material.dart';

class FlashSaleWidget extends StatelessWidget {
  final String name;
  final String price;
  final int discountPercent;
  final String sellingPrice;
  final List image;
  const FlashSaleWidget({
    Key? key,
    required this.name,
    required this.price,
    required this.discountPercent,
    required this.sellingPrice,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: .75,
      child: Column(
        children: [
          Container(),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    // * The red circle at the center
                    SizedBox(
                      height: 90,
                      child: Center(
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.red.shade300,
                        ),
                      ),
                    ),

                    // * Product Image
                    // ! Image backgrounds are not transparent
                    Positioned(
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: image.isEmpty
                            ? const Center(
                                child: Text(
                                  'No Image',
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              )
                            : Image.network(
                                image[0],
                                fit: BoxFit.contain,
                              ),
                      ),
                    ),

                    // * Discount Percentage Ribbon
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          color: Colors.red.shade900,
                          borderRadius: const BorderRadius.horizontal(
                            left: Radius.circular(4),
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(
                              '$discountPercent',
                              style: const TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              '% off',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 10,
                    height: 1.1,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Text(
                      'Rs.$price',
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: Colors.red,
                        decorationThickness: 2,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Rs.$sellingPrice',
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
