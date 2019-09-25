import 'package:flutter/material.dart';
import 'package:routing/route_generation.dart';


void main() => runApp(MyApp());
//BASIC NAVIGATION USING MATERIALPAGEROUTE
/*class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Routing Example",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstPage(),
    );
  }
}
  class FirstPage extends StatelessWidget{
    @override
    Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
        title: Text("Routing Example"),
      ),
      body: Center(
        child:Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
          Text("First Page",
          style: TextStyle(fontSize: 50),
        ),
        RaisedButton(
          child: Text("Go to Second"),
          onPressed: (){
            //Basic way of navigation
            Navigator.of(context).push(
MaterialPageRoute(
  builder: (context)=>
  SecondPage(data:"Hello there from the first page"),
)
            );
          },
        )
        ],
        ),
        ),
      );
    }
  }
  class SecondPage extends StatelessWidget{
    final String data;
    SecondPage({
      Key key,
      @required this.data,
    }):super(key:key);
    @override
    Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
          title: Text("Routing App"),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "Second Page",
              style: TextStyle(fontSize: 50),
              ),
              Text(
                data,
              style: TextStyle(fontSize: 20),
              ),
            ],),
        ),
      );
    }
  }
*/
//Named Routes - option 1: Map of routes ----> Problem- cannot pass data that changes dynamically, can be static/fixed data
/*class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Routing Example",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstPage(),
      routes:{
        '/second':(_)=> SecondPage(
          data:"hello Second page",)
      },
    );
  }
}
  class FirstPage extends StatelessWidget{
    @override
    Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
        title: Text("Routing Example"),
      ),
      body: Center(
        child:Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
          Text("First Page",
          style: TextStyle(fontSize: 50),
        ),
        RaisedButton(
          child: Text("Go to Second"),
          onPressed: (){
            //Basic way of navigation
            Navigator.of(context).pushNamed("/second");
          },
        )
        ],
        ),
        ),
      );
    }
  }
  class SecondPage extends StatelessWidget{
    final String data;
    SecondPage({
      Key key,
      @required this.data,
    }):super(key:key);
    @override
    Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
          title: Text("Routing App"),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "Second Page",
              style: TextStyle(fontSize: 50),
              ),
              Text(
                data,
              style: TextStyle(fontSize: 20),
              ),
            ],),
        ),
      );
    }
  }
  */
  //Named Routes - Option 2: Function returning routes -----> 
  class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Routing Example",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      onGenerateRoute: RouteGenerator.generateRoute,
     
    );
  }
}
  class FirstPage extends StatelessWidget{
    @override
    Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
        title: Text("Routing Example"),
      ),
      body: Center(
        child:Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
          Text("First Page",
          style: TextStyle(fontSize: 50),
        ),
        RaisedButton(
          child: Text("Go to Second"),
          onPressed: (){
            //Basic way of navigation
            Navigator.of(context).pushNamed("/second",arguments: "Hello there  from the first app");
          },
        )
        ],
        ),
        ),
      );
    }
  }
  class SecondPage extends StatelessWidget{
    final String data;
    SecondPage({
      Key key,
      @required this.data,
    }):super(key:key);
    @override
    Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
          title: Text("Routing App"),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "Second Page",
              style: TextStyle(fontSize: 50),
              ),
              Text(
                data,
              style: TextStyle(fontSize: 20),
              ),
            ],),
        ),
      );
    }
  }