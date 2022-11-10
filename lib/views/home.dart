import 'package:badges/badges.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:get/get.dart';
import 'package:softbenz_task/components/best_seller_widget.dart';
import 'package:softbenz_task/components/feature_widget.dart';
import 'package:softbenz_task/components/new_arrival_widget.dart';
import 'package:softbenz_task/controllers/category.dart';
import 'package:softbenz_task/controllers/product.dart';
import 'package:softbenz_task/utils/constants.dart';
import 'package:softbenz_task/views/product/description.dart';
import 'package:softbenz_task/views/product/featured_products.dart';
import 'package:softbenz_task/views/product/products_by_category.dart';
import 'package:softbenz_task/views/user/account.dart';
import 'package:softbenz_task/views/user/cart.dart';
import 'package:softbenz_task/views/user/favourites.dart';
import 'package:softbenz_task/views/user/orders.dart';

class AppBase extends StatelessWidget {
  const AppBase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var selectedScreen = 2.obs;
    final screens = [
      const MyOrdersScreen(),
      const FavouritesScreen(),
      const HomeView(),
      const MyCartScreen(),
      const MyAccountScreen(),
    ];
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          selectedScreen.value = 2;
        },
        backgroundColor: Constants.pColor,
        shape: const CircleBorder(),
        child: const Icon(Icons.home_outlined),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  children: [
                    IconButton(
                      constraints: const BoxConstraints(),
                      onPressed: () {
                        selectedScreen.value = 0;
                      },
                      icon: const Icon(
                        Icons.menu,
                        size: 18,
                      ),
                    ),
                    const Text(
                      'My Orders',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    IconButton(
                      constraints: const BoxConstraints(),
                      onPressed: () {
                        selectedScreen.value = 1;
                      },
                      icon: const Icon(
                        Icons.favorite_outline,
                        size: 18,
                      ),
                    ),
                    const Text(
                      'Favourites',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),

              Expanded(
                child: Column(
                  children: [
                    IconButton(
                      constraints: const BoxConstraints(),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                    const Text(
                      'Home',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ), // this will handle the fab spacing
              Expanded(
                child: Column(
                  children: [
                    IconButton(
                      constraints: const BoxConstraints(),
                      onPressed: () {
                        selectedScreen.value = 3;
                      },
                      icon: const Icon(
                        Icons.shopping_bag_outlined,
                        size: 18,
                      ),
                    ),
                    const Text(
                      'My Cart',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),

              Expanded(
                child: Column(
                  children: [
                    IconButton(
                      constraints: const BoxConstraints(),
                      onPressed: () {
                        selectedScreen.value = 4;
                      },
                      icon: const Icon(
                        Icons.person_outline,
                        size: 18,
                      ),
                    ),
                    const Text(
                      'My Account',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text('MAAHURI'),
        titleTextStyle: const TextStyle(fontSize: 18),
        centerTitle: true,
        backgroundColor: Constants.pColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Badge(
            badgeContent: const Text(
              '2',
              style: TextStyle(
                fontSize: 8,
              ),
            ),
            badgeColor: Colors.white,
            padding: const EdgeInsets.all(3),
            alignment: Alignment.center,
            child: const Icon(Icons.notifications_outlined),
          ),
          color: Colors.white,
          iconSize: 22,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/images/apps_icon.png',
              height: 22,
              width: 22,
            ),
          ),
        ],
      ),
      body: Obx(
        () => IndexedStack(
          index: selectedScreen.value,
          children: screens,
        ),
      ),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var categoryController = Get.find<CategoryController>();
    var productController = Get.find<ProductController>();
    int countdownEndTime = DateTime.now().millisecondsSinceEpoch + 1000000 * 30;
    return Obx(
      () => SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // * SearchBar
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Constants.pColor,
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.elliptical(45, 45),
                      ),
                    ),
                    height: 50,
                    width: MediaQuery.of(context).size.height,
                  ),
                  Positioned(
                    bottom: -20,
                    child: SizedBox(
                      width: 300,
                      child: Card(
                        elevation: 1.5,
                        child: TextFormField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                width: 0,
                                color: Colors.grey.shade100,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  width: 0,
                                  color: Constants.pColor,
                                )),
                            contentPadding: const EdgeInsets.all(8),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Search Products',
                            hintStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                debugPrint('Search');
                              },
                              icon: const Icon(
                                Icons.search,
                                size: 22,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 40,
              ),

              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: Constants.screenPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // * Banner
                    ClipRRect(
                      clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.circular(12),
                      child: SizedBox(
                        height: 200,
                        child: Image.asset(
                          'assets/images/banner.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    // * Product Categories
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: categoryController.cateogries.length,
                        itemBuilder: (BuildContext context, int index) {
                          var mydata = categoryController.cateogries[index];
                          return Container(
                            margin: const EdgeInsets.only(right: 8),
                            child: InkWell(
                              onTap: () {
                                Get.to(() => const ProductsByCategoryScreen());
                              },
                              child: Chip(
                                side: BorderSide(
                                  width: 1,
                                  color: Constants.pColor,
                                ),
                                backgroundColor: Colors.grey.shade50,
                                label: Text(mydata.name),
                                labelStyle: TextStyle(
                                  fontSize: 12,
                                  color: Constants.pColor,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    // * Flash Sale Title
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Flash Sale',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Row(
                          children: [
                            const Text('Closing In: '),
                            CountdownTimer(
                              widgetBuilder: (BuildContext context,
                                  CurrentRemainingTime? remainingTime) {
                                return Row(
                                  children: [
                                    Container(
                                      width: 25,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Constants.pColor,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Text(
                                        remainingTime!.hours.toString(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      width: 25,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Constants.pColor,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Text(
                                        remainingTime.min.toString(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      width: 25,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Constants.pColor,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Text(
                                        remainingTime.sec.toString(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                              endTime: countdownEndTime,
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    // * Flash Sale Products
                    SizedBox(
                      height: 150,
                      child: ListView.builder(
                        shrinkWrap: false,
                        scrollDirection: Axis.horizontal,
                        itemCount: productController.flashSaleProducts.length,
                        itemBuilder: (BuildContext context, int index) {
                          var mydata =
                              productController.flashSaleProducts[index];
                          return SizedBox(
                            width: 150,
                            child: InkWell(
                              onTap: () {
                                Get.to(() => ProductDescription(
                                      id: mydata.id,
                                      categoryId: mydata.categoryId,
                                      discountPercent: mydata.discountPercent,
                                      images: mydata.image,
                                      isBestSeller: mydata.isBestSeller,
                                      isFeatured: mydata.isFeatured,
                                      isNewArrival: mydata.isNewArrival,
                                      modifiers: mydata.modifiers,
                                      name: mydata.name,
                                      price: mydata.price,
                                      rating: mydata.rating,
                                      reviews: mydata.reviews,
                                      seller: mydata.seller,
                                      sellingPrice: mydata.sellingPrice,
                                      stock: mydata.stock,
                                      description: mydata.description,
                                      modifierType: mydata.modifierType,
                                      specification: mydata.specification,
                                    ));
                              },
                              child: Card(
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
                                                    backgroundColor:
                                                        Colors.red.shade300,
                                                  ),
                                                ),
                                              ),

                                              // * Product Image
                                              // ! Image backgrounds are not transparent
                                              Positioned(
                                                child: SizedBox(
                                                  height: 50,
                                                  width: 50,
                                                  child: mydata.image.isEmpty
                                                      ? const Center(
                                                          child: Text(
                                                            'No Image',
                                                            style: TextStyle(
                                                              fontSize: 10,
                                                            ),
                                                          ),
                                                        )
                                                      : Image.network(
                                                          mydata.image[0],
                                                          fit: BoxFit.contain,
                                                        ),
                                                ),
                                              ),

                                              // * Discount Percentage Ribbon
                                              Positioned(
                                                top: 0,
                                                right: 0,
                                                child: Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 5),
                                                  decoration: BoxDecoration(
                                                    color: Colors.red.shade900,
                                                    borderRadius:
                                                        const BorderRadius
                                                            .horizontal(
                                                      left: Radius.circular(4),
                                                    ),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        '${mydata.discountPercent}',
                                                        style: const TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
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
                                            mydata.name,
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
                                                'Rs.${mydata.price}',
                                                style: const TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  decorationColor: Colors.red,
                                                  decorationThickness: 2,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                'Rs.${mydata.sellingPrice}',
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
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    // * Featured Products Title
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Featured Products',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        MaterialButton(
                          color: Constants.pColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          height: 30,
                          onPressed: () {
                            Get.to(() => const FeaturedProductScreen());
                          },
                          child: const Text(
                            'See All',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    // * Featured Products
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: productController.featuredProducts.length > 4
                          ? 4
                          : productController.featuredProducts.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        var mydata = productController.featuredProducts[index];
                        return InkWell(
                          onTap: () {
                            Get.to(() => ProductDescription(
                                  id: mydata.id,
                                  categoryId: mydata.categoryId,
                                  discountPercent: mydata.discountPercent,
                                  images: mydata.image,
                                  isBestSeller: mydata.isBestSeller,
                                  isFeatured: mydata.isFeatured,
                                  isNewArrival: mydata.isNewArrival,
                                  modifiers: mydata.modifiers,
                                  name: mydata.name,
                                  price: mydata.price,
                                  rating: mydata.rating,
                                  reviews: mydata.reviews,
                                  seller: mydata.seller,
                                  sellingPrice: mydata.sellingPrice,
                                  stock: mydata.stock,
                                  description: mydata.description,
                                  modifierType: mydata.modifierType,
                                  specification: mydata.specification,
                                ));
                          },
                          child: Card(
                            color: Colors.grey.shade200,
                            elevation: 0,
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                // * Product Image
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 105,
                                        width: 200,
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: Colors.white,
                                        ),
                                        child: Center(
                                          child: mydata.image.isEmpty
                                              ? const Center(
                                                  child: Text(
                                                    'No Image',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                )
                                              : Image.network(
                                                  mydata.image[0],
                                                ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        mydata.name,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          height: 1.1,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        mydata.seller,
                                        style: const TextStyle(
                                          fontSize: 10,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      mydata.discountPercent > 0
                                          ? Row(
                                              children: [
                                                Text(
                                                  'Rs.${mydata.price}',
                                                  style: const TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    decorationColor: Colors.red,
                                                    decorationThickness: 2,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  'Rs.${mydata.sellingPrice}',
                                                  style: const TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            )
                                          : Text(
                                              'Rs.${mydata.sellingPrice}',
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
                                      tooltip: 'Call ${mydata.seller}',
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
                          ),
                        );
                      },
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    // * Second Banner
                    ClipRRect(
                      clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.circular(12),
                      child: SizedBox(
                        height: 200,
                        child: Image.asset(
                          'assets/images/banner_2.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    // * Features
                    Row(
                      children: const [
                        Flexible(
                          flex: 1,
                          child: FeatureWidget(
                            icon: Icons.fire_truck_outlined,
                            title: 'Free Shipping',
                            subtitle: 'Free shipping on all orders',
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Flexible(
                          flex: 2,
                          child: FeatureWidget(
                            icon: Icons.currency_exchange_outlined,
                            title: 'Money Return Policy',
                            subtitle:
                                '100% money back guarantee in default case',
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Flexible(
                          flex: 1,
                          child: FeatureWidget(
                            icon: Icons.support_agent,
                            title: 'Support 24/7',
                            subtitle: 'Awesome support all the time',
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    // * Featured Products Title
                    const Text(
                      'Best Seller',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    // * Best Selling Products
                    SizedBox(
                      height: 150,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: productController.bestSellingProducts.length,
                        itemBuilder: (BuildContext context, int index) {
                          var mydata =
                              productController.bestSellingProducts[index];
                          return InkWell(
                            onTap: () {
                              Get.to(() => ProductDescription(
                                    id: mydata.id,
                                    categoryId: mydata.categoryId,
                                    discountPercent: mydata.discountPercent,
                                    images: mydata.image,
                                    isBestSeller: mydata.isBestSeller,
                                    isFeatured: mydata.isFeatured,
                                    isNewArrival: mydata.isNewArrival,
                                    modifiers: mydata.modifiers,
                                    name: mydata.name,
                                    price: mydata.price,
                                    rating: mydata.rating,
                                    reviews: mydata.reviews,
                                    seller: mydata.seller,
                                    sellingPrice: mydata.sellingPrice,
                                    stock: mydata.stock,
                                    description: mydata.description,
                                    modifierType: mydata.modifierType,
                                    specification: mydata.specification,
                                  ));
                            },
                            child: BestSellerWidget(
                              name: mydata.name,
                              price: mydata.price,
                              discountPercentage: mydata.discountPercent,
                              sellingPrice: mydata.sellingPrice,
                              image: mydata.image,
                              reviews: mydata.reviews,
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    // * Third Banner
                    ClipRRect(
                      clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.circular(12),
                      child: SizedBox(
                        height: 200,
                        child: Image.asset(
                          'assets/images/banner_3.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    // * New Arrival Title
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'New Arrival',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        MaterialButton(
                          color: Constants.pColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          height: 30,
                          onPressed: () {
                            Get.to(() => const FeaturedProductScreen());
                          },
                          child: const Text(
                            'See All',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: productController.newArrivalProducts.length,
                      itemBuilder: (BuildContext context, int index) {
                        var mydata =
                            productController.newArrivalProducts[index];
                        return InkWell(
                          onTap: () {
                            Get.to(
                              () => ProductDescription(
                                id: mydata.id,
                                categoryId: mydata.categoryId,
                                discountPercent: mydata.discountPercent,
                                images: mydata.image,
                                isBestSeller: mydata.isBestSeller,
                                isFeatured: mydata.isFeatured,
                                isNewArrival: mydata.isNewArrival,
                                modifiers: mydata.modifiers,
                                name: mydata.name,
                                price: mydata.price,
                                rating: mydata.rating,
                                reviews: mydata.reviews,
                                seller: mydata.seller,
                                sellingPrice: mydata.sellingPrice,
                                stock: mydata.stock,
                                description: mydata.description,
                                modifierType: mydata.modifierType,
                                specification: mydata.specification,
                              ),
                            );
                          },
                          child: NewArrivalProductWidget(
                            image: mydata.image,
                            name: mydata.name,
                            description: mydata.description,
                            rating: mydata.rating,
                            reviews: mydata.reviews,
                            price: mydata.price,
                            discountPercentage: mydata.discountPercent,
                            sellingPrice: mydata.sellingPrice,
                          ),
                        );
                      },
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
