import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ridewave/screens/SplashScreen.dart';
import 'package:ridewave/screens/UpdatePage.dart';
import 'package:ridewave/screens/login.dart';
import 'package:ridewave/utils/AppColors.dart';


class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.blue),
        textTheme: GoogleFonts.robotoTextTheme(),
        useMaterial3: true,
      ),
      routerConfig: _routes,
    );
  }
  final _routes = GoRouter(
      routes: [
        GoRoute(
            path: "/",
            name: "splash",
            builder: (state,context)=>const Splashscreen()
        ),
        GoRoute(
            path: "/home",
            name: "home",
            builder: (state,context)=>const Placeholder()
        ),
        GoRoute(
            path: "/login",
            name: "login",
            builder: (state,context)=>const GoogleLoginPage()
        ),
        GoRoute(
            path: "/update",
            name: "Update",
            builder: (state,context)=>const UpdatePage()
        ),
      ]
  );
}