import 'package:flutter/material.dart';
import '../models/category_model.dart';
import '../models/product_model.dart';

/// Centralized repository of mock culinary products and category taxonomies.
class DummyData {
  DummyData._();

  static const List<CategoryModel> categories = [
    CategoryModel(
      id: 'all',
      name: 'All Items',
      icon: Icons.restaurant_menu,
      assetImage: 'assets/images/food-removebg-preview.png',
      itemCount: 8,
    ),
    CategoryModel(
      id: 'burgers',
      name: 'Burgers',
      icon: Icons.lunch_dining,
      assetImage: 'assets/images/zinger-removebg-preview.png',
      itemCount: 3,
    ),
    CategoryModel(
      id: 'pizzas',
      name: 'Pizzas',
      icon: Icons.local_pizza,
      assetImage: 'assets/images/pizza2-removebg-preview.png',
      itemCount: 2,
    ),
    CategoryModel(
      id: 'bbq',
      name: 'Grill & BBQ',
      icon: Icons.kebab_dining,
      assetImage: 'assets/images/tikka-removebg-preview.png',
      itemCount: 2,
    ),
    CategoryModel(
      id: 'fries',
      name: 'Sides & Fries',
      icon: Icons.fastfood,
      assetImage: 'assets/images/fries-removebg-preview.png',
      itemCount: 1,
    ),
  ];

  static const List<Product> products = [
    Product(
      id: 'p1',
      name: 'Signature Zinger Burger',
      category: 'Burgers',
      price: 8.99,
      rating: 4.8,
      reviewCount: 342,
      calories: 560,
      prepTime: '15-20 min',
      imageUrl: 'assets/images/zinger-removebg-preview.png',
      description:
          'Crispy hand-breaded chicken breast fillet topped with fresh crunchy iceberg lettuce, melted aged cheddar, and house-made signature spicy garlic mayo on a toasted sesame brioche bun.',
      isHot: true,
      isPopular: true,
      ingredients: ['Brioche Bun', 'Crispy Chicken Fillet', 'Aged Cheddar', 'Spicy Garlic Mayo', 'Iceberg Lettuce'],
    ),
    Product(
      id: 'p2',
      name: 'Artisan Pizza Margherita',
      category: 'Pizzas',
      price: 14.99,
      rating: 4.7,
      reviewCount: 215,
      calories: 780,
      prepTime: '20-25 min',
      imageUrl: 'assets/images/pizza2-removebg-preview.png',
      description:
          'Stone-baked sourdough crust topped with authentic San Marzano tomato sauce, fresh buffalo mozzarella pearls, fragrant sweet basil leaves, and a delicate drizzle of extra-virgin olive oil.',
      isHot: false,
      isPopular: true,
      ingredients: ['Sourdough Crust', 'San Marzano Sauce', 'Buffalo Mozzarella', 'Fresh Basil', 'Extra Virgin Olive Oil'],
    ),
    Product(
      id: 'p3',
      name: 'Smokey Chicken Tikka',
      category: 'Grill & BBQ',
      price: 12.50,
      rating: 4.9,
      reviewCount: 489,
      calories: 420,
      prepTime: '18-22 min',
      imageUrl: 'assets/images/tikka-removebg-preview.png',
      description:
          'Succulent boneless chicken chunks marinated in Greek yogurt and freshly ground aromatic spices, char-grilled over natural charcoal for an irresistible smoky aroma and tender texture.',
      isHot: true,
      isPopular: true,
      ingredients: ['Boneless Chicken', 'Spiced Yogurt Marinade', 'Mint Chutney', 'Charred Onions', 'Fresh Lemon'],
    ),
    Product(
      id: 'p4',
      name: 'Royal Prime Beef Burger',
      category: 'Burgers',
      price: 10.99,
      rating: 4.6,
      reviewCount: 198,
      calories: 680,
      prepTime: '15-18 min',
      imageUrl: 'assets/images/burger-removebg-preview.png',
      description:
          'Flame-grilled 100% Angus beef patty stacked with caramelized sweet onions, smoked beef bacon, double gouda cheese, dill pickles, and secret chef BBQ glaze.',
      isHot: false,
      isPopular: true,
      ingredients: ['Angus Beef Patty', 'Double Gouda', 'Caramelized Onions', 'Smoked Bacon', 'BBQ Glaze'],
    ),
    Product(
      id: 'p5',
      name: 'Loaded Pizza Cheese Fries',
      category: 'Sides & Fries',
      price: 6.49,
      rating: 4.7,
      reviewCount: 160,
      calories: 510,
      prepTime: '10-12 min',
      imageUrl: 'assets/images/fries-removebg-preview.png',
      description:
          'Golden crispy skin-on potato fries smothered with rich marinara sauce, bubbling melted mozzarella, sliced black olives, jalapenos, and Italian herbs.',
      isHot: true,
      isPopular: false,
      ingredients: ['Crispy Potato Fries', 'Marinara Sauce', 'Melted Mozzarella', 'Black Olives', 'Jalapeno Peppers'],
    ),
    Product(
      id: 'p6',
      name: 'Gourmet Feast Platter',
      category: 'Grill & BBQ',
      price: 24.99,
      rating: 4.9,
      reviewCount: 310,
      calories: 950,
      prepTime: '25-30 min',
      imageUrl: 'assets/images/food-removebg-preview.png',
      description:
          'A royal combination platter featuring charcoal-grilled chicken skewers, mini sliders, loaded fries, garlic butter naan, and assorted house dips.',
      isHot: true,
      isPopular: true,
      ingredients: ['Mixed Skewers', 'Mini Sliders', 'Seasoned Fries', 'Garlic Naan', 'Dipping Trio'],
    ),
    Product(
      id: 'p7',
      name: 'Crispy Double Tender Burger',
      category: 'Burgers',
      price: 9.49,
      rating: 4.5,
      reviewCount: 142,
      calories: 590,
      prepTime: '15 min',
      imageUrl: 'assets/images/images-removebg-preview.png',
      description:
          'Double crispy fried chicken tenders layered with creamy coleslaw, melted American cheese, and honey mustard glaze in a buttery toasted brioche.',
      isHot: false,
      isPopular: false,
      ingredients: ['Double Tenders', 'Creamy Slaw', 'American Cheese', 'Honey Mustard', 'Brioche Bun'],
    ),
    Product(
      id: 'p8',
      name: 'Pepperoni Supreme Pizza',
      category: 'Pizzas',
      price: 16.99,
      rating: 4.8,
      reviewCount: 280,
      calories: 840,
      prepTime: '20-25 min',
      imageUrl: 'assets/images/images__1_-removebg-preview.png',
      description:
          'Classic artisan crust packed edge-to-edge with premium cured beef pepperoni slices, shredded mozzarella, oregano, and crushed red chili flakes.',
      isHot: true,
      isPopular: false,
      ingredients: ['Artisan Dough', 'Spicy Pepperoni', 'Whole Milk Mozzarella', 'Oregano', 'Chili Flakes'],
    ),
  ];
}

// Backward compatibility helper
final List<Product> demoProducts = DummyData.products;
