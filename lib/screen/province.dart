import 'dart:math';

import 'package:birthdays_finder/main.dart';
import 'package:flutter/material.dart';

class province_data extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: myapps(),
    );
  }
}

class myapps extends StatefulWidget {
  @override
  State<myapps> createState() => _myappsState();
}

class _myappsState extends State<myapps> {
  final _f_2key = GlobalKey<FormState>();
  int provice_n = 0;
  List<String> provincesInSriLanka = [
    "Western Province",
    "Central Province",
    "Southern Province",
    "Northern Province",
    "Eastern Province",
    "North Western Province",
    "North Central Province",
    "Uva Province",
    "Sabaragamuwa Province",
  ];
  String provice_name = ' ?';

  @override
  Widget text1() {
    return Container(
      width: 300,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: TextFormField(
          maxLength: 2,
          decoration: InputDecoration(hintText: 'Enter Province Number'),
          keyboardType: TextInputType.number,
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
          validator: (text) {
            try {
              if (int.parse(text.toString()) > 10 ||
                  (text.toString()).length == 0) {
                return 'You input Province Number is Invalid';
              }
              return null;
            } catch (e) {
              return 'You can input Numbers Only';
            }
          },
          onSaved: (text) {
            try {
              provice_n = int.parse(text.toString());
            } catch (e) {}

            upload_Text();
          },
          onChanged: (text) {
            update_Text();
          },
        ),
      ),
    );
  }

  Widget btn1() {
    return ElevatedButton(
      onPressed: () {
        if (_f_2key.currentState!.validate()) {
          _f_2key.currentState!.save();

          text1();
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

  void update_Text() {
    setState(() {});
    provice_name = ' ?';
  }

  void upload_Text() {
    setState(() {});

    provice_name = provincesInSriLanka[provice_n - 1];
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        title: Text('Province Of ID Owner'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(162, 225, 30, 30),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _f_2key,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Image(
                image: AssetImage("assets/images/image.jpg"),
                width: 450,
                height: 250,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 400,
                child: Text(
                  'Note : Above Picture Rounded Number is Province Number',
                  style: TextStyle(
                      fontSize: 15, color: Color.fromARGB(253, 229, 75, 33)),
                  textAlign: TextAlign.center,
                ),
              ),
              text1(),
              btn1(),
              SizedBox(
                height: 30,
              ),
              Text('ID Owner Belongs To $provice_name',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
