import 'package:flutter/material.dart';

class manu_screen extends StatelessWidget {
  const manu_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red.shade900,
        child: Padding(padding: 
        EdgeInsets.all(20),
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.arrow_back, color: Colors.white,),
                Text('Menu', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                Text('Notification', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
              ],
            ),
            SizedBox(height: 20,),
            Container(
              height: 50,
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
              color: const Color.fromARGB(255, 222, 141, 168),
              borderRadius: BorderRadius.circular(20),
              ),
              child:Row(
                children: [
                  Icon(Icons.search, color: Colors.white,),
                  SizedBox(width: 10,),
                  Text('Search', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                ],
              )
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height:80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 222, 141, 168),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/burger-removebg-preview.png',width: 40,height:40,),
                      Text('Burger', style: TextStyle(fontSize: 20, color: Colors.white),),

                    ]
                  )

                ),
                Container(
                  height:80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 222, 141, 168),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/pizza2-removebg-preview.png',width: 40,height:40,),
                      Text('Pizza', style: TextStyle(fontSize: 20, color: Colors.white),),

                    ]
                  )

                ),
                Container(
                  height:80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 222, 141, 168),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/tikka-removebg-preview.png',width: 40,height:40,),
                      Text('Tikka', style: TextStyle(fontSize: 20, color: Colors.white),),

                    ]
                  )
                )
              ]
            ),
            SizedBox(height: 20,),
              Text("Promotions", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),

              Container(
                height: 100,
                width: double.infinity, // Poori screen ki chaurai
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 222, 141, 168),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    "Free Pizza Fries on orders above \$20", 
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(width: 15), 
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.pink[100],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            Icon(Icons.lunch_dining, size: 50, color: Colors.red),
                            SizedBox(height: 10),
                            Text("Lasagna", style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      )
          ]
        )
      )
      )
    );
  }
}