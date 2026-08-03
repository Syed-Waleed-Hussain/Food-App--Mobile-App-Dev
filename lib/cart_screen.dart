import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Icon(Icons.arrow_back, color: Colors.white),
              SizedBox(height: 20),
              Text("Items in Cart", style: TextStyle(color: Colors.white, fontSize: 24)),
              SizedBox(height: 20),
              Container(
                color: Colors.pink[100],
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(Icons.lunch_dining, size: 50, color: Colors.red),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Zinger Burger", style: TextStyle(fontSize: 18)),
                        Text("\$30"),
                        Text("-  1  +"),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                color: Colors.pink[100],
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(Icons.fastfood, size: 50, color: Colors.red),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Lasagna", style: TextStyle(fontSize: 18)),
                        Text("\$26"),
                        Text("-  1  +"),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 30),
              Text("Instructions", style: TextStyle(color: Colors.white, fontSize: 18)),
              SizedBox(height: 10),
              Container(
                height: 80,
                width: double.infinity,
                color: Colors.pink[100],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total", style: TextStyle(color: Colors.white, fontSize: 20)),
                  Text("\$56", style: TextStyle(color: Colors.white, fontSize: 20)),
                ],
              ),
              SizedBox(height: 20),
              Container(
                height: 50,
                width: double.infinity,
                color: Colors.pink[100],
                child: Center(
                  child: Text("Check out"),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text("Back to Menu", style: TextStyle(color: Colors.white)),
              )
            ],
          ),
        ),
      ),
    );
  }
}