

import 'package:go_router/go_router.dart';
import 'package:ridewave/model/LoginData.dart';
import 'package:ridewave/services/AuthServices.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository{

  // Get login state
  static void isLoggedIn(context) async {
    final prefs = await SharedPreferences.getInstance();
    if(prefs.getBool("isLoggedIn")??false){
      GoRouter.of(context).goNamed("home");
    }else{
      GoRouter.of(context).goNamed("login");
    }
  }

  static Future<LoginData> getUserData()async{
    var data=await AuthService.getLoginData();
    // print(data);
    return LoginData.fromJson(data);
  }

}