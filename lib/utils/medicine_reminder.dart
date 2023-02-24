import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Medicine_Reminder extends StatefulWidget {
  const Medicine_Reminder({Key? key}) : super(key: key);

  @override
  State<Medicine_Reminder> createState() => _Medicine_ReminderState();
}

class _Medicine_ReminderState extends State<Medicine_Reminder> {
  List<MedicineReminder> reminders = [];

  @override
  void initState() {
    super.initState();
    loadReminders();
    initializeNotifications();
  }

  void loadReminders() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> reminderStrings = prefs.getStringList('reminders') ?? [];
    List<MedicineReminder> loadedReminders = [];
    reminderStrings.forEach((reminderString) {
      List<String> parts = reminderString.split('|');
      loadedReminders.add(MedicineReminder(
        name: parts[0],
        dose: parts[1],
        time: TimeOfDay(
          hour: int.parse(parts[2].split(':')[0]),
          minute: int.parse(parts[2].split(':')[1]),
        ),
      ));
    });
    setState(() {
      reminders = loadedReminders;
    });
  }

  void initializeNotifications() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    final InitializationSettings initializationSettings =
    InitializationSettings(
        android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void addReminder(BuildContext context) async {
    MedicineReminder newReminder = await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => AddReminderPage()),
    );
    if (newReminder != null) {
      setState(() {
        reminders.add(newReminder);
      });
      saveReminders();
      scheduleReminder(newReminder);
    }
  }

  void saveReminders() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> reminderStrings = reminders.map((reminder) {
      return '${reminder.name}|${reminder.dose}|${reminder.time.hour.toString().padLeft(2, '0')}:${reminder.time.minute.toString().padLeft(2, '0')}';
    }).toList();
    prefs.setStringList('reminders', reminderStrings);
  }

  void scheduleReminder(MedicineReminder reminder) async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'medicine_reminder',
      'Medicine Reminder\nReminds you to take your medicine',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
    );
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics);
    DateTime now = DateTime.now();
    DateTime scheduledTime = DateTime(
      now.year,
      now.month,
      now.day,
      reminder.time.hour,
      reminder.time.minute,
      0,
    );
    if (scheduledTime.isBefore(now)) {
      scheduledTime = scheduledTime.add(Duration(days: 1));
    }
    await flutterLocalNotificationsPlugin.schedule(
      reminder.hashCode,
      'Time to take ${reminder.name}',
      'Take ${reminder.dose} dose',
      scheduledTime,
      platformChannelSpecifics,
    );
  }
  void deleteReminder(MedicineReminder reminder) {
    setState(() {
      reminders.remove(reminder);
    });
    cancelReminder(reminder);
    saveReminders();
  }

  void cancelReminder(MedicineReminder reminder) async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin.cancel(reminder.hashCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade400,
        leading: BackButton(
          onPressed: (){
            // TODO: Implement the navigation here
          },
        ),
        centerTitle: true,
        title: Text('Medicine Reminder'),
      ),
      body: Container(
        color: Color.fromRGBO(250, 234, 239, 1),
        child: ListView.builder(
          itemCount: reminders.length,
          itemBuilder: (context, index) {
            MedicineReminder reminder = reminders[index];
            return Padding(
              padding: const EdgeInsets.only(left: 10,right: 10, top: 10, bottom: 15),
              child: Material(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                color: Color.fromRGBO(252, 198, 217, 50),
                elevation: 20,
                shadowColor: Colors.pink.shade300,
                child: ListTile(
                  contentPadding: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
                  iconColor: Colors.red,
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(reminder.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,)
                    ],
                  ),
                  subtitle: Text('Take ${reminder.dose} at ${reminder.time.format(context)}',
                    style: TextStyle(fontSize:15, fontWeight: FontWeight.w500,color: Colors.black),),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    // onPressed: () =>
                    onPressed: (){
                      showDialog(
                          context: context,
                          builder: (ctx) => Container(
                            padding: EdgeInsets.all(20),
                            child: Center(
                              child: AlertDialog(
                                title: const Text("Delete reminder ?", textAlign: TextAlign.center,),
                                content: const Text("Are you sure that you want to delete this reminder ?",textAlign: TextAlign.center,),
                                actions: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(ctx).pop();
                                        },
                                        child: const Text("CANCEL"),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          deleteReminder(reminder);
                                          Navigator.of(ctx).pop();
                                        },
                                        child: const Text("DELETE",style: TextStyle(color: Colors.red),),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                      );
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: FloatingActionButton(
          backgroundColor: Colors.pink.shade400,
          shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.zero
          ),
          onPressed: () => addReminder(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Add a medicine reminder"),
              SizedBox(width: 20,),
              Icon(Icons.add)
            ],),
        ),
      ),
      // floatingActionButton: ,
    );
  }
}


class AddReminderPage extends StatefulWidget {
  @override
  _AddReminderPageState createState() => _AddReminderPageState();
}

class _AddReminderPageState extends State<AddReminderPage> {
  String? _name;
  String? _dose;
  TimeOfDay _time = TimeOfDay(hour: 0, minute: 0);

  void _selectTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (pickedTime != null) {
      setState(() {
        _time = pickedTime;
      });
    }
  }

  void _saveReminder(BuildContext context) {
    if (_name != null && _dose != null) {
      Navigator.of(context).pop(MedicineReminder(
        name: _name!,
        dose: _dose!,
        time: _time,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        backgroundColor: Colors.pink.shade400,
        title: Text('Add Reminder'),
        centerTitle: true,
      ),
      body: Container(
        color: Color.fromRGBO(250, 234, 239, 1),
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Medicine Name',
                    hintText: 'Enter the Medicine Name'
                ),
                onChanged: (value) => setState(() => _name = value),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Dose',
                    hintText: 'Enter the dose'
                ),
                onChanged: (value) => setState(() => _dose = value),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.access_time_filled),
                  SizedBox(width: 10,),
                  Text('Time: ${_time.format(context)}'),
                  SizedBox(width: 10,),
                  ElevatedButton(
                    onPressed: () => _selectTime(context),
                    child: Text('Select Time'),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.pink.shade400),
                  ),
                ],
              ),
              SizedBox(height: 30.0),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () => _saveReminder(context),
                    child: Text('Save'),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.pink.shade400,),
                  ),
                ),
              )],
          ),
        ),
      ),
    );
  }
}

class MedicineReminder {
  String name;
  String dose;
  TimeOfDay time;

  MedicineReminder({
    required this.name,
    required this.dose,
    required this.time,});
}

