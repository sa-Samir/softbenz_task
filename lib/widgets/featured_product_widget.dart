import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class FeaturedProductWidget extends StatelessWidget {
  final String name;
  final String price;
  final int discountPercent;
  final String sellingPrice;
  final List image;
  final String seller;
  const FeaturedProductWidget({
    Key? key,
    required this.name,
    required this.price,
    required this.discountPercent,
    required this.sellingPrice,
    required this.image,
    required this.seller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade200,
      elevation: 0,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // * Product Image
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 105,
                  width: 200,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: image.isEmpty
                        ? const Center(
                            child: Text(
                              'No Image',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          )
                        : Image.network(
                            image[0],
                          ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    height: 1.1,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  seller,
                  style: const TextStyle(
                    fontSize: 10,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                discountPercent > 0
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
                        'Rs.$sellingPrice',
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ],
            ),
          ),

          // * Favourite Button
          Positioned(
            top: 15,
            right: 15,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade200,
              ),
              padding: const EdgeInsets.all(4),
              child: FavoriteButton(
                isFavorite: false,
                valueChanged: (value) {
                  debugPrint('Added to facourites');
                },
                iconSize: 28,
                iconColor: Constants.pColor,
                iconDisabledColor: Colors.black38,
              ),
            ),
          ),

          //  * Call Button
          Positioned(
            bottom: 65,
            right: 15,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade200,
              ),
              child: IconButton(
                tooltip: 'Call $seller',
                onPressed: () {},
                padding: const EdgeInsets.all(2),
                constraints: const BoxConstraints(),
                icon: const Icon(
                  CupertinoIcons.phone,
                  size: 18,
                ),
                color: Constants.pColor,
              ),
            ),
          ),

          // * Refresh/Sync Button
          Positioned(
            top: 15,
            left: 15,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade200,
              ),
              child: IconButton(
                tooltip: 'Refresh/Sync',
                onPressed: () {},
                padding: const EdgeInsets.all(2),
                constraints: const BoxConstraints(),
                icon: const Icon(
                  Icons.sync,
                  size: 18,
                ),
                color: Constants.pColor,
              ),
            ),
          ),

          // * Add to cart button
          Positioned(
            bottom: -2,
            right: -2,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Constants.pColor,
              ),
              child: IconButton(
                tooltip: 'Add to Cart',
                constraints: const BoxConstraints(),
                padding: const EdgeInsets.all(2),
                onPressed: () {},
                icon: const Icon(
                  Icons.add,
                  size: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
