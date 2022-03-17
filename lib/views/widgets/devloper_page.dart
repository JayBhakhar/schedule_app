import 'package:flutter/material.dart';

class DevloperPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 75,
              backgroundColor: Colors.teal,
              backgroundImage: NetworkImage(
                'https://sun9-18.userapi.com/impf/A6L45MRzAdy8aImVBH8F7EPfjAZzGQg79WOUQQ/5ZDTwzkUSUc.jpg?size=864x1080&quality=96&sign=364bf394b999d9eb1326e6d67a8d62a3&type=album',
              ),
            ),
            Text(
              'Jay Bhakhar',
              style: TextStyle(
                  fontSize: 50.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'BigShouldersStencilDisplay'),
            ),
            Text(
              'DEVELOPER',
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Mukta'),
            ),
            SizedBox(
              width: 250.0,
              child: Divider(
                height: 25.0,
                color: Colors.black,
              ),
            ),
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: ListTile(
                leading: Icon(Icons.call, size: 20.0, color: Colors.black),
                title: Text(
                  '+7 996 101 1395',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: ListTile(
                leading: Icon(Icons.email, size: 20.0, color: Colors.black),
                title: Text(
                  'jaybhakhar@gmail.com',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
