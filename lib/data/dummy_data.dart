import '../models/product.dart';

final List<Product> demoProducts = [
  const Product(
    id: 'p1',
    name: 'Zinger Burger',
    category: 'Burgers',
    price: 89.99,
    rating: 4.6,
    imageUrl: 'assets/images/zinger-removebg-preview.png',
    description:
        'So tasty burger you will like it. Made with fresh ingredients, juicy crispy chicken patty, and special sauce.',
    isHot: true,
  ),
  const Product(
    id: 'p2',
    name: 'Pizza Margherita',
    category: 'Pizzas',
    price: 199.99,
    rating: 4.3,
    imageUrl: 'assets/images/pizza2-removebg-preview.png',
    description:
        'A classic Margherita pizza with fresh tomatoes, mozzarella cheese, and basil.',
  ),
  const Product(
    id: 'p3',
    name: 'Chicken Tikka',
    category: 'Tikkas',
    price: 149.99,
    rating: 4.8,
    imageUrl: 'assets/images/tikka-removebg-preview.png',
    description:
        'Tender and flavorful chicken pieces marinated in a blend of spices and yogurt, then grilled to perfection.',
  ),
  const Product(
    id: 'p4',
    name: 'Beef Burger',
    category: 'Burgers',
    price: 99.99,
    rating: 4.5,
    imageUrl: 'assets/images/burger-removebg-preview.png',
    description:
        'Juicy beef patty grilled with fresh lettuce, onions, melted cheese, and signature sauce.',
  ),
  const Product(
    id: 'p5',
    name: 'Pizza Fries',
    category: 'Fries',
    price: 49.99,
    rating: 4.7,
    imageUrl: 'assets/images/fries-removebg-preview.png',
    description:
        'Crispy golden fries loaded with pizza sauce, melted mozzarella cheese, and olives.',
  ),
];