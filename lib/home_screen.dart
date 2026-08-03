import 'package:flutter/material.dart';

class home_screen extends StatelessWidget {
  const home_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red.shade900,
        height: double.infinity,
        width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Image.asset('assets/images/food-removebg-preview.png',width: 200,height:200,
            ),
            SizedBox(height: 20,),
            Text('Enjoy your Meal!',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            Container(
              color: const Color.fromARGB(255, 209, 40, 96),
              margin: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/profile');
                },
                child: Text('Get Started'),
              ),
            )
            
          ],)
      )
    );
  }
}