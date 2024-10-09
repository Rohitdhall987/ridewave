import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String _isLoggedInKey = 'isLoggedIn';

  final GoogleSignIn _googleSignIn=GoogleSignIn();


   Future<bool> handleLogin()async{
     try{
       GoogleSignInAccount? acc = await _googleSignIn.signIn();

       if(acc == null){
         throw "unable to login. GoogleSignInAccount is null";
       }

       _updateInServer(acc.email,acc.id);

       return true;

     }catch (e){
        return false;
     }

    _setLoggedIn(true);
  }

  void _updateInServer(email,uid)async{

    Uri url=Uri.https(
        dotenv.env["DOMAIN"].toString(),
        "/api/UserRegister",
        {
          "email":email,
          "uid":uid,
        }
    );
    http.Response response =await http.post(url);

    if(response.statusCode== 200){
      var userData=jsonDecode(response.body);
      _setLogInData(
          userData["user"]["id"],
          userData["user"]["uid"],
          userData["user"]["name"],
          userData["user"]["email"],
          userData["token"],
      );
    }
  }

   Future<bool> handleLogOut()async{
    try{
      await _googleSignIn.signOut();
      _clearAllData();
      return true;
    }catch (e){
      return false;
    }
  }

  // Save login state
   Future<void> _setLoggedIn(bool isLoggedIn) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isLoggedInKey, isLoggedIn);
  }

  // Save all data
  Future<void> _setLogInData(id,uid,name,email,token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isLoggedInKey, true);
    await prefs.setInt("id", id);
    await prefs.setString("uid", uid);
    await prefs.setString("name", name);
    await prefs.setString("email", email);
    await prefs.setString("token", token);
  }

  static Future<Map<String,dynamic>> getLoginData() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      "id":prefs.getInt("id"),
      "uid":prefs.getString("uid"),
      "name":prefs.getString("name"),
      "email":prefs.getString("email"),
      "token":prefs.getString("token")
    };
  }

  // Clear all SharedPreferences data
  Future<void> _clearAllData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // This will clear all stored data
  }


}
