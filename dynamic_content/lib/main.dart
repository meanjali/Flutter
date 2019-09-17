import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return new MaterialApp(
      home: new ListDisplay(),
    );
  }
}
class ListDisplay extends StatelessWidget {
  @override
  Widget build (BuildContext ctxt) {
    List<String> litems = ["1","2","Third","4"];
    return new Scaffold(
      appBar: new AppBar(title: new Text("Dynamic Demo"),),
      body: new ListView.builder
  (
    itemCount: litems.length,
    itemBuilder: (BuildContext ctxt, int index) {
     return new Text(litems[index]);
    }
  )  // ListView.builder() shall be used here.
      
    );
  }
}