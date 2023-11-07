import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Event {
  final DateTime date;
  final DateTime end;
  final String title;
  final String patient;

  Event({
    required this.date,
    required this.title,
    required this.patient,
    required this.end,
  });

  String getFormattedDateAndTime(DateTime dateTime) {
    final formattedDate = DateFormat('MMMM d, y').format(dateTime);
    final formattedTime = DateFormat('h:mm a').format(dateTime);
    return '$formattedDate $formattedTime';
  }

  @override
  String toString() {
    return 'Title: $title\nPatient: $patient\nDate & Time: ${getFormattedDateAndTime(date)}\nEnd of Session: ${getFormattedDateAndTime(end)}';
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Schedule(),
    );
  }
}

class Schedule extends StatefulWidget {
  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  late final ValueNotifier<List<Event>> _selectedEvents = ValueNotifier([]);
  List<Event> _selectedDayEvents = [];

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
  }

  Stream<List<Event>> fetchAppointmentsStream() {
    return FirebaseFirestore.instance
        .collection('Appointments')
        .where('counselorUID', isEqualTo: _auth.currentUser?.uid)
        .snapshots()
        .asyncMap((querySnapshot) async {
      final appointments = querySnapshot.docs;
      final eventList = <Event>[];
      for (final doc in appointments) {
        final Timestamp timestamp = doc['start'];
        final Timestamp endtimestamp = doc['end'];
        final DateTime dateTime = timestamp.toDate();
        final DateTime enddateTime = endtimestamp.toDate();
        final String title = doc['title'];
        final String patientUID = doc['patient'];
        final String patientFirstName = await getPatientFirstName(patientUID);
        final event = Event(
            date: dateTime,
            title: title,
            patient: patientFirstName,
            end: enddateTime);
        eventList.add(event);
      }
      return eventList;
    });
  }

  Future<String> getPatientFirstName(String patientUID) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('Users')
        .where('UID', isEqualTo: patientUID)
        .get();
    if (snapshot.docs.isNotEmpty) {
      return snapshot.docs[0].get('firstName') as String;
    } else {
      return "Unknown Patient";
    }
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null;
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
        _selectedDayEvents = _getEventsForDay(selectedDay);
      });
    }
  }

  List<Event> _getEventsForDay(DateTime day) {
    return _selectedEvents.value
        .where((event) => isSameDay(event.date, day))
        .toList();
  }

  void _showAddAppointmentDialog(BuildContext context) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    List<String> patientNames = [];

    // Fetch a list of patients for the logged-in counselor
    QuerySnapshot patientsSnapshot = await FirebaseFirestore.instance
        .collection('Users')
        .where('counselorUID', isEqualTo: _auth.currentUser?.uid)
        .get();

    if (patientsSnapshot.docs.isNotEmpty) {
      patientNames = patientsSnapshot.docs
          .map((doc) => doc.get('firstName') as String)
          .toList();
    } else {
      // Handle the case where there are no patients for the counselor
      // You can show an error message or handle it as needed.
    }

    String selectedPatient = patientNames.isNotEmpty ? patientNames[0] : "";
    DateTime selectedStartDate = DateTime.now();
    DateTime selectedEndDate = DateTime.now();

    DateTime? startDate = await showDatePicker(
      context: context,
      initialDate: selectedStartDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2023, 12, 31),
    );

    if (startDate != null) {
      TimeOfDay? startTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(selectedStartDate),
      );

      if (startTime != null) {
        selectedStartDate = DateTime(startDate.year, startDate.month,
            startDate.day, startTime.hour, startTime.minute);
      }
    }

    DateTime? endDate = await showDatePicker(
      context: context,
      initialDate: selectedEndDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2023, 12, 31),
    );

    if (endDate != null) {
      TimeOfDay? endTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(selectedEndDate),
      );

      if (endTime != null) {
        selectedEndDate = DateTime(endDate.year, endDate.month, endDate.day,
            endTime.hour, endTime.minute);
      }
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add New Appointment'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // Patient Dropdown
              DropdownButton<String>(
                value: selectedPatient, // Set the selected patient here
                onChanged: (String? newValue) {
                  setState(() {
                    selectedPatient = newValue!;
                  });
                },
                items: patientNames.map((String patientName) {
                  return DropdownMenuItem<String>(
                    value: patientName,
                    child: Text(patientName),
                  );
                }).toList(),
              ),

              // Title Text Field
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
              ),

              // Start Date and Time
              Text(
                  'Selected Start Date and Time: ${DateFormat('MMMM d, y h:mm a').format(selectedStartDate)}'),

              // End Date and Time
              Text(
                  'Selected End Date and Time: ${DateFormat('MMMM d, y h:mm a').format(selectedEndDate)}'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Handle adding the new appointment here using the selected values
                // You can access selectedPatient, the title, selectedStartDate, and selectedEndDate.
                // Don't forget to close the dialog.
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
            TextButton(
              onPressed: () {
                // Close the dialog without adding a new appointment.
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5E9CF),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xffF5E9CF),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              StreamBuilder<List<Event>>(
                stream: fetchAppointmentsStream(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    _selectedEvents.value = snapshot.data!;
                    return TableCalendar<Event>(
                      firstDay: DateTime(2023),
                      lastDay: DateTime(2023, 12, 31),
                      focusedDay: _focusedDay,
                      selectedDayPredicate: (day) =>
                          isSameDay(_selectedDay, day),
                      calendarFormat: _calendarFormat,
                      startingDayOfWeek: StartingDayOfWeek.monday,
                      calendarStyle: CalendarStyle(
                        outsideDaysVisible: false,
                      ),
                      onDaySelected: _onDaySelected,
                      onPageChanged: (focusedDay) {
                        _focusedDay = focusedDay;
                      },
                      eventLoader: (day) {
                        return _selectedEvents.value
                            .where((event) => isSameDay(event.date, day))
                            .toList();
                      },
                      calendarBuilders: CalendarBuilders(
                        markerBuilder: (context, day, events) {
                          final eventCount = events.length;
                          if (eventCount == 0) {
                            return null;
                          } else if (eventCount == 1) {
                            return CircleAvatar(
                              radius: 5,
                              backgroundColor: Colors.blue,
                            );
                          } else {
                            return CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.red,
                              child: Text(
                                '$eventCount',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
              if (_selectedDayEvents.isNotEmpty)
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: _selectedDayEvents.map((event) {
                        return Card(
                          margin: const EdgeInsets.all(16),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.blue, width: 1.0),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Event for Selected Day:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    event.toString(),
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
            ],
          ),
          Positioned(
            bottom: 16.0,
            right: 16.0,
            child: FloatingActionButton(
              onPressed: () {
                _showAddAppointmentDialog(context);
              },
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
