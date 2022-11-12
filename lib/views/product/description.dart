import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';
import 'package:softbenz_task/models/product.dart';
import 'package:softbenz_task/services/notification_service.dart';
import 'package:softbenz_task/utils/constants.dart';
import 'package:softbenz_task/views/product/image.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class ProductDescription extends StatefulWidget {
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
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  var imageIndex = 0.obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController message = TextEditingController();

  NotificationService notificationService = NotificationService();

  @override
  void initState() {
    super.initState();
    notificationService.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 250,
                          width: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Constants.pColor,
                            ),
                            color: Colors.white,
                          ),
                          child: widget.images.isEmpty
                              ? const Center(
                                  child: Text('No Image'),
                                )
                              : CarouselSlider(
                                  items: widget.images
                                      .map((e) => Builder(
                                            builder: (BuildContext context) {
                                              return Stack(
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      Get.to(() =>
                                                          ViewImageScreen(
                                                              imageTitle:
                                                                  widget.name,
                                                              imageURL: e));
                                                    },
                                                    child: Container(
                                                      height: 250,
                                                      width: 250,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5),
                                                      child: Image.network(
                                                        e,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    top: 0,
                                                    right: 15,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        color: Colors
                                                            .grey.shade200,
                                                      ),
                                                      child: IconButton(
                                                        tooltip: 'Share image',
                                                        onPressed: () {},
                                                        padding:
                                                            const EdgeInsets
                                                                .all(2),
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
                                      onPageChanged: (index, reason) {
                                        imageIndex.value = index;
                                      }),
                                ),
                        ),
                        widget.images.isEmpty
                            ? const SizedBox()
                            : Obx(
                                () => DotsIndicator(
                                  dotsCount: widget.images.length,
                                  position: imageIndex.value.toDouble(),
                                  decorator: DotsDecorator(
                                    size: const Size.square(9.0),
                                    activeSize: const Size(18.0, 9.0),
                                    activeShape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 15,
                    right: 15,
                    child: Row(
                      children: List.generate(
                        5,
                        (index) => Icon(
                          index < widget.rating
                              ? Icons.star
                              : Icons.star_border,
                          color: Constants.pColor,
                          size: 22,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: Constants.screenPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                'By : ${widget.seller}',
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.grey.shade300,
                                ),
                                child: IconButton(
                                  tooltip: 'Message ${widget.seller}',
                                  padding: const EdgeInsets.all(4),
                                  constraints: const BoxConstraints(),
                                  onPressed: () {
                                    // Message to seller pop up
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        title:
                                            Text('Message to ${widget.seller}'),
                                        titleTextStyle: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                        content: SizedBox(
                                          height: 220,
                                          width: 300,
                                          child: Form(
                                            key: formKey,
                                            child: Column(children: [
                                              TextFormField(
                                                controller: message,
                                                cursorColor: Constants.pColor,
                                                decoration:
                                                    const InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  focusedBorder:
                                                      OutlineInputBorder(),
                                                  contentPadding:
                                                      EdgeInsets.all(8),
                                                ),
                                                maxLength: 200,
                                                maxLines: 5,
                                                minLines: 5,
                                                validator: (value) =>
                                                    value!.isEmpty
                                                        ? '* Required'
                                                        : null,
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  // * Send Message
                                                  MaterialButton(
                                                    color: Constants.pColor,
                                                    onPressed: () {
                                                      if (formKey.currentState!
                                                          .validate()) {
                                                        // * Showing push notification
                                                        notificationService
                                                            .sendNotifications(
                                                                1,
                                                                'Thank You',
                                                                'Thank You for contacting us. We will get back to you soon.',
                                                                '');
                                                      }
                                                    },
                                                    child: const Text(
                                                      'Send',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ]),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.mail_outline,
                                    color: Constants.pColor,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.grey.shade300,
                                ),
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
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    // * Description, Specification and Reviews section
                    TabBar(
                      tabs: [
                        const Tab(
                          text: 'Description',
                        ),
                        const Tab(
                          text: 'Specification',
                        ),
                        Tab(
                          text: 'Reviews (${widget.reviews})',
                        ),
                      ],
                      labelStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                      indicatorWeight: .1,
                      padding: const EdgeInsets.all(0),
                      indicatorColor: Constants.pColor,
                      labelColor: Constants.pColor,
                      indicator: RectangularIndicator(
                        horizontalPadding: 8,
                        verticalPadding: 4,
                        color: Constants.pColor,
                        strokeWidth: 1,
                        topRightRadius: 24,
                        topLeftRadius: 24,
                        bottomLeftRadius: 24,
                        bottomRightRadius: 24,
                        paintingStyle: PaintingStyle.stroke,
                      ),
                      unselectedLabelColor: Colors.black,
                    ),

                    SizedBox(
                      height: 150,
                      child: TabBarView(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              widget.description ?? 'N/A',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              widget.specification ?? 'N/A',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: const Text(
                              'N/A',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    // * Configurable Products
                    widget.modifierType == null
                        ? const SizedBox()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Variations (${widget.modifierType})',
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              GroupButton(
                                isRadio: true,
                                buttons: widget.modifiers!
                                    .map((e) => e.label)
                                    .toList(),
                                options: GroupButtonOptions(
                                  selectedColor: Constants.pColor,
                                  borderRadius: BorderRadius.circular(8),
                                  unselectedBorderColor: Colors.black,
                                  selectedBorderColor: Constants.pColor,
                                ),
                              ),
                            ],
                          ),

                    const SizedBox(
                      height: 20,
                    ),

                    // * Add to Cart and Buy Now Buttons

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Constants.pColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.add_shopping_cart_outlined,
                                  color: Colors.white,
                                  size: 18,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'Add to Cart',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Constants.pColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.shopping_cart_checkout_outlined,
                                  color: Colors.white,
                                  size: 18,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'Buy Now',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
