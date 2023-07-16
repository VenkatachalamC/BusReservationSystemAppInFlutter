

import 'package:busreservation/models/bookingmodel.dart';
import 'package:flutter/material.dart';
import "package:intl/intl.dart";

class IndvBooking extends StatelessWidget{
  const IndvBooking({super.key,required this.booking});
  final BookingModel booking;
  Widget build(BuildContext context){
    return Card(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(booking.name,style:const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color:Color.fromRGBO(13, 71, 161, 1)
                  ),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  Text("From:${booking.start}",
                  style:const TextStyle(
                    color:Color.fromRGBO(13, 71, 161, 1)
                  )),
                  const SizedBox(width: 20,),
                  Text("To:${booking.end}",
                  style:const TextStyle(
                    color:Color.fromRGBO(13, 71, 161, 1)
                  ))
                  ],),
                  Row(children: [
                  Text(DateFormat("dd-MM-yyyy").format(booking.date),
                  style:const TextStyle(
                    color:Color.fromRGBO(13, 71, 161, 1)
                  ),),
                  ],),
                  Text("Seats Booked:${booking.seats.toString()}",
                  style: const TextStyle(
                    color:Color.fromRGBO(13, 71, 161, 1)
                  ),)
                ],
              ),
              Text("Rs.${booking.cost.round().toString()}",
              style:const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
                color:Color.fromRGBO(13, 71, 161, 1)
              ))
            ],
          ),
      ),
    );
  }
}