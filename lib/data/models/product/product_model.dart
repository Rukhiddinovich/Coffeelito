class CoffeeModelFields {
  static const categoryId = "categoryId";
  static const coffeeName = "coffeeName";
  static const id = "id";
  static const coffeeImage = "coffeeImage";
  static const description = "description";
  static const coffeePrice = "coffeePrice";
  static const coffeeId = "coffeeId";
  static const count = "count";
  static const tableName = "products";
  static const favorites = "favorites";
}

class CoffeeModelSql {
  final int? id;
  final String coffeeId;
  final int count;
  final String coffeeName;
  final double coffeePrice;
  final String coffeeImage;
  final String categoryId;
  final String description;

  CoffeeModelSql(
      {this.id,
        required this.categoryId,
        required this.count,
        required this.coffeeImage,
        required this.description,
        required this.coffeeName,
        required this.coffeePrice,
        required this.coffeeId});

  factory CoffeeModelSql.fromJson(Map<String, dynamic> json) {
    return CoffeeModelSql(
      id: json[CoffeeModelFields.id] ?? 0,
      coffeeId: json[CoffeeModelFields.coffeeId] as String? ?? '',
      count: json[CoffeeModelFields.count] as int? ?? 0,
      coffeeName: json[CoffeeModelFields.coffeeName] as String? ?? "",
      coffeePrice: json[CoffeeModelFields.coffeePrice] as double? ?? 0,
      coffeeImage: json[CoffeeModelFields.coffeeImage] as String? ?? "",
      categoryId: json[CoffeeModelFields.categoryId] as String? ?? "",
      description: json[CoffeeModelFields.description] as String? ?? "",
    );
  }

  CoffeeModelSql copyWith({
    String? coffeeName,
    int? id,
    String? coffeeId,
    int? count,
    double? coffeePrice,
    String? coffeeImage,
    String? description,
    String? categoryId,
  }) {
    return CoffeeModelSql(
      coffeeName: coffeeName ?? this.coffeeName,
      coffeeId: coffeeId ?? this.coffeeId,
      count: count ?? this.count,
      coffeePrice: coffeePrice ?? this.coffeePrice,
      coffeeImage: coffeeImage ?? this.coffeeImage,
      id: id ?? this.id,
      categoryId:  categoryId ?? this.categoryId,
      description:  description ?? this.description,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      CoffeeModelFields.coffeeName: coffeeName,
      CoffeeModelFields.id: id,
      CoffeeModelFields.coffeePrice: coffeePrice,
      CoffeeModelFields.count: count,
      CoffeeModelFields.coffeeId: coffeeId,
      CoffeeModelFields.coffeeImage: coffeeImage,
      CoffeeModelFields.categoryId: categoryId,
      CoffeeModelFields.description: description,
    };
  }

  @override
  String toString() {
    return '''
      name: $coffeeName
      productId: $coffeeId
      price: $coffeePrice
      count: $count
      photoUrl: $coffeeImage
      id: $id, 
      categoryId: $categoryId
      description: $description, 
    ''';
  }
}



class CoffeeModel {
  final String coffeeName;
  final String coffeeImage;
  final String description;
  final String categoryId;
  final double coffeePrice;
  final String coffeeId;

  CoffeeModel({
    required this.coffeePrice,
    required this.coffeeName,
    required this.description,
    required this.categoryId,
    required this.coffeeImage,
    required this.coffeeId,
  });

  CoffeeModel copyWith({
    double? coffeePrice,
    String? coffeeImage,
    String? categoryId,
    String? coffeeId,
    String? coffeeName,
    int? count,
    String? description,
  }) {
    return CoffeeModel(
      coffeePrice: coffeePrice ?? this.coffeePrice,
      coffeeImage: coffeeImage ?? this.coffeeImage,
      categoryId: categoryId ?? this.categoryId,
      coffeeId: coffeeId ?? this.coffeeId,
      coffeeName: coffeeName ?? this.coffeeName,
      description: description ?? this.description,
    );
  }

  factory CoffeeModel.fromJson(Map<String, dynamic> jsonData) {
    return CoffeeModel(
      coffeePrice: jsonData['coffeePrice'] as double? ?? 0,
      coffeeImage: (jsonData['coffeeImage'] as String? ?? ""),
      categoryId: jsonData['categoryId'] as String? ?? '',
      coffeeId: jsonData['coffeeId'] as String? ?? '',
      coffeeName: jsonData['coffeeName'] as String? ?? '',
      description: jsonData['description'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'coffeePrice': coffeePrice,
      'coffeeImage': coffeeImage,
      'categoryId': categoryId,
      'coffeeId': coffeeId,
      'coffeeName': coffeeName,
      'description': description
    };
  }

  @override
  String toString() {
    return '''
      coffeePrice: $coffeePrice,
      coffeeImage: $coffeeImage,
      categoryId: $categoryId,
      coffeeId: $coffeeId,
      coffeeName: $coffeeName,
      description: $description,
      ''';
  }
}
