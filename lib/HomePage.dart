import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {

  DateTime _dateTime = DateTime.now();

  void _showDatePicker(){
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2025)
    ).then((value){
      setState(() {
        _dateTime = value!;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Date Picker Example"),
        centerTitle: true,
      ),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // The 1st Display the DateTime text
                SizedBox(height: 150,),
                Text(
                  DateFormat('yyyy-MM-dd').format(_dateTime),//  date without showing the time (hours, minutes, seconds)
                  style: TextStyle(color: Colors.white),
                ),

                SizedBox(height: 150,),
                Text(_dateTime.toString(),style: TextStyle(color: Colors.white),),//  date with showing the time (hours, minutes, seconds)

                // The 2nd Matarial Button
                SizedBox(height: 170,),
                MaterialButton(
                  onPressed: _showDatePicker,
                  color: Colors.cyan,
                  splashColor: Colors.deepOrangeAccent,
                  child: Text("Choose Date",style: TextStyle(color: Colors.white),),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
