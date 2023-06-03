import 'package:flutter/material.dart';

import 'package:quzi1/api/controller/api_controller.dart';
import 'package:quzi1/api/model/user.dart';

class HomeAPI extends StatefulWidget {
  const HomeAPI({Key? key}) : super(key: key);

  @override
  State<HomeAPI> createState() => _HomeAPIState();
}

class _HomeAPIState extends State<HomeAPI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(),
      body: FutureBuilder<List<Users>>(
        future:ApiController().getAllUsers(),
         builder: (context, snapshot) {
         if(snapshot.connectionState == ConnectionState.waiting){
           return Center(child: CircularProgressIndicator(),);
         }else if(snapshot.connectionState == ConnectionState.done && snapshot.data != null && snapshot.data!.isNotEmpty){
           return ListView.builder(
             itemCount: snapshot.data!.length,
             itemBuilder: (context, index) => ListTile(
               title: Text(snapshot.data![index].firstName!),
               subtitle: Text(snapshot.data![index].lastName!),
               trailing: Image.network("${snapshot.data![index].image}"),
             ),);
         }else{
              return Center(
                child: Text("no data found"),
              );
         }
         },
      ),
    );
  }
}
