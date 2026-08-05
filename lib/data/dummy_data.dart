import '../models/product.dart';

final List<Product> demoProducts = [
  const Product(
    id: 'p1',
    name: 'Zinger Burger',
    category: 'Burgers',
    price: 89.99,
    rating: 4.6,
    imageUrl: 'https://www.foodandwine.com/thmb/XE8ubzwObCIgMw7qJ9CsqUZocNM=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/MSG-Smash-Burger-FT-RECIPE0124-d9682401f3554ef683e24311abdf342b.jpg',
    description:
        'So tasty burger you will like it. Made with fresh ingredients, juicy beef patty, and a special sauce that will leave you craving for more.',
    isHot: true,
  ),
  const Product(
    id: 'p2',
    name: 'Pizza Margherita',
    category: 'Pizzas',
    price: 199.99,
    rating: 4.3,
    imageUrl: 'https://img.magnific.com/free-photo/pizza-pizza-filled-with-tomatoes-salami-olives_140725-1200.jpg?semt=ais_test_b&w=740&q=80',
    description:
        'A classic Margherita pizza with fresh tomatoes, mozzarella cheese, and basil.',
  ),
  const Product(
    id: 'p3',
    name: 'Chicken Tikka',
    category: 'Tikkas',
    price: 149.99,
    rating: 4.8,
    imageUrl: 'https://www.indianhealthyrecipes.com/wp-content/uploads/2022/03/chicken-tikka-recipe.jpg',
    description:
        'Tender and flavorful chicken pieces marinated in a blend of spices and yogurt, then grilled to perfection.',
  ),
];