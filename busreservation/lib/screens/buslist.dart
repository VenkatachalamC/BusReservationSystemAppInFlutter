

import 'dart:convert';
import 'dart:io';
import 'package:busreservation/models/busmodel.dart';
import 'package:busreservation/widgets/bus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BusList extends StatefulWidget{
  BusList({super.key,required this.start,required this.end,required this.date});
  //use to get bus list in init state.
  String start,end;
  DateTime date;

  @override
  State<BusList> createState() =>  _BusListState(start: start,end: end,date:date);
}

class _BusListState extends State<BusList> {
  _BusListState({required this.start,required this.end,required this.date});
  String start,end;
  DateTime date;
  late List<BusModel> busses=[];

  void getApi()async{
  var url=Uri.parse("http://192.168.1.5:8080/busses/$start/$end");
    var response=await http.get(url);
    List res=jsonDecode(response.body);
    if(response.statusCode==200){
      List<BusModel> tmp=[];
      res.forEach((e) {
        tmp.add(BusModel(busname: e["busName"], start: e["start"], end: e["end"], startTime: date, price: e["price"].toDouble()));
      });
      setState(() {
      busses=tmp;
      });
    }

  }
  @override
  void initState() {
    getApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text("Bus List"),
      automaticallyImplyLeading:false ,
      centerTitle: true,),
      body:ListView.builder(itemCount: busses.length,itemBuilder: (ctx,i)=>Bus(bus: busses[i]),),
    );
  }
}