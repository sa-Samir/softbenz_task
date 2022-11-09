import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:get/get.dart';
import 'package:softbenz_task/controllers/category.dart';
import 'package:softbenz_task/controllers/product.dart';
import 'package:softbenz_task/utils/constants.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var categoryController = Get.find<CategoryController>();
    var productController = Get.find<ProductController>();
    int countdownEndTime = DateTime.now().millisecondsSinceEpoch + 1000000 * 30;
    return Scaffold(
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
                                onTap: () {},
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
                                          borderRadius:
                                              BorderRadius.circular(4),
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
                                          borderRadius:
                                              BorderRadius.circular(4),
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
                                          borderRadius:
                                              BorderRadius.circular(4),
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
                                onTap: () {},
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
                                                            .symmetric(
                                                        horizontal: 5),
                                                    decoration: BoxDecoration(
                                                      color:
                                                          Colors.red.shade900,
                                                      borderRadius:
                                                          const BorderRadius
                                                              .horizontal(
                                                        left:
                                                            Radius.circular(4),
                                                      ),
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          '${mydata.discountPercent}',
                                                          style:
                                                              const TextStyle(
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
