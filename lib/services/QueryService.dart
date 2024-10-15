import 'package:http/http.dart' as http;


import 'package:flutter_dotenv/flutter_dotenv.dart';

class QueryService{
  static Future<bool?> submitQuery(id,name,phone,email,count,des,) async {
    final response = await http.post(Uri.parse('${dotenv.env["BASEURL"]}/user/Query?package_id=$id&user_name=$name&user_phone=$phone&user_email=$email&user_query=$des&total_prsn=$count'));

    if (response.statusCode == 200) {

      return true;
    } else {
      throw Exception('Failed to load user data');
    }

  }
}