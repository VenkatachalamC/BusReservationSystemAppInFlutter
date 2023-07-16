
import 'package:flutter/material.dart';


class Seat extends StatefulWidget{
  const Seat({super.key,required this.seatNumber,required this.addSeat,required this.removeSeat,required this.bookedSeats});
  final int seatNumber;
  final List<int> bookedSeats;
  final Function (int) addSeat;
  final Function (int) removeSeat;
  State<Seat> createState(){
    return _SeatState(seatNumber:seatNumber,addSeat:addSeat,removeSeat:removeSeat,bookedSeats:bookedSeats);
  }
}

class _SeatState extends State<Seat>{
  _SeatState({required this.seatNumber,required this.addSeat,required this.removeSeat,required this.bookedSeats});
  final Function (int) addSeat;
  final Function (int) removeSeat;
  final int seatNumber;
  List<int> bookedSeats;
  Color color=Colors.green;
  void initState(){
  }
  Widget build(BuildContext context){
    if(!bookedSeats.contains(seatNumber)){
    return Container(
    margin: EdgeInsets.all(10),
    child: GestureDetector(
      onTap: (){
        setState(() {
          if(color==Colors.green){
            addSeat(seatNumber);
          }else{
            removeSeat(seatNumber);
          }
          color=color==Colors.green?Colors.yellow:Colors.green;
        });
      },
      
      child: SizedBox(
        height: 30,
        width: 30,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: color
          ),
          child:Center(child: Text(seatNumber.toString(),))
        ),
      ),
    ),
  );
  }
  else{
    return Container(
    margin: EdgeInsets.all(10),
    child: GestureDetector(
      onTap: null,
      child: SizedBox(
        height: 30,
        width: 30,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.red
          ),
          child:Center(child: Text(seatNumber.toString(),))
        ),
      ),
    ),
  );

  }
  }
}
