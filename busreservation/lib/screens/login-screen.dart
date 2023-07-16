
import "dart:convert";

import "package:busreservation/screens/home-screen.dart";
import "package:busreservation/screens/sign-up.dart";
import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:busreservation/providers/user-provider.dart';
class LoginScreen extends ConsumerStatefulWidget{

  ConsumerState<LoginScreen> createState(){
    return _LoginScreenState();
  }
}
class _LoginScreenState extends ConsumerState<LoginScreen>{
  bool error=false;
  TextEditingController username=TextEditingController();
  TextEditingController password=TextEditingController();

  void login() async{
    var response=await http.post(Uri.parse("http://192.168.1.5:8080/login"),
    body:jsonEncode({
      "userName":username.text,
      "password":password.text
    }),
    headers: {
      "Content-Type":"application/json"
    }
    );
    if(response.statusCode==200){
      ref.read(userProvider.notifier).setUser(username.text);
      setState(() {
      error=false;
      });
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>HomeScreen()));
    }
    else{
      setState(() {
      error=true;
        
      });
    }
  }

  void dispose(){
    username.dispose();
    password.dispose();
    super.dispose();
  }
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Bus Booking"),
        centerTitle: true,
      ),
      body:Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset("assets/bus.png",height: 200,width: 200,),
                  error?const Text("Invalid Credentials",style:TextStyle(
                    color: Colors.red
                  )):const Text(""),
                  TextField(
                    controller: username,
                    decoration: const InputDecoration(
                      hintText: "username"
                    ),
                  ),
                  TextField(
                    obscureText: true,
                    controller: password,
                    decoration:const InputDecoration(
                      hintText: "password"
                    ),
                  ),
                  const SizedBox(height: 20,),
                  ElevatedButton(onPressed: login, child: Text("Sign In")),
                  TextButton(onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>SignUp()));
                  }, child: const Text("New user?"))
                ],
              ),
            ),
          ),
        ),
      );
  }

}