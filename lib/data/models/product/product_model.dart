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
