

import 'package:busreservation/models/busmodel.dart';
import 'package:busreservation/screens/home-screen.dart';
import 'package:flutter/material.dart';

class ConfirmBooking extends StatelessWidget{
  const ConfirmBooking({super.key,required this.bus,required this.totalprice,required this.selectedSeats});
  final BusModel bus;
  final double totalprice;
  final List<int> selectedSeats;

  Widget build(BuildContext context){
    return Scaffold(
      body:Center(
        child: Padding(padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text("Booking Successfull",style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.red
              ),),
            Icon(Icons.celebration,color: Colors.red,size: 50,)
            ],),
            SizedBox(height: 20,),
            Text("Bus Name : ${bus.busname}",
            style:const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color:Color.fromRGBO(13, 71, 161, 1)
            )),
            SizedBox(height: 20,),
            Text("From : ${bus.start}",
            style:const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color:Color.fromRGBO(13, 71, 161, 1)
            )),
            SizedBox(height: 20,),
            Text("To : ${bus.end}",
            style:const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color:Color.fromRGBO(13, 71, 161, 1)
            )),
            SizedBox(height: 20,),
            Text("Seats : ${selectedSeats.length} ${selectedSeats.toString()}",
            style:const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color:Color.fromRGBO(13, 71, 161, 1)
            )),
            SizedBox(height: 20,),
            Text("Total Cost : ${totalprice}",
            style:const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color:Color.fromRGBO(13, 71, 161, 1)
            )),
            SizedBox(height: 20,),
            ElevatedButton.icon(onPressed: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>HomeScreen()));
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Booking successfull")));
            }, icon: Icon(Icons.confirmation_num), label: Text("OK"))
          ],
        ),),
      )
    );
  }
}