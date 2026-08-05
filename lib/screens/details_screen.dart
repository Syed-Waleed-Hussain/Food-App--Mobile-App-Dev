import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/product.dart';
import '../utils/app_strings.dart';

class DetailsScreen extends StatelessWidget {
   final Product product;

  const DetailsScreen({super.key, required this.product});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Icon(Icons.arrow_back, color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            Icon(Icons.lunch_dining, size: 150, color: Colors.orange),
            SizedBox(height: 30),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.pink[100],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        color: Colors.white,
                        child: Text("4.9"),
                      ),
                      Text("\$30", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Zinger Burger", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      Text("-  1  +", style: TextStyle(fontSize: 18)),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text("Big Juicy Zinger with cheese"),
                  SizedBox(height: 20),
                  Text("Add Ons"),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        height: 60,
                        width: 80,
                        color: Colors.white,
                        child: Icon(Icons.fastfood, color: Colors.red),
                      ),
                      SizedBox(width: 15),
                      Container(
                        height: 60,
                        width: 80,
                        color: Colors.white,
                        child: Icon(Icons.local_pizza, color: Colors.green),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Container(
                    height: 50,
                    width: double.infinity,
                    color: Colors.red,
                    child: Center(
                      child: Text("Add to Cart", style: TextStyle(color: Colors.white)),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}