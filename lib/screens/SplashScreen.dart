import 'package:flutter/material.dart';
import 'package:ridewave/utils/AppColors.dart';


class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      body:  SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("RW",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w100,
                  fontSize: 64
              ),
            ),
            Text("Ride Wave",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w100,
                fontSize: 24
              ),
            )
          ],
        ),
      ),
    );
  }
}
