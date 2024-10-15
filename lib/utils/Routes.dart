import 'package:go_router/go_router.dart';
import 'package:ridewave/screens/Home.dart';
import 'package:ridewave/screens/QueryForm.dart';
import 'package:ridewave/screens/SplashScreen.dart';
import 'package:ridewave/screens/UpdatePage.dart';
import 'package:ridewave/screens/login.dart';

final routes = GoRouter(
    routes: [
      GoRoute(
          path: "/",
          name: "splash",
          builder: (context,state)=>const Splashscreen()
      ),
      GoRoute(
          path: "/Home",
          name: "home",
          builder: (context,state)=>const Home()
      ),
      GoRoute(
          path: "/login",
          name: "login",
          builder: (context,state)=>const GoogleLoginPage()
      ),
      GoRoute(
          path: "/update",
          name: "Update",
          builder: (context,state)=>const UpdatePage()
      ),
      GoRoute(
          path: "/queryForm/:id",
          name: "QueryForm",
          builder: (context,state)=> QueryForm(id: int.parse(state.pathParameters["id"]!))
      ),
    ]
);