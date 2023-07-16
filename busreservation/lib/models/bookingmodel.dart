

import 'package:busreservation/models/busmodel.dart';

class BookingModel{
  const BookingModel({
    required this.name,
    required this.start,
    required this.end,
    required this.date,
    required this.cost,
    required this.seats
  });
  final String name;
  final String start;
  final String end;
  final DateTime date;
  final double cost;
  final int seats;
}