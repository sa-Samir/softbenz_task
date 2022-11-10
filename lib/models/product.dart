class ProductModel {
  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.discountPercent,
    required this.sellingPrice,
    required this.categoryId,
    this.description,
    required this.rating,
    required this.reviews,
    required this.image,
    required this.seller,
    this.specification,
    required this.stock,
    this.modifierType,
    this.modifiers,
    required this.isFeatured,
    required this.isBestSeller,
    required this.isNewArrival,
  });

  String id;
  String name;
  String price;
  int discountPercent;
  String sellingPrice;
  String categoryId;
  dynamic description;
  double rating;
  int reviews;
  List image;
  String seller;
  dynamic specification;
  int stock;
  dynamic modifierType;
  List<Modifiers>? modifiers;
  bool isFeatured;
  bool isBestSeller;
  bool isNewArrival;
}

class Modifiers {
  Modifiers({
    required this.id,
    required this.label,
  });
  String id;
  String label;
}
