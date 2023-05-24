import 'package:shared_preferences/shared_preferences.dart';

class SharedPreController {
  late SharedPreferences prefs ;
  static SharedPreController? instance;

  SharedPreController._init();

  factory SharedPreController(){
    // if(instance ==null){
    //   instance = SharedPreController._init();
    // }
    // return instance!;
    return instance??=SharedPreController._init();
  }

  getInit() async {
    prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey("isLogin")){
      prefs.setBool("isLogin", false);

    }
  }

  setData({key,value}){
    if(value is int){
      prefs.setInt(key, value);
    }
    else if(value is String){
      prefs.setString(key, value);
    }
    else if(value is bool){
      prefs.setBool(key, value);
    }
    else if(value is double){
      prefs.setDouble(key, value);
    }
  }

  T getData<T>(key){
    return prefs.get(key) as T ;
  }



}