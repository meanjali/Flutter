import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
var width = 10.0;
var opacity=0.0;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
  body: new Center(
  child: new Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children:[
      AnimatedContainer(
        duration: Duration(microseconds: 500),
        alignment: Alignment.center,
    width: width,
    height: 50.0,
    decoration: BoxDecoration(color: Colors.blueGrey,
    borderRadius: BorderRadius.circular(20.0)),
    
    child:AnimatedOpacity(
      duration: Duration(seconds: 1),
      opacity: opacity,
          child: Text("Hello world",style: TextStyle(color: Colors.white),),

    ),

  ),
   FlatButton(
     onPressed: (){
     setState(() {
       opacity=opacity==0.0?1.0:0.0;
        width=200.0;
     });
    },
  child: Text("Click Here!"),
  ),
    ]
  ),
),
      
    );
  }
}