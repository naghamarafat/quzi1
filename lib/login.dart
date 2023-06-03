import 'package:flutter/material.dart';
import 'package:quzi1/api/HomeApi.dart';


import 'SharedPreController.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool b = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            children: [
              TextField(
          decoration: InputDecoration(
          label: Text("enter your name"),
        icon: IconButton(onPressed: () {}, icon: Icon(Icons.add_a_photo)),
        contentPadding: EdgeInsets.all(18),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
              ),),

              SizedBox(height: 50,),
              Checkbox(value: b, onChanged:(value) {
                setState(() {
                  b = value!;
                });
              }, ),
              ElevatedButton(
                  onPressed: () async {
                    if(b){
                      SharedPreController sh =  SharedPreController();
                      await sh.getInit();
                      sh.setData(key: "isLogin",value: b);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeAPI(), ));
                    }
                  },
                  child: Text("Login")),
            ],
          ),

      ),
    );
  }
}
