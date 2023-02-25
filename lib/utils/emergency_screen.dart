import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyContacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Emergency Contacts'),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[100],
      body: Container(
        color: Colors.green.shade100,
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
        child: ListView(
          children: <Widget>[
            Card(
              elevation: 5.0,
              child: ListTile(
                tileColor: Colors.green.shade600,
                hoverColor: Colors.red,
                iconColor: Colors.red,
                title: Text('Medical Facilities'),
                subtitle: Text('123-456-7890'),
                trailing: Icon(Icons.phone),
                onTap: () => launch("tel://1234567890"),
              ),
            ),
            SizedBox(height: 10,),
            Card(
              elevation: 5.0,
              child: ListTile(
                tileColor: Colors.green.shade600,
                iconColor: Colors.red,
                title: Text('Ambulance Services'),
                subtitle: Text('108'),
                trailing: Icon(Icons.phone),
                onTap: () => launch("tel://108"),
              ),
            ),
            SizedBox(height: 10,),
            Card(
              elevation: 5.0,
              child: ListTile(
                tileColor: Colors.green.shade600,
                iconColor: Colors.red,
                title: Text('Police'),
                subtitle: Text('555'),
                trailing: Icon(Icons.phone),
                onTap: () => launch("tel://555"),
              ),
            ),
            SizedBox(height: 10,),
            Card(
              elevation: 5.0,
              child: ListTile(
                tileColor: Colors.green.shade600,
                iconColor: Colors.red,
                title: Text('Fire Department'),
                subtitle: Text('911'),
                trailing: Icon(Icons.phone),
                onTap: () => launch("tel://911"),
              ),
            ),
            SizedBox(height: 10,),
            Card(
              elevation: 5.0,
              child: ListTile(
                tileColor: Colors.green.shade600,
                iconColor: Colors.red,
                title: Text('Janani Shishu Suraksha'),
                subtitle: Text('102'),
                trailing: Icon(Icons.phone),
                onTap: () => launch("tel://102"),
              ),
            ),
            SizedBox(height: 10,),
            Card(
              elevation: 5.0,
              child: ListTile(
                tileColor: Colors.green.shade600,
                iconColor: Colors.red,
                title: Text('Toll-Free Helpline Number for Medical Consultation'),
                subtitle: Text('104'),
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
