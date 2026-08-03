import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/app_routes.dart';
import 'package:get/get_core/src/get_interface.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                onPressed: (){
                  Get.toNamed(
                    AppRoutes.login,
                  );
                },
                child: Text('Get Started'),
              ),
            )
          ],
        )
      )
    );
  }
}