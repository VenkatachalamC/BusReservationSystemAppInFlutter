import 'dart:convert';

import 'package:busreservation/models/busmodel.dart';
import 'package:busreservation/providers/user-provider.dart';
import 'package:busreservation/screens/confirm-booking.dart';
import 'package:busreservation/screens/home-screen.dart';
import 'package:busreservation/widgets/bookings.dart';
import 'package:busreservation/widgets/seat-contents.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BusSeat extends ConsumerStatefulWidget {
  const BusSeat({super.key, required this.bus,required this.bookedSeats});
  final BusModel bus;
  final List<int> bookedSeats;
  @override
  ConsumerState<BusSeat> createState() => _BusSeatState(bus: bus,bookedSeats: bookedSeats);
}

//add seat details in initState here..
class _BusSeatState extends ConsumerState<BusSeat> {
  _BusSeatState({required this.bus,required this.bookedSeats});
  final BusModel bus;
  List<int> bookedSeats;
  List<int> selectedSeats = [];
  double totalprice = 0;
  void addSeat(seatnum) {
    setState(() {
      totalprice += bus.price;
      selectedSeats.add(seatnum);
    });
  }

  void removeSeat(seatnum) {
    setState(() {
      selectedSeats.remove(seatnum);
      totalprice -= bus.price;
    });
  }

  void bookSeats() async{
    var response=await http.post(Uri.parse("http://192.168.1.5:8080/bookseats/${bus.busname}/${bus.startTime.toString()}"),body:jsonEncode({
      "selectedSeats":selectedSeats,
      "username":ref.read(userProvider.notifier).getUser(),
      "busName":bus.busname,
      "start":bus.start,
      "end":bus.end,
      "date":bus.startTime.toString(),
      "price":totalprice,
      "seats":selectedSeats.length
    }),headers: {
      "Content-Type":"application/json"
    });
    if(response.statusCode==200){
    print(selectedSeats);
    print(totalprice.toString());
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>ConfirmBooking(bus:bus,selectedSeats:selectedSeats,totalprice:totalprice)));
    }
  }

  Widget build(BuildContext context) {
    List<int> col1 = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19];
    List<int> col2 = [2, 4, 6, 8, 10, 12, 14, 16, 18, 20];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.bus.busname,
        style:TextStyle(
          color: Colors.white
        )),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin:const EdgeInsets.only(top: 50),
            child: const Text(
              "Select Seats",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  ...List.generate(
                      10,
                      (i) => Seat(
                          seatNumber: col1[i],
                          addSeat: addSeat,
                          removeSeat: removeSeat,
                          bookedSeats:bookedSeats))
                ],
              ),
              Column(
                children: [
                  ...List.generate(
                      10,
                      (i) => Seat(
                          seatNumber: col2[i],
                          addSeat: addSeat,
                          removeSeat: removeSeat,
                          bookedSeats:bookedSeats))
                ],
              ),
              const SizedBox(
                width: 50,
              ),
              Column(
                children: [
                  ...List.generate(
                      10,
                      (i) => Seat(
                          seatNumber: col1[i] + 20,
                          addSeat: addSeat,
                          removeSeat: removeSeat,
                          bookedSeats:bookedSeats))
                ],
              ),
              Column(
                children: [
                  ...List.generate(
                      10,
                      (i) => Seat(
                          seatNumber: col2[i] + 20,
                          addSeat: addSeat,
                          removeSeat: removeSeat,
                          bookedSeats:bookedSeats))
                ],
              )
            ],
          ),
          //add book request here..
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton.icon(
              //change after api creation..
              onPressed: bookSeats, icon: Icon(Icons.book_online),
              label: Text("Book Now(${selectedSeats.length})"),
            ),
          )
        ],
      ),
    );
  }
}
