import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/dummy_data.dart';
import '../models/product.dart';
import '../routes/app_routes.dart';
import '../utils/app_strings.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade900,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Get.offNamed(AppRoutes.login);
                      },
                    ),
                    const Text(
                      AppStrings.menu,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.shopping_cart, color: Colors.white),
                          onPressed: () {
                            Get.toNamed(AppRoutes.cart);
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.person, color: Colors.white),
                          onPressed: () {
                            Get.toNamed(AppRoutes.profile);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Search Bar
                Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.red.shade100,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.search, color: Colors.red),
                      SizedBox(width: 10),
                      Text(
                        AppStrings.searchHint,
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),

                // Category row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildCategoryCard('Burger', 'assets/images/burger-removebg-preview.png', demoProducts[0]),
                    _buildCategoryCard('Pizza', 'assets/images/pizza2-removebg-preview.png', demoProducts[1]),
                    _buildCategoryCard('Tikka', 'assets/images/tikka-removebg-preview.png', demoProducts[2]),
                  ],
                ),
                const SizedBox(height: 25),

                // Promotions banner
                const Text(
                  AppStrings.promotions,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.red.shade100,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(
                    child: Text(
                      AppStrings.promoBanner,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 25),

                // Week 06 List Demos
                const Text(
                  "List View Demos (Week 06)",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.red.shade900,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          Get.toNamed(AppRoutes.listViewDemo);
                        },
                        child: const Text("Static ListView"),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.red.shade900,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          Get.toNamed(AppRoutes.listBuilderDemo);
                        },
                        child: const Text("ListView.builder"),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),

                // Popular Items Header
                const Text(
                  "Popular Foods",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),

                // Popular items list
                Column(
                  children: demoProducts.map((product) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: Colors.red.shade100,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(Icons.fastfood, color: Colors.red.shade900),
                        ),
                        title: Text(
                          product.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "\$${product.price.toStringAsFixed(2)} | Rating: ${product.rating}",
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () {
                          Get.toNamed(AppRoutes.productDetail, arguments: product);
                        },
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(String title, String assetImage, Product product) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.productDetail, arguments: product);
      },
      child: Container(
        height: 90,
        width: 90,
        decoration: BoxDecoration(
          color: Colors.red.shade100,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              assetImage,
              width: 40,
              height: 40,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.fastfood, color: Colors.red),
            ),
            const SizedBox(height: 6),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
