import 'package:flutter/material.dart';

void main() => runApp(MyAppImpl());

class MyAppImpl extends StatefulWidget {
  @override
  _MyAppImplState createState() => _MyAppImplState();
}

class _MyAppImplState extends State<MyAppImpl> {
  int c=0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(appBar: AppBar(),
      body: Column(children: <Widget>[
        Text("Text value = $c"),
        Checkbox(
          value: false,
          onChanged: (bool newValue){
c++;
print("Counter value = {$c}");
setState(() {
  
});
          }
        
        ),

      ],
      ),
      ),
      
    );
  }
}