

import 'package:busreservation/providers/user-provider.dart';
import 'package:busreservation/screens/login-screen.dart';
import 'package:busreservation/widgets/bookings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/filter.dart';

class HomeScreen extends ConsumerStatefulWidget{
  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  Widget content=Filter();
  int _currentIndex=0;

  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(title: content is Filter?Text("Bus Booking"):Text("Your Bookings"),
      centerTitle: true,
      automaticallyImplyLeading: false,
      actions: [
        IconButton(onPressed: (){
          ref.read(userProvider.notifier).setUser("");
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>LoginScreen()));
        }, icon: const Icon(Icons.logout))
      ],),
      body:content,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items:const  [
        BottomNavigationBarItem(icon: Icon(Icons.home),label:"Home"),
        BottomNavigationBarItem(icon:Icon(Icons.list),label: "Bookings")
      ],
      onTap: (idx){
        if(idx==0){
          setState(() {
            _currentIndex=idx;
            content=Filter();
          });
        }
        else{
          setState(() {
            _currentIndex=idx;
            content=Bookings();
          });
        }
      },),
    );
  }
}