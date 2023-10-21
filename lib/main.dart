import 'package:flutter/material.dart';
import 'package:birthdays_finder/screen/new_id.dart';
import 'package:birthdays_finder/screen/old_id.dart';
import 'package:birthdays_finder/screen/province.dart';
import 'package:flutter/src/material/icons.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: home(), //I use EvatedButton because this type use
    );
  }
}

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            alignment: Alignment.centerRight,
            onPressed: () {},
          ),
        ],
        automaticallyImplyLeading: false,
        title: Text("Home"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(162, 225, 30, 30),
      ),
      body: Center(
        child: Column(
          children: [
            Image(
              image: AssetImage("assets/images/3.jpg"),
              width: 450,
              height: 200,
            ),
            Container(
              width: 300,
              child: Text('Find out someone' "'" 's ID details',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 38,
                    color: Color.alphaBlend(Color.fromARGB(212, 241, 55, 55),
                        Color.fromARGB(255, 22, 61, 191)),
                    fontWeight: FontWeight.bold,
                  )),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                try {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => new_id()),
                  );
                } catch (e) {
                  print(e);
                }
              },
              child: Text(
                'I have New ID Card',
                style: TextStyle(fontSize: 15),
              ),
              style: ElevatedButton.styleFrom(
                foregroundColor: Color.fromARGB(255, 255, 255, 255),
                backgroundColor: Color.fromARGB(197, 218, 31, 31),
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              //button name "I have Old ID card"
              onPressed: () {
                try {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => old_id()),
                  );
                } catch (e) {
                  print(e);
                }
              },
              child: Text(
                'I have Old ID Card',
                style: TextStyle(fontSize: 15),
              ),
              style: ElevatedButton.styleFrom(
                foregroundColor: Color.fromARGB(255, 255, 255, 255),
                backgroundColor: Color.fromARGB(197, 218, 31, 31),
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                try {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => province_data()),
                  );
                } catch (e) {
                  print(e);
                }
              },
              child: Text(
                'Province Of ID Owner',
                style: TextStyle(fontSize: 15),
              ),
              style: ElevatedButton.styleFrom(
                foregroundColor: Color.fromARGB(255, 255, 255, 255),
                backgroundColor: Color.fromARGB(197, 218, 31, 31),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
