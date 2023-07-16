

import 'dart:convert';

import 'package:busreservation/models/busmodel.dart';
import 'package:busreservation/screens/busSeat.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class Bus extends StatelessWidget{
  Bus({super.key,required this.bus});
  final BusModel bus;
  Widget build(BuildContext context){
    return InkWell(
      onTap: ()async{
        var response=await http.get(Uri.parse("http://192.168.1.5:8080/getbookedseats/${bus.busname}/${bus.startTime.toString()}"));
        print(response.body);
        if(response.statusCode==200){
        var res=jsonDecode(response.body);
        List<int> tmp=[];
        res['bookedSeats'].forEach((e){
          tmp.add(e);
        });
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>BusSeat(bus: bus,bookedSeats:tmp,)));
        }
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: ListTile(
            leading: Image.network("http://192.168.1.5:8080/thumbnail/${bus.busname}",height: 100,width:100,fit:BoxFit.fill),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(bus.busname,
              style:const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w400,
                color:Color.fromRGBO(13, 71, 161, 1) 
              )),
              Text("From: "+bus.start,
              style: TextStyle(
                color: Color.fromRGBO(13, 71, 161, 1)
              ),),
              const SizedBox(width: 20,),
              Text("To: "+bus.end,style: TextStyle(
                color: Color.fromRGBO(13, 71, 161, 1)
              )),
              Text(DateFormat("dd-MM-yyyy").format(bus.startTime).toString(),style: TextStyle(
                color: Color.fromRGBO(13, 71, 161, 1)
              ))
            ]),
            trailing: Text("Rs.${bus.price.round().toString()}",
            style:const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w900,
              color:Color.fromRGBO(13, 71, 161, 1)
            )),
          ),
        ),
      ),
    );
  }
}