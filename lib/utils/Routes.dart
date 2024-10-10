import 'package:go_router/go_router.dart';
import 'package:ridewave/screens/Home.dart';
import 'package:ridewave/screens/SplashScreen.dart';
import 'package:ridewave/screens/UpdatePage.dart';
import 'package:ridewave/screens/login.dart';

final routes = GoRouter(
    routes: [
      GoRoute(
          path: "/",
          name: "splash",
          builder: (state,context)=>const Splashscreen()
      ),
      GoRoute(
          path: "/Home",
          name: "home",
          builder: (state,context)=>const Home()
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