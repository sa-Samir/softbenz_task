import 'package:flutter/material.dart';
import 'package:softbenz_task/utils/constants.dart';

class BestSellerWidget extends StatelessWidget {
  final String name;
  final String price;
  final int discountPercentage;
  final String sellingPrice;
  final List image;
  final int reviews;
  const BestSellerWidget({
    Key? key,
    required this.name,
    required this.price,
    required this.discountPercentage,
    required this.sellingPrice,
    required this.image,
    required this.reviews,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 20),
          alignment: Alignment.bottomLeft,
          height: double.infinity,
          width: 120,
          decoration: image.isEmpty
              ? const BoxDecoration()
              : BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(
                      image[0],
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            height: 35,
            color: Colors.white38,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                discountPercentage > 0
                    ? Row(
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
                      )
                    : Text(
                        'Rs.$price',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Constants.pColor,
                        ),
                      ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 5,
          right: 25,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Constants.pColor,
            ),
            child: Text(
              '$reviews sales',
              style: const TextStyle(
                fontSize: 10,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
