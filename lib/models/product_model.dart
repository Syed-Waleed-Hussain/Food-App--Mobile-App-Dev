/// Represents a food item in the application.
class Product {
  final String id;
  final String name;
  final String category;
  final double price;
  final double rating;
  final int reviewCount;
  final int calories;
  final String prepTime;
  final String imageUrl;
  final String description;
  final bool isHot;
  final bool isPopular;
  final List<String> ingredients;

  const Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.rating,
    this.reviewCount = 120,
    this.calories = 450,
    this.prepTime = "15-20 min",
    required this.imageUrl,
    required this.description,
    this.isHot = false,
    this.isPopular = false,
    this.ingredients = const ["Fresh Buns", "Crispy Patty", "Special Sauce", "Cheddar Cheese"],
  });

  Product copyWith({
    String? id,
    String? name,
    String? category,
    double? price,
    double? rating,
    int? reviewCount,
    int? calories,
    String? prepTime,
    String? imageUrl,
    String? description,
    bool? isHot,
    bool? isPopular,
    List<String>? ingredients,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      price: price ?? this.price,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      calories: calories ?? this.calories,
      prepTime: prepTime ?? this.prepTime,
      imageUrl: imageUrl ?? this.imageUrl,
      description: description ?? this.description,
      isHot: isHot ?? this.isHot,
      isPopular: isPopular ?? this.isPopular,
      ingredients: ingredients ?? this.ingredients,
    );
  }
}
