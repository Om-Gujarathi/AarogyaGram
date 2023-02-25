import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vjti/Colors/color.dart';

class EmergencyContacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kDarkBlue,
        title: Text(
          'Emergency Contacts',
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[100],
      body: Container(
        // color: Colors.green.shade100,
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
        child: ListView(
          children: <Widget>[
            Card(
              elevation: 5.0,
              child: ListTile(
                tileColor: kLighterGreen,
                hoverColor: Colors.red,
                iconColor: Colors.red,
                title: Text('Medical Facilities',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                subtitle: Text('123-456-7890', style: TextStyle(fontSize: 15)),
                trailing: Icon(Icons.phone),
                onTap: () => launch("tel://1234567890"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              elevation: 5.0,
              child: ListTile(
                tileColor: kLighterGreen,
                iconColor: Colors.red,
                title: Text('Ambulance Services',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                subtitle: Text('108', style: TextStyle(fontSize: 15)),
                trailing: Icon(Icons.phone),
                onTap: () => launch("tel://108"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              elevation: 5.0,
              child: ListTile(
                tileColor: kLighterGreen,
                iconColor: Colors.red,
                title: Text('Police',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                subtitle: Text('100', style: TextStyle(fontSize: 15)),
                trailing: Icon(Icons.phone),
                onTap: () => launch("tel://100"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              elevation: 5.0,
              child: ListTile(
                tileColor: kLighterGreen,
                iconColor: Colors.red,
                title: Text('Fire Department',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                subtitle: Text('911', style: TextStyle(fontSize: 15)),
                trailing: Icon(Icons.phone),
                onTap: () => launch("tel://911"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              elevation: 5.0,
              child: ListTile(
                tileColor: kLighterGreen,
                iconColor: Colors.red,
                title: Text('Janani Shishu Suraksha',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                subtitle: Text('102', style: TextStyle(fontSize: 15)),
                trailing: Icon(Icons.phone),
                onTap: () => launch("tel://102"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              elevation: 5.0,
              child: ListTile(
                tileColor: kLighterGreen,
                iconColor: Colors.red,
                title: Text(
                    'Toll-Free Helpline Number for Medical Consultation',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                subtitle: Text(
                  '104',
                  style: TextStyle(fontSize: 15),
                ),
                trailing: Icon(Icons.phone),
                onTap: () => launch("tel://104"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
