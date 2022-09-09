class Product {
  late final String? productId;
  late final String? name;
  late final double? price;
  late final dynamic? createdOn;
  Product({
    this.productId,
    this.name,
    this.price,
    this.createdOn,
  });

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'name': name,
      'price': price,
      'createdOn': createdOn,
    };
  }

  // Product.fromFirestore(Map<String, dynamic> firestore)
  // : productId = firestore['productId'], name = firestore['name'],  price = firestore['price'],createdOn= firestore['createdOn'];
  //อ่านค่าจาก Firestore มาในโปรเจ็กต์
  Product.fromFirestore(Map<String, dynamic> firestore)
      : productId = firestore['productId'],
        name = firestore['name'],
        price = firestore['price'],
        createdOn = firestore['createdOn'];
}
