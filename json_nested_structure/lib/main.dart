import 'package:flutter/material.dart';
import 'package:json_nested_structure/shape_services.dart';

void main() {
  runApp(new MyApp());
//  loadProduct();
//  loadPhotos();
//  loadAddress();
//  loadStudent();
 loadShape();
//  loadBakery();
//  loadPage();
}




class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: Home()
    );
  }
}

class Home extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
        body : Text("Hello world")
    );
  }

}