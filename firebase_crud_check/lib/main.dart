import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final dBRef=FirebaseDatabase.instance.reference();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CRUD",
      home: Scaffold(
        appBar: AppBar(title: Text("CRUD OPERATIONS"),),
        body: Column(children: <Widget>[
          RaisedButton(child: Text("Write Data"),
            onPressed: (){
writeData();
            },),
            RaisedButton(child: Text("Read"),
            onPressed: (){
readData();
            },),
            RaisedButton(child: Text("Update"),
            onPressed: (){
updateData();
            },),
            RaisedButton(child: Text("Delete"),
            onPressed: (){
deleteData();
            },)

        ],),
      ),
     
    );
  }
  void writeData(){
    //set- to write data to firebase
    //1 is id,1 can be considered as a node which will have 2 fields- id and data
 dBRef.child("1").set({
   'id':'ID1',
   'data':'This is sample data'
 }); 
}
void readData(){
  dBRef.once().then((DataSnapshot dataSnapshot){
print(dataSnapshot.value);
  }
  );
}
void updateData(){
  dBRef.child("1").update({
    'data':'This is updated value'
  });
}
void deleteData(){
  dBRef.child("1").remove();
}
}

