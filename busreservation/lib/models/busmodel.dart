
enum Routes{
  chennai,
  madurai,
  coimbatore
}


class BusModel{
  const BusModel({required this.busname,required this.start,required this.end,required this.startTime,required this.price});
  final String busname;
  final String start;
  final String end;
  final DateTime startTime;
  final double price;
}