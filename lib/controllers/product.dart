import 'package:get/get.dart';
import 'package:softbenz_task/models/product.dart';

class ProductController extends GetxController {
  var products = <ProductModel>[
    ProductModel(
      id: '1',
      name: 'Samsung F22',
      price: '24,499',
      discountPercent: 0,
      sellingPrice: '24,499',
      categoryId: '1',
      rating: 0,
      reviews: 0,
      seller: 'Samsung Electronics',
      stock: 25,
      description:
          'Bid goodbye to screen stuttering, poor display quality, and low-resolution photos by getting your hands on the Samsung Galaxy F22 smartphone. Featuring a 90 Hz refresh rate, HD+ sAMOLED display, and True 48 MP quad-rear camera, this smartphone is sure to be your ideal companion for entertainment, gaming, and communication. What\'s more, its 6000 mAh battery ensures that a full charge can last for an entire day.',
      modifiers: [
        Modifiers(id: '1', label: '(6/128)'),
        Modifiers(id: '2', label: '(8/128)'),
      ],
      modifierType: 'RAM/ROM',
      image: [
        'https://rukminim1.flixcart.com/image/416/416/kqqykcw0/mobile/j/5/7/galaxy-f22-sm-e225flbdins-samsung-original-imag4z99fp4qdfby.jpeg?q=70',
      ],
      isFeatured: true,
      isBestSeller: false,
      isNewArrival: false,
    ),
    ProductModel(
      id: '2',
      name: 'Philips Induction Cooktop (Black, Touch Panel) - Hd4911/00',
      price: '14,700',
      discountPercent: 10,
      sellingPrice: '13,230',
      categoryId: '2',
      rating: 4,
      reviews: 76,
      seller: 'Philips Electronics',
      stock: 4,
      description:
          'Philips induction cooktop is a stylish and efficient stove that runs on electricity and is faster than a gas stove. The best part about using a cooktop is that it retains the nutrition in the cooked food, while preventing vitamin loss.',
      image: [
        'https://rukminim1.flixcart.com/image/416/416/k5zn9u80/induction-cook-top/r/q/z/philips-phlps-2100-watt-induction-cooktop-black-original-imaf95d6gupffzr9.jpeg?q=70',
        'https://rukminim1.flixcart.com/image/416/416/k0lbdzk0pkrrdj/induction-cook-top-refurbished/a/3/r/na-u-hd4928-01-philips-original-imaf95d69puzxq3j.jpeg?q=70',
      ],
      isFeatured: true,
      isBestSeller: false,
      isNewArrival: false,
    ),
    ProductModel(
      id: '3',
      name: 'Digital Thermometer with automatic alarm',
      price: '145',
      discountPercent: 0,
      sellingPrice: '145',
      categoryId: '3',
      rating: 5,
      reviews: 49,
      seller: 'No Brand',
      stock: 79,
      description:
          'A thermometer is an instrument that measures temperature. It can measure the temperature of a solid such as food, a liquid such as water, or a gas such as air. The three most common units of measurement for temperature are Celsius, Fahrenheit, and kelvin. The Celsius scale is part of the metric system',
      image: [
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQy_XdUrWnIUFDUIGRz9JlK1Dh8uqybRllXmw&usqp=CAU',
      ],
      isFeatured: true,
      isBestSeller: false,
      isNewArrival: false,
    ),
    ProductModel(
      id: '4',
      name: 'UV Doux SPF 50 Sunscreen PA+++ (50 gm)',
      price: '1,118',
      discountPercent: 10,
      sellingPrice: '1,006',
      categoryId: '3',
      rating: 5,
      reviews: 72,
      seller: 'Brinton',
      stock: 25,
      description:
          ' If you’re worried about going out in the hot sun and getting a tan, you needn’t anymore. This Lakme Sun Expert Fairness UV Sunscreen Lotion that comes with SPF 50 PA+++ protects your skin from sunburn, tan lines and dark spots. This dermatologically tested lotion',
      image: [
        'https://rukminim1.flixcart.com/image/416/416/l3t2fm80/sunscreen/o/a/x/-original-imageuhw5cyq69fj.jpeg?q=70',
        'https://rukminim1.flixcart.com/image/416/416/l3t2fm80/sunscreen/t/c/b/-original-imageuhwmwyrznz4.jpeg?q=70',
      ],
      isFeatured: true,
      isBestSeller: false,
      isNewArrival: false,
    ),
    ProductModel(
      id: '5',
      name: 'Footy Fun KS-101 Blue/Black Shoes For Kids',
      price: '519',
      discountPercent: 0,
      sellingPrice: '519',
      categoryId: '4',
      rating: 5,
      reviews: 1,
      seller: 'Sampang Clothing',
      stock: 11,
      image: [
        'https://rukminim1.flixcart.com/image/832/832/l071d3k0/shopsy-shoe/d/f/g/8-ori-mm-1721-zenwear-navy-original-imagcfbhuhgjangf.jpeg?q=70',
        'https://rukminim1.flixcart.com/image/832/832/l071d3k0/shopsy-shoe/0/z/d/8-ori-mm-1721-zenwear-navy-original-imagcfbhy4uvypcn.jpeg?q=70',
      ],
      modifierType: 'Size',
      modifiers: [
        Modifiers(id: '1', label: '2'),
        Modifiers(id: '2', label: '3'),
        Modifiers(id: '3', label: '4'),
        Modifiers(id: '4', label: '5'),
        Modifiers(id: '5', label: '6'),
      ],
      isFeatured: true,
      isBestSeller: false,
      isNewArrival: true,
    ),
    ProductModel(
      id: '6',
      name: 'Round Golden Metal Frame Sunglasses For Men & Women',
      price: '1250',
      discountPercent: 15,
      sellingPrice: '1062',
      categoryId: '5',
      rating: 0,
      reviews: 0,
      seller: 'Mewmew',
      stock: 25,
      description:
          'Sunglasses or sun glasses are a form of protective eyewear designed primarily to prevent bright sunlight and high-energy visible light from damaging',
      image: [],
      isFeatured: false,
      isBestSeller: false,
      isNewArrival: true,
    ),
    ProductModel(
      id: '7',
      name: 'Ijoriya By Subin Bhattarai',
      price: '545',
      discountPercent: 0,
      sellingPrice: '545',
      categoryId: '6',
      rating: 5,
      reviews: 50,
      seller: 'Subin Bhattarai',
      stock: 200,
      description:
          'There is a multifaceted story in the novel \'Ijoriya\'. Writer Bhattarai has brought out the love, hate, and conflict between the family members in the story. Bhattarai, who has written stories focusing on Kathmandu in all his previous books, this time he has reached Madhes to capture the story.\'Ijoriya\' is a Maithili word. It means Juneli.',
      image: [
        'https://media.thuprai.com/__sized__/front_covers/Ijoriya_by_subin_bhattarai_-f-thumbnail-280x405-70.jpg',
      ],
      isFeatured: false,
      isBestSeller: true,
      isNewArrival: false,
    ),
    ProductModel(
      id: '8',
      name:
          'Lenovo Legion 5 Ryzen 5 4600h Gtx 1650ti 8gb Ram 256gb Ssd 1tb Hdd 120Hz',
      price: '119,999',
      discountPercent: 5,
      sellingPrice: '113,999',
      categoryId: '1',
      rating: 5,
      reviews: 2,
      seller: 'Lenovo Inc.',
      stock: 13,
      description:
          'With a design that is set to fire from all the canons, this gaming laptop enables you to stay on top of your game. Powered by an AMD Ryzen processor and 8 GB of DDR4 RAM clocked at 3200 Mhz, all your multitasking and graphics-rich gaming seem like a cakewalk. Loaded with the Nvidia GeForce GTX 1650 4 GB of GDDR6 graphics and 120 Hz of fast refresh rate, delivers a smooth flawless user experience.',
      image: [
        'https://rukminim1.flixcart.com/image/416/416/kk76wsw0/computer/j/6/i/lenovo-original-imafzhsyhmbgfbzy.jpeg?q=70',
        'https://rukminim1.flixcart.com/image/416/416/kk76wsw0/computer/q/e/t/lenovo-original-imafzhsyrgfvamgy.jpeg?q=70',
      ],
      isFeatured: false,
      isBestSeller: false,
      isNewArrival: false,
    ),
    ProductModel(
      id: '9',
      name: 'The Power Of Your Subconscious Mind By Joseph Murphy',
      price: '24,499',
      discountPercent: 0,
      sellingPrice: '24,499',
      categoryId: '6',
      rating: 3,
      reviews: 11,
      seller: 'Joseph Murphy',
      stock: 125,
      image: [
        'https://rukminim1.flixcart.com/image/416/416/klo27bk0/regionalbooks/l/x/e/the-power-of-your-subconscious-mind-original-imagyqtgj2yrk2wm.jpeg?q=70',
      ],
      isFeatured: false,
      isBestSeller: false,
      isNewArrival: true,
    ),
    ProductModel(
      id: '10',
      name: 'Konka Dry Vacuum Cleaner 2200W (DRUM KL 16-20T)',
      price: '11,499',
      discountPercent: 0,
      sellingPrice: '11,499',
      categoryId: '2',
      rating: 4,
      reviews: 6,
      seller: 'Konka Electronics',
      stock: 25,
      image: [
        'https://rukminim1.flixcart.com/image/416/416/k0vbgy80/vacuum-cleaner/h/e/6/eureka-forbes-trendy-zip-original-imafkka7zzg8qr6w.jpeg?q=70',
        'https://rukminim1.flixcart.com/image/416/416/j4pwsy80-1/vacuum-cleaner/h/e/6/eureka-forbes-trendy-zip-original-imaevkhw3sng5shn.jpeg?q=70',
      ],
      isFeatured: false,
      isBestSeller: false,
      isNewArrival: false,
    ),
    ProductModel(
      id: '11',
      name: 'Unisex Denim Jackets',
      price: '1,499',
      discountPercent: 0,
      sellingPrice: '1,499',
      categoryId: '5',
      rating: 0,
      reviews: 0,
      seller: 'Levi Jeans',
      stock: 5,
      image: [
        'https://rukminim1.flixcart.com/image/832/832/xif0q/jacket/r/l/j/m-1-no-dtaw21jk032c-ducati-original-imagjyfwfjknvvfd.jpeg?q=70',
        'https://rukminim1.flixcart.com/image/832/832/xif0q/jacket/z/h/a/s-ttjk000739-tokyo-talkies-original-imafyghajaenktnb-bb.jpeg?q=70',
      ],
      isFeatured: false,
      isBestSeller: true,
      isNewArrival: true,
    ),
    ProductModel(
      id: '12',
      name: 'Antil\'s Baby Carrier Bag',
      price: '1,299',
      discountPercent: 0,
      sellingPrice: '1,299',
      categoryId: '5',
      rating: 5,
      reviews: 27,
      seller: 'Levi Jeans',
      stock: 12,
      image: [
        'https://rukminim1.flixcart.com/image/416/416/k3xcdjk0/baby-carrier-cuddler/t/m/e/high-quality-baby-carrier-4-in-1-carry-bag-cuddler-kids-facing-original-imaf3vvphgzxhzsy.jpeg?q=70',
      ],
      isFeatured: false,
      isBestSeller: true,
      isNewArrival: false,
    ),
  ].obs;

  var flashSaleProducts = <ProductModel>[].obs;
  var featuredProducts = <ProductModel>[].obs;
  var bestSellingProducts = <ProductModel>[].obs;
  var newArrivalProducts = <ProductModel>[].obs;

  void filterFlashSaleProducts() {
    flashSaleProducts.value =
        products.where((e) => e.discountPercent > 0).toList();
  }

  void filterFeaturedProducts() {
    featuredProducts.value =
        products.where((e) => e.isFeatured == true).toList();
  }

  void filterBestSellingProducts() {
    bestSellingProducts.value =
        products.where((e) => e.isBestSeller == true).toList();
  }

  void filterNewArrivalProducts() {
    newArrivalProducts.value =
        products.where((e) => e.isNewArrival == true).toList();
  }

  @override
  void onInit() {
    super.onInit();
    filterFlashSaleProducts();
    filterFeaturedProducts();
    filterBestSellingProducts();
    filterNewArrivalProducts();
  }
}
