import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Message.dart';

class MessageList extends StatefulWidget {
  final String title;

  const MessageList({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MessageListState();
}
class _MessageListState extends State<MessageList>{
  var messages=const[];
  Future loadMessageList() async{
    //root bundle uses package - sevices.dart, it allows to load files as a string
    //String content= await rootBundle.loadString('data/messages.json');
    http.Response response =await http.get('http://www.mocky.io/v2/5d9cd92f3100009ea42fc82f');
    String content= response.body;
    
    //content is string;load json structure which is sloaded in string format
    print(content);
    //convert string to json structure
    //uses dart.convert library
    List collection=json.decode(content);
    List<Message> _messages=
    collection.map((json)=>Message.fromJson(json)).toList();

    setState(() {
      //messages=collection;
      messages=_messages;
    });
  }
  void initState(){
    loadMessageList();
    super.initState();
  }
    Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
      title: Text(widget.title),
      ),
      body: ListView.separated(
        itemCount: messages.length,
        separatorBuilder:(context,index)=> Divider(),
        itemBuilder: (BuildContext context,int index){
          //var message = messages[index];
        Message message = messages[index];
          return ListTile(
            /*title: Text(message['subject']),
            subtitle: Text(message['body'], maxLines: 2,overflow:TextOverflow.ellipsis),*/
            //Now message is a class
            title: Text(message.subject),
            subtitle: Text(message.body, maxLines: 2,overflow:TextOverflow.ellipsis),
            leading: CircleAvatar(
              child:Text("A")
              ),
          );

        },
      ),
    );
  }
}