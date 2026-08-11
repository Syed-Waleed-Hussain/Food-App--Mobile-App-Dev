import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/app_strings.dart';

class ListViewDemoScreen extends StatelessWidget {
  const ListViewDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          AppStrings.listViewTitle,
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
      body: ListView(
        padding: const EdgeInsets.all(12.0),
        children: const [
          Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red,
                child: Icon(Icons.fastfood, color: Colors.white),
              ),
              title: Text('Zinger Burger', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Crispy chicken burger with spicy mayo'),
              trailing: Text('\$89.99', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
          Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red,
                child: Icon(Icons.local_pizza, color: Colors.white),
              ),
              title: Text('Pizza Margherita', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Fresh tomatoes, mozzarella, and basil'),
              trailing: Text('\$199.99', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
          Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red,
                child: Icon(Icons.set_meal, color: Colors.white),
              ),
              title: Text('Chicken Tikka', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Spiced and grilled barbecue chicken'),
              trailing: Text('\$149.99', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
          Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red,
                child: Icon(Icons.lunch_dining, color: Colors.white),
              ),
              title: Text('Beef Burger', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Juicy beef patty with melted cheese'),
              trailing: Text('\$99.99', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
          Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red,
                child: Icon(Icons.ramen_dining, color: Colors.white),
              ),
              title: Text('Pizza Fries', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Loaded cheese fries with pizza topping'),
              trailing: Text('\$49.99', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
          Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red,
                child: Icon(Icons.cake, color: Colors.white),
              ),
              title: Text('Chocolate Lava Cake', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Warm chocolate cake with molten center'),
              trailing: Text('\$39.99', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
