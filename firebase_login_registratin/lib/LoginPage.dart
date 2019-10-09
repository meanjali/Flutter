import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
@override
State<StatefulWidget>createState()=>_LoginPageState();
}
enum FormType{
  login,
  register
}

class _LoginPageState extends State<LoginPage>
{
  //Formkey will start validating otherwise even tho validators are written on both text fields, validators are not triggered
  final formKey= GlobalKey<FormState>();
  FormType _formType=FormType.login;
String _email;
String _password;
/*void validataeAndSave(){
  final form=formKey.currentState;
if(form.validate()){
  //Email and Passwords are null, therefore include form.save
  form.save();
  print("Form is valid.Email: $_email and Password: $_password");
}else{
  print("Form is invalid.Email: $_email and Password: $_password");
}
}
*/

bool validateAndSave(){
  final form=formKey.currentState;
if(form.validate()){
  //Email and Passwords are null, therefore include form.save
  form.save();
  return true;
}return false;
}

void validateAndSubmit() async{
  if(validateAndSave()) {
    //cox awit in used inside it
    //validate and save is true then authenticate user.
//Authentication Code
//signInwithEmailAndPassword ia a async function returns firebase use
try{
  if(_formType==FormType.login){
  //if they already have an account
  FirebaseUser user =(await FirebaseAuth.instance.signInWithEmailAndPassword(email:_email,password:_password)).user;
  print("Signed in:${user.uid}");
  }else{
//if they don't have an account
  FirebaseUser user =(await FirebaseAuth.instance.createUserWithEmailAndPassword(email:_email,password:_password)).user;
print("Registered in:${user.uid}");
  }
  }
  catch(e){
    print("Error:$e");
  }
  }
}


void moveToRegister(){
  //reset the text from field values
  formKey.currentState.reset();
  setState(() {
    _formType=FormType.register;
  });
}
void moveToLogin(){
  //reset the text from field values
  formKey.currentState.reset();
  setState(() {
    _formType=FormType.login;
  });
}
  @override
  Widget build(BuildContext context){
  return new Scaffold(
appBar: new AppBar(
  title: Text("Flutter Login Demo") ,
),
body: Container(
  padding: EdgeInsets.all(16.0),
  child: Form(
    key:formKey,
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: buildInputs()+buildSubmitButtons(),
  ),
  ),
  )
  );
}
List <Widget> buildInputs(){
  return [
    TextFormField(
  decoration: InputDecoration(labelText: 'Email'),
  //Add validator for email
validator: (value)=>value.isEmpty?'Email can\'t be empty':null,
onSaved: (value)=> _email=value,

),
TextFormField(decoration: InputDecoration(labelText: 'Password'),
//validator for password
validator: (value)=>value.isEmpty?'Email can\'t be empty':null,
onSaved: (value)=> _password=value,
obscureText: true,
),
  ];
}
List<Widget> buildSubmitButtons(){
  if(_formType==FormType.login){
    return[
RaisedButton(
  child: Text("Login", style: TextStyle(fontSize: 20.0),
),
onPressed: validateAndSubmit,
),
FlatButton(
  child: Text("Create an account"),
  onPressed: moveToRegister,)
  ];
  }else{
return[
RaisedButton(
  child: Text("Register", style: TextStyle(fontSize: 20.0),
),
onPressed: validateAndSubmit,
),
FlatButton(
  child: Text("Already have an account? Login"),
  onPressed: moveToLogin,)
  ];
  }

  
}
}