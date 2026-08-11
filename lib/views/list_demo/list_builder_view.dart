import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/dummy_data.dart';
import '../../models/product.dart';
import '../../routes/app_routes.dart';
import '../../utils/app_strings.dart';

class ListBuilderDemoScreen extends StatefulWidget {
  const ListBuilderDemoScreen({super.key});

  @override
  State<ListBuilderDemoScreen> createState() => _ListBuilderDemoScreenState();
}

class _ListBuilderDemoScreenState extends State<ListBuilderDemoScreen> {
  // Simple list of products to display dynamically
  List<Product> products = List.from(demoProducts);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          AppStrings.listBuilderTitle,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.red.shade900,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12.0),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];

          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red.shade100,
                child: Icon(Icons.fastfood, color: Colors.red.shade900),
              ),
              title: Text(
                product.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "\$${product.price.toStringAsFixed(2)} - Rating: ${product.rating}",
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  setState(() {
                    products.removeAt(index);
                  });
                },
              ),
              onTap: () {
                Get.toNamed(AppRoutes.productDetail, arguments: product);
              },
            ),
          );
        },
      ),
    );
  }
}
