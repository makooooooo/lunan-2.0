import 'package:flutter/material.dart';
import 'package:lunan/Patient/MenuList/menulist.dart';
import 'package:lunan/Therapist/HomePage/Assignment/turnedin_assignment.dart';

class AssignedTasksInfo extends StatefulWidget {
  final String selectedPatientUID;
  final Map<String, dynamic>? formData;
  final String documentId;

  const AssignedTasksInfo({
    Key? key,
    required this.selectedPatientUID,
    this.formData,
    required this.documentId,
  }) : super(key: key);

  @override
  State<AssignedTasksInfo> createState() => _AssignedTasksInfoState();
}

class _AssignedTasksInfoState extends State<AssignedTasksInfo> {
  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  TextEditingController textEditingController3 = TextEditingController();
  bool isEditing = false;
  @override
  Widget build(BuildContext context) {
    // Retrieve the task details based on the documentId from Firestore
    // You can use this information to display the task details
    final taskTitle = widget.formData?['Activity'] ?? 'N/A';
    final taskDescription = widget.formData?['Description'] ?? 'N/A';
    final taskDueDate = widget.formData?['Deadline'] ?? 'N/A';

    return Scaffold(
      backgroundColor: const Color(0xffF5E9CF),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xffF5E9CF),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Color(0xff4D455D),
        ),
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: 400,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xff7DB9B6),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Container(
                      margin: const EdgeInsets.only(top: 5),
                      child: const Text(
                        'Assigned Task',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                  margin: const EdgeInsets.fromLTRB(10, 15, 10, 20),
                  decoration: BoxDecoration(
                    color: const Color(0xff4D455D),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        decoration: BoxDecoration(
                          color: Color(0xffF5E9CF),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        // Display task details here
                        child: Align(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    width: 80,
                                    child: Text(
                                      'Task Title : ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 200,
                                    padding: const EdgeInsets.only(
                                        left: 10, bottom: 10),
                                    child: TextField(
                                      enabled:
                                          isEditing, // Enable or disable the TextField
                                      controller: textEditingController1,
                                      decoration: const InputDecoration(
                                        hintText: 'Enter text',
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 10.0),
                                        border: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey, width: 2.0),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xff4D455D),
                                              width: 2.0),
                                        ),
                                      ),
                                      style: TextStyle(fontSize: 15),
                                      maxLines: 1,
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    width: 80,
                                    child: Text(
                                      'Description : ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 200,
                                    padding: const EdgeInsets.only(
                                        left: 10, bottom: 10),
                                    child: TextField(
                                      enabled:
                                          isEditing, // Enable or disable the TextField
                                      controller: textEditingController2,
                                      decoration: InputDecoration(
                                        hintText: 'Enter text',
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 10.0),
                                        border: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey, width: 2.0),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: const Color(0xff4D455D),
                                              width: 2.0),
                                        ),
                                      ),
                                      style: TextStyle(fontSize: 15),
                                      maxLines: 1,
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    width: 80,
                                    child: Text(
                                      'Due Date : ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 200,
                                    padding: const EdgeInsets.only(
                                        left: 10, bottom: 10),
                                    child: TextField(
                                      enabled:
                                          isEditing, // Enable or disable the TextField
                                      controller: textEditingController3,
                                      decoration: InputDecoration(
                                        hintText: 'Enter text',
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 10.0),
                                        border: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey, width: 2.0),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: const Color(0xff4D455D),
                                              width: 2.0),
                                        ),
                                      ),
                                      style: TextStyle(fontSize: 15),
                                      maxLines: 1,
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 80,
                          margin: const EdgeInsets.fromLTRB(120, 10, 10, 10),
                          height: 30,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TurendInAssignment(
                                            selectedPatientUID:
                                                widget.selectedPatientUID,
                                          )),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 211, 34, 87),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      15), // Set the corner radius here
                                ),
                              ),
                              child: const Text(
                                'Back',
                              )),
                        ),
                        Container(
                            width: 100,
                            margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            height: 30,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (isEditing) {
                                    // Save action
                                    // Implement your save logic here
                                    // After saving, you can disable editing
                                    isEditing = false;
                                  } else {
                                    // Edit action
                                    // Enable editing
                                    isEditing = true;
                                  }
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 19, 195, 122),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      15), // Set the corner radius here
                                ),
                              ),
                              child: Text(isEditing ? 'Save' : 'Edit'),
                            )),
                      ],
                    ),
                  ]),
                )),
              ],
            )),
      )),
    );
  }
}
