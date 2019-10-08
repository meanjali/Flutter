import 'package:flutter/material.dart';

import 'messageList.dart';
//WHEN WIDGET WAS STATELESS
/*
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue,),
      home: MyHomePage(title: 'JSON Serialization'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

/*var messages=const[
  "My first message","My second message","My third message","My fourth message","My fifth message"
];*/



var messages=const[
  /*{
    'subject':"My first message",
    'body':"Another text which is really very long so everyone can read it and see it."
    },
  {
    'subject':"My first message",
    'body':"Another text which is really very long so everyone can read it and see it."
    },
  {
    'subject':"My first message",
    'body':"Another text which is really very long so everyone can read it and see it."
    },
  {
   'subject':"My first message",
    'body':"Another text which is really very long so everyone can read it and see it."
    },
  {
    'subject':"My first message",
    'body':"Another text which is really very long so everyone can read it and see it and this is really very long that goes on to thirst line."
    },*/
    
];
MyHomePage({this.title});
  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
      title: Text(title),
      ),
      body: ListView.separated(
        itemCount: messages.length,
        separatorBuilder:(context,index)=> Divider(),
        itemBuilder: (BuildContext context,int index){
          var message = messages[index];
          return ListTile(
            title: Text(message['subject']),
            subtitle: Text(message['body'], maxLines: 2,overflow:TextOverflow.ellipsis),
            leading: CircleAvatar(
              child:Text("A")
              ),
          );

        },
      ),
    );
  }
}
*/

//WHEN WIDGET IS STATEFUL
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue,),
      home: MessageList(title: 'JSON Serialization'),
    );
  }
}

