import 'package:get/get.dart';
import 'package:softbenz_task/models/category.dart';

class CategoryController extends GetxController {
  var cateogries = [
    CategoryModel(id: '1', name: 'Electronics'),
    CategoryModel(id: '2', name: 'Home Appliance'),
    CategoryModel(id: '3', name: 'Health & Beauty'),
    CategoryModel(id: '4', name: 'Baby\'s Products'),
    CategoryModel(id: '5', name: 'Fashion'),
    CategoryModel(id: '6', name: 'Literature'),
  ].obs;
}
