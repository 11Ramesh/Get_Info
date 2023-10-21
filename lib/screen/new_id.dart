import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:birthdays_finder/main.dart';

class new_id extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: myapp(),
    );
  }
}

class myapp extends StatefulWidget {
  @override
  new_idState createState() => new_idState();
}

class new_idState extends State<myapp> {
  DateTime currentDate = DateTime.now();
  String id_value = '';
  String update_id_value = '';
  String gender_string_value = '';
  String gender = '';
  String month = '';
  String today_year = '';
  String today_month = '';
  String today_day = '';
  List<int> numbers = [31, 60, 91, 121, 152, 182, 213, 244, 274, 305, 335, 366];
  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  int age = 0;
  int gender_value = 0;
  int Year_value = 0;
  int day_value = 0;
  int count = 0;
  final _f_1key = GlobalKey<FormState>();

  void calculation_Text() {
    List<String> id_value_array = id_value.split('');

    for (int i = 0; i < 4; i++) {
      update_id_value = update_id_value + id_value_array[i];
    }

    for (int i = 4; i < 7; i++) {
      gender_string_value = gender_string_value + id_value_array[i];
    }
    gender_value = int.parse(gender_string_value);
    if (gender_value <= 500) {
      gender = 'Male';
      for (int i = 11; i >= 0; i--) {
        day_value = gender_value - numbers[i];
        count++;

        if (day_value > 0) {
          i = 0;
        }
      }
    } else {
      gender = 'Female';
      gender_value = gender_value - 500;
      for (int i = 11; i >= 0; i--) {
        day_value = gender_value - numbers[i];
        count++;

        if (day_value > 0) {
          i = 0;
        }
      }
    }
    List<String> today_date_array = currentDate.toString().split('');
    for (int i = 0; i < 4; i++) {
      today_year = today_year + today_date_array[i];
    }
    for (int i = 5; i < 7; i++) {
      today_month = today_month + today_date_array[i];
    }
    for (int i = 8; i < 10; i++) {
      today_day = today_day + today_date_array[i];
    }

    update_Text();
  }

  void update_Text() {
    try {
      setState(() {
        Year_value = int.parse(update_id_value);
        gender;
        day_value;
        month = months[13 - count];
        age = int.parse(today_year) - Year_value;
        if ((13 - count) > int.parse(today_month)) {
          age--;
        }
        if ((13 - count) == int.parse(today_month)) {
          if (day_value >= int.parse(today_day)) {
            age--;
          }
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void update_Year_Text1() {
    setState(() {
      Year_value = 0;
      gender = '';
      day_value = 00;
      month = '';
      age = 0;
    });
  }

  Widget txt_new_id() {
    //Textbox is
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextFormField(
        maxLength: 12,
        decoration: InputDecoration(hintText: 'Enter ID Card Number'),
        keyboardType: TextInputType.number,
        style: TextStyle(fontSize: 25),
        textAlign: TextAlign.center,
        validator: (text) {
          try {
            int t = text.toString().length;
            if (t <= 11 ||
                int.parse(text.toString()) > 202299999999 ||
                int.parse(text.toString()) < 190099999999) {
              return 'You input ID Card Number is Invalid';
            }
            return null;
          } catch (e) {
            return 'You can input Numbers Only';
          }
        },
        onSaved: (text) {
          id_value = text.toString();
        },
        onChanged: (Text) {
          update_Year_Text1();
        },
      ),
    );
  }

  Widget btn_find() {
    //ElevatedButton name is Find
    return ElevatedButton(
      onPressed: () {
        id_value = '';
        update_id_value = '';
        gender_string_value = '';
        today_year = '';
        today_month = '';
        today_day = '';
        gender = '';
        month = '';
        gender_value = 0;
        Year_value = 0;
        count = 0;
        age = 0;
        if (_f_1key.currentState!.validate()) {
          _f_1key.currentState!.save();

          calculation_Text();
        }
      },
      child: Text("Find", style: TextStyle(fontSize: 16)),
      style: ElevatedButton.styleFrom(
        foregroundColor: Color.fromARGB(255, 255, 255, 255),
        backgroundColor: Color.fromARGB(197, 218, 31, 31),
        padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Id card Number"),
        leading: BackButton(
          onPressed: () {
            try {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => home()),
              );
            } catch (e) {
              print(e);
            }
          },
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(162, 225, 30, 30),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _f_1key,
          child: Column(
            children: <Widget>[
              txt_new_id(),
              btn_find(),
              SizedBox(
                height: 60,
              ),
              Text(
                'Gender : $gender',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.3,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text('Birthday : $month $day_value, $Year_value',
                  style: TextStyle(
                    fontSize: 25,
                    letterSpacing: 1.3,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                height: 40,
              ),
              Text('Your Age : $age',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.3,
                  )),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
