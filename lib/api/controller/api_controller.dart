import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quzi1/api/model/user.dart';

class ApiController  {


   Future<List<Users>> getAllUsers() async {
    List<Users> list = [];
    // url
    Uri uri = Uri.parse("http://demo-api.mr-dev.tech/api/users");
    //method
    http.Response response = await http.get(uri);
    //response
    if(response.statusCode == 200 || response.statusCode == 400){
       var body = json.decode(response.body);
       body["data"].forEach((e){
         list.add(Users.fromJson(e));
       });
    }
    return list;
   }

}




