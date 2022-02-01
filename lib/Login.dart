import 'package:flutter/material.dart';

import 'FormValidation.dart';
import 'Home.dart';
import 'Register.dart';


class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
      ),
      duration: Duration(seconds: 2),
      behavior: SnackBarBehavior.fixed,
      backgroundColor: Colors.blue,
      action: SnackBarAction(
        label: 'Ok',
        textColor: Colors.white,
        onPressed: () {
          // Some code to undo the change.
          print("Snackbar clicked");
        },
      ),
    ));
  }

  warningDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Warning!', style: TextStyle(color: Colors.red),),
          actions: [
            MaterialButton(
              minWidth: MediaQuery.of(context).size.width / 3.5,
              height: 40,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Ok"),
              color: Colors.blue,
              textColor: Colors.white,
            ),
          ],
          content: Container(
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height / 5,
              child: Row(
                children: const [
                  Text("This is a Dialog to show"),
                ],
              )),
        );
      },
    );
  }

  var formKey = GlobalKey<FormState>();

  var formValidator= FormValidation();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              Text(
                "LOGIN",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 50,
                    color: Colors.teal,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: "Type email",
                    labelText: "Email Address",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email)),
                validator: (value){
                  if(formValidator.isEmailValid(value!)){
                    return null;
                  }else{
                    return "Invalid Email";
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "Type password",
                    labelText: "Password",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.remove_red_eye)),
                validator: (value){
                  if(formValidator.isPasswordValid(value!)){
                    return null;
                  }else{
                    return "Minimum length is 6";
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Forget password",
                textAlign: TextAlign.right,
              ),
              SizedBox(
                height: 30,
              ),
              MaterialButton(
                onPressed: () {
                  if(formKey.currentState!.validate()){
                    formKey.currentState!.save();
                    showSnackBar(context, "Login Successful");
                    Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
                  }
                },
                height: 50,
                color: Colors.teal,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                child: Text(
                  "LOGIN",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Divider(
                color: Colors.black,
                thickness: 1,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  SizedBox(
                    width: 10,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => Register()));
                    },
                    child: Text(
                      "Register Now",
                      style: TextStyle(fontSize: 16, color: Colors.blue),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
