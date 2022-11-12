import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';
import 'package:softbenz_task/widgets/banner_widget.dart';
import 'package:softbenz_task/widgets/best_seller_widget.dart';
import 'package:softbenz_task/widgets/feature_widget.dart';
import 'package:softbenz_task/widgets/featured_product_widget.dart';
import 'package:softbenz_task/widgets/flash_sale_widget.dart';
import 'package:softbenz_task/widgets/new_arrival_widget.dart';
import 'package:softbenz_task/controllers/category.dart';
import 'package:softbenz_task/controllers/product.dart';
import 'package:softbenz_task/models/product.dart';
import 'package:softbenz_task/utils/constants.dart';
import 'package:softbenz_task/views/product/description.dart';
import 'package:softbenz_task/views/product/featured_products.dart';
import 'package:softbenz_task/views/product/new_arrival.dart';
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
      resizeToAvoidBottomInset: false,
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
                      icon: Badge(
                        badgeContent: const Text(
                          '8',
                          style: TextStyle(
                            fontSize: 8,
                            color: Colors.white,
                          ),
                        ),
                        badgeColor: Constants.pColor,
                        padding: const EdgeInsets.all(5),
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.favorite_outline,
                          size: 18,
                        ),
                      ),
                    ),
                    const Text(
                      'My Favourites',
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
                      icon: Badge(
                        badgeContent: const Text(
                          '3',
                          style: TextStyle(
                            fontSize: 8,
                            color: Colors.white,
                          ),
                        ),
                        badgeColor: Constants.pColor,
                        padding: const EdgeInsets.all(5),
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.shopping_bag_outlined,
                          size: 18,
                        ),
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
                        child: SearchField(
                          searchInputDecoration: InputDecoration(
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
                            suffixIcon: const Icon(
                              Icons.search_outlined,
                              size: 18,
                            ),
                          ),
                          maxSuggestionsInViewPort: 4,
                          itemHeight: 80,
                          onSuggestionTap:
                              (SearchFieldListItem<ProductModel> e) {
                            Get.to(() => ProductDescription(
                                  id: e.item!.id,
                                  categoryId: e.item!.categoryId,
                                  discountPercent: e.item!.discountPercent,
                                  images: e.item!.image,
                                  isBestSeller: e.item!.isBestSeller,
                                  isFeatured: e.item!.isFeatured,
                                  isNewArrival: e.item!.isNewArrival,
                                  modifiers: e.item!.modifiers,
                                  name: e.item!.name,
                                  price: e.item!.price,
                                  rating: e.item!.rating,
                                  reviews: e.item!.reviews,
                                  seller: e.item!.seller,
                                  sellingPrice: e.item!.sellingPrice,
                                  stock: e.item!.stock,
                                  description: e.item!.description,
                                  modifierType: e.item!.modifierType,
                                  specification: e.item!.specification,
                                ));
                          },
                          suggestions: productController.products.map((e) {
                            return SearchFieldListItem(
                              e.name,
                              item: e,
                              child: ListTile(
                                contentPadding: const EdgeInsets.all(8),
                                leading: e.image.isEmpty
                                    ? CircleAvatar(
                                        backgroundColor: Constants.pColor,
                                      )
                                    : CircleAvatar(
                                        backgroundColor: Constants.pColor,
                                        backgroundImage: NetworkImage(
                                          e.image[0],
                                        ),
                                      ),
                                title: Text(
                                  e.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                subtitle: Text(e.seller),
                              ),
                            );
                          }).toList(),
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
                    const CustomBanner(imageName: 'banner.png'),

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
                              child: FlashSaleWidget(
                                name: mydata.name,
                                price: mydata.price,
                                discountPercent: mydata.discountPercent,
                                sellingPrice: mydata.sellingPrice,
                                image: mydata.image,
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
                          child: FeaturedProductWidget(
                            name: mydata.name,
                            price: mydata.price,
                            discountPercent: mydata.discountPercent,
                            sellingPrice: mydata.sellingPrice,
                            image: mydata.image,
                            seller: mydata.seller,
                          ),
                        );
                      },
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    // * Second Banner
                    const CustomBanner(imageName: 'banner_2.png'),

                    const SizedBox(
                      height: 30,
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
                      height: 30,
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
                    const CustomBanner(imageName: 'banner_3.png'),

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
                            Get.to(() => const NewArrivalScreen());
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
