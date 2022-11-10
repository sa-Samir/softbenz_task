import 'package:carousel_slider/carousel_slider.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softbenz_task/models/product.dart';
import 'package:softbenz_task/utils/constants.dart';

class ProductDescription extends StatelessWidget {
  final String id;
  final String name;
  final String price;
  final int discountPercent;
  final String sellingPrice;
  final String categoryId;
  final dynamic description;
  final double rating;
  final int reviews;
  final List images;
  final String seller;
  final dynamic specification;
  final int stock;
  final dynamic modifierType;
  final List<Modifiers>? modifiers;
  final bool isFeatured;
  final bool isBestSeller;
  final bool isNewArrival;
  const ProductDescription({
    Key? key,
    required this.id,
    required this.name,
    required this.price,
    required this.discountPercent,
    required this.sellingPrice,
    required this.categoryId,
    this.description,
    required this.rating,
    required this.reviews,
    required this.images,
    required this.seller,
    this.specification,
    required this.stock,
    this.modifierType,
    required this.modifiers,
    required this.isFeatured,
    required this.isBestSeller,
    required this.isNewArrival,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          padding: const EdgeInsets.all(0),
          constraints: const BoxConstraints(),
          icon: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(8),
            child: Icon(
              CupertinoIcons.xmark,
              color: Constants.pColor,
              size: 18,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 400,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Constants.gradientColor1,
                        Constants.gradientColor2,
                      ],
                    ),
                  ),
                  child: Container(
                    height: 250,
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Constants.pColor,
                      ),
                      color: Colors.white,
                    ),
                    child: images.isEmpty
                        ? const Center(
                            child: Text('No Image'),
                          )
                        : CarouselSlider(
                            items: images
                                .map((e) => Builder(
                                      builder: (BuildContext context) {
                                        return Stack(
                                          children: [
                                            Container(
                                              height: 250,
                                              width: 250,
                                              padding: const EdgeInsets.all(5),
                                              child: Image.network(
                                                e,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                            Positioned(
                                              top: 0,
                                              right: 15,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  color: Colors.grey.shade200,
                                                ),
                                                child: IconButton(
                                                  tooltip: 'Share image',
                                                  onPressed: () {},
                                                  padding:
                                                      const EdgeInsets.all(2),
                                                  constraints:
                                                      const BoxConstraints(),
                                                  icon: const Icon(
                                                    Icons.share,
                                                    size: 18,
                                                  ),
                                                  color: Constants.pColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ))
                                .toList(),
                            options: CarouselOptions(
                              viewportFraction: 1,
                              autoPlay: true,
                              enableInfiniteScroll: false,
                            ),
                          ),
                  ),
                ),
                Positioned(
                  bottom: 15,
                  right: 15,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.grey.shade200,
                    ),
                    padding: const EdgeInsets.all(8),
                    child: FavoriteButton(
                      isFavorite: false,
                      valueChanged: (value) {
                        debugPrint('Added to facourites');
                      },
                      iconSize: 32,
                      iconColor: Constants.pColor,
                      iconDisabledColor: Colors.black38,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
