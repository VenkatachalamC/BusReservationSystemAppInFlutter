
import 'package:busreservation/screens/buslist.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class Filter extends StatefulWidget{
  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  late String start="chennai",end="chennai";
  String error="";
  DateTime? date;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Card(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                //const SizedBox(height: 200,),
                Text(error,style:const TextStyle(
                  color:Colors.red
                )),
                const Text("From"),
                DropdownButton(
                  value: start,
                  items:const [
                  DropdownMenuItem(value: "chennai",child:Text("Chennai"),),
                  DropdownMenuItem(value: "coimbatore",child: Text("Coimbatore"),),
                  DropdownMenuItem(value: "Madurai",child: Text("Madurai"),)
                ], onChanged: (val){
                  setState(() {
                    start=val!;
                  });
                  
                }),
                const Text("To"),
                DropdownButton(
                  value: end,
                  items:const [
                  DropdownMenuItem(value:"chennai",child:Text("Chennai"),),
                  DropdownMenuItem(value: "coimbatore",child: Text("Coimbatore"),),
                  DropdownMenuItem(value: "Madurai",child: Text("Madurai"),)
                ], onChanged: (val){
                  setState(() {
                  end=val!; 
                  });
                }),
                TextButton.icon(onPressed: ()async{
                  DateTime? pickedDate=await showDatePicker(context: context, initialDate:DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime.now().add(Duration(days: 30)));
                  if(pickedDate!=null){
                    setState(() {
                      date=pickedDate;
                    });
                  }
                  
                }, icon: Icon(Icons.date_range), label:date==null?Text("select date"):Text(DateFormat("dd-MM-yyyy").format(date!).toString())),
                //send start and end location to next screen for get request.
                ElevatedButton(onPressed: (){
                  if(date!=null){
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>BusList(start: start,end:end,date:date!)));
                  }
                  else{
                    setState(() {
                      error="Date Can't be empty";
                    });
                  }
                }, child: const Text("Search Bus"))
              ]),
            ),
          ),
        ),
    );
  }
}