import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lunan/Therapist/HomePage/ViewPatient/patient_info.dart';
import 'package:lunan/Therapist/HomePage/chat.dart';
import 'package:lunan/Therapist/MenuList/menulist.dart';

class IntakeForm extends StatefulWidget {
  final Map<String, dynamic>? data;
  final String selectedPatientUID;


  const IntakeForm({
    Key? key,
    this.data,
    required this.selectedPatientUID,
  }) : super(key: key);

  @override
  _IntakeFormState createState() => _IntakeFormState();
}

class _IntakeFormState extends State<IntakeForm> {
  bool _isCheckedmale = false;
  bool _isCheckedfemale = false;
  bool _isCheckedothers = false;
  late DateTime now;
  late String formattedDate;

  TextEditingController cellPhoneController = TextEditingController();
  TextEditingController allergiesController = TextEditingController();
  TextEditingController allergyListController = TextEditingController();
  TextEditingController sexualPrefController = TextEditingController();
  TextEditingController maritalStatusController = TextEditingController();
  TextEditingController therapyStatusController = TextEditingController();
  TextEditingController currPyschMedsController = TextEditingController();
  TextEditingController contactPersonNameController = TextEditingController();
  TextEditingController suicidalThoughtsController = TextEditingController();
  TextEditingController suicidalThoughtsPastController = TextEditingController();
  TextEditingController suicidalThoughtsPastTimeController = TextEditingController();
  TextEditingController currentHomicidalController = TextEditingController();
  TextEditingController pastHomicidalController = TextEditingController();
  TextEditingController pastHomicidalTimeController = TextEditingController();
  TextEditingController currentPhysHealthController = TextEditingController();
  TextEditingController lastPhysExamController = TextEditingController();
  TextEditingController chronicIllController = TextEditingController();
  TextEditingController maintMedsController = TextEditingController();
  TextEditingController alcoholIntController = TextEditingController();
  TextEditingController drugUseController = TextEditingController();
  TextEditingController drugUseSelController = TextEditingController();
  TextEditingController smokeSelController = TextEditingController();
  TextEditingController smokeDailyController = TextEditingController();
  TextEditingController headInjController = TextEditingController();
  TextEditingController signChanController = TextEditingController();
  TextEditingController depressedMoodNowSelController = TextEditingController();
  TextEditingController depressedMoodNowRatController = TextEditingController();
  TextEditingController anxSelController = TextEditingController();
  TextEditingController anxRatingNowController = TextEditingController();
  TextEditingController phobiasSelNowController = TextEditingController();
  TextEditingController phobiasRatNowController = TextEditingController();
  TextEditingController halluSelNowController = TextEditingController();
  TextEditingController halluRatNowController = TextEditingController();
  TextEditingController sexualAbuseSelNowController = TextEditingController();
  TextEditingController sexualAbuseRatNowController = TextEditingController();
  TextEditingController physicalAbueSelNowController = TextEditingController();
  TextEditingController physicalAbuseRatNowController = TextEditingController();
  TextEditingController emotionalAbuseRatNowController = TextEditingController();
  TextEditingController emotionalAbuseSelNowController = TextEditingController();

  @override
  void initState() {
    super.initState();
    now = DateTime.now();
    formattedDate = DateFormat('yyyy / MM / dd').format(now);
    fetchDataFromFirestore();
  }
    Future<void> fetchDataFromFirestore() async {
    try {
      // Replace 'intakeforms' with your Firestore collection name
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('IntakeForms')
          .where('UID', isEqualTo: widget.selectedPatientUID)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Assuming only one document will match the query
        final DocumentSnapshot doc = querySnapshot.docs[0];

        // Populate text fields with data from Firestore
        setState(() {
          cellPhoneController.text = doc['CPNum'];
          allergiesController.text = doc['AllergiesSel'];
          allergyListController.text = doc['AllergyList'];
          sexualPrefController.text = doc['SexualPref'];
          maritalStatusController.text = doc['MaritalStatus'];
          therapyStatusController.text = doc['TherapyStatus'];
          currPyschMedsController.text = doc['CurrPsychMeds'];
          contactPersonNameController.text = doc['CPFname'];
          suicidalThoughtsController.text = doc['SuicidalThoughts'];
          suicidalThoughtsPastController.text = doc['SuicidalThoughtsPast'];
          suicidalThoughtsPastTimeController.text = doc['SuicidalThoughtsPastTime'];
          currentHomicidalController.text = doc['CurrentHomicidal'];
          pastHomicidalController.text = doc['HadPreviousHomicide'];
          pastHomicidalTimeController.text = doc['PastHomicidalTime'];
          currentPhysHealthController.text = doc['currentPhysicalHealth'];
          lastPhysExamController.text = doc['LastPhysicalExam'];
          chronicIllController.text = doc['ChronicIll'];
          maintMedsController.text = doc['MaintMeds'];
          alcoholIntController.text = doc['alcoholSubstanceAbueRatingNow'];
          drugUseController.text = doc['DrugUse'];
          drugUseSelController.text = doc['DrugUseSel'];
          smokeSelController.text = doc['SmokeSel'];
          smokeDailyController.text = doc['CiggDaily'];
          headInjController.text = doc['HeadInjDef'];
          signChanController.text = doc['SignChanSel'];
          depressedMoodNowSelController.text = doc['depressedMoodNowSel'];
          depressedMoodNowRatController.text = doc['depressendMoodRatingNow'];
          anxSelController.text = doc['AnxietySel'];
          anxRatingNowController.text = doc ['anxRatingNowController'];
          phobiasRatNowController.text = doc ['phobiasRatingNow'];
          phobiasSelNowController.text = doc ['phobiasSelNow'];
          halluSelNowController.text = doc ['hallucinationsSelNow'];
          halluRatNowController.text = doc ['hallucinationsRatingNow'];
          sexualAbuseSelNowController.text = doc ['sexualAbueSelNow'];
          sexualAbuseRatNowController.text = doc ['sexualAbuseRatingNow'];
          physicalAbueSelNowController.text = doc ['physicalAbuseSelNow'];
          physicalAbuseRatNowController.text = doc ['physicalAbueRatingNow'];
          emotionalAbuseSelNowController.text = doc ['emotionalAbuseSelNow'];
          emotionalAbuseRatNowController.text = doc ['emotionalAbuseRatingNow'];
        });
      }
    } catch (error) {
      print('Error fetching data from Firestore: $error');
    }
  }

  @override
  void dispose() {
    // Dispose of the controllers when the widget is disposed
    cellPhoneController.dispose();
    allergiesController.dispose();
    allergyListController.dispose();
    sexualPrefController.dispose();
    maritalStatusController.dispose();
    therapyStatusController.dispose();
    currPyschMedsController.dispose();
    contactPersonNameController.dispose();
    suicidalThoughtsController.dispose();
    suicidalThoughtsPastController.dispose();
    suicidalThoughtsPastTimeController.dispose();
    currentHomicidalController.dispose();
    pastHomicidalController.dispose();
    pastHomicidalTimeController.dispose();
    currentPhysHealthController.dispose();
    lastPhysExamController.dispose();
    chronicIllController.dispose();
    maintMedsController.dispose();
    alcoholIntController.dispose();
    drugUseController.dispose();
    drugUseSelController.dispose();
    smokeSelController.dispose();
    smokeDailyController.dispose();
    headInjController.dispose();
    signChanController.dispose();
    depressedMoodNowSelController.dispose();
    depressedMoodNowRatController.dispose();
    anxSelController.dispose();
    anxRatingNowController.dispose();
    phobiasSelNowController.dispose();
    phobiasRatNowController.dispose();
    sexualAbuseSelNowController.dispose();
    sexualAbuseRatNowController.dispose();
    physicalAbueSelNowController.dispose();
    physicalAbuseRatNowController.dispose();
    emotionalAbuseSelNowController.dispose();
    emotionalAbuseRatNowController.dispose();
    // Dispose of other controllers as needed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          color: Color(0xff4D455D),// Change this color to your desired color
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: const Text(
                  'BLOOMFIELDS WELLNESS INSTITUTE (BWI)',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                    fontSize: 25,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: const Text(
                  'bloomfieldswellness@gmail.com',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: const Text(
                  'Adult Intake Form',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                    fontSize: 25,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(5, 0, 5, 20),
                child: const Text(
                  'Please provide the following information for my records. Leave blank any question you would rather not answer. Information you provide here is held to the same standards of confidentiality as our therapy. Please print out this form and bring it to your first session.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    fontStyle: FontStyle.italic,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child:Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  'Cell Phone Number: ${widget.selectedPatientUID}',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child:Container(
                height: 25,
                width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10 ),
                child: TextField(
                  enabled: false,
                  controller: cellPhoneController,
                  onChanged: (value) {
                    // Handle the text field value changes here
                  },
                ),
              ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child:Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'Home Phone Number:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                height: 25,
                width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10 ),
                child: TextField(
                  enabled: false,

                  onChanged: (value) {
                    // Handle the text field value changes here
                  },
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'Email:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                height: 25,
                width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10 ),
                child: TextField(
                  enabled: false,
                  onChanged: (value) {
                    // Handle the text field value changes here
                  },
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'Sexual Preference:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                height: 25,
                width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10 ),
                child: TextField(
                  controller: sexualPrefController,
                  enabled: false,
                  onChanged: (value) {
                    // Handle the text field value changes here
                  },
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'Marital Status:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                height: 25,
                width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10 ),
                child: TextField(
                  enabled: false,
                  controller: maritalStatusController,
                  onChanged: (value) {
                    // Handle the text field value changes here
                  },
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'Previous Psychotherapy:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                height: 25,
                width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10 ),
                child: TextField(
                  enabled: false,
                  controller: therapyStatusController,
                  onChanged: (value) {
                    // Handle the text field value changes here
                  },
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'Current prescribed psychiatric meditations:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                height: 25,
                width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10 ),
                child: TextField(
                  controller: currPyschMedsController,
                  enabled: false,
                  onChanged: (value) {
                    // Handle the text field value changes here
                  },
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'Emergency contact person name:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                height: 25,
                width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10 ),
                child: TextField(
                  controller: contactPersonNameController,
                  enabled: false,
                  onChanged: (value) {
                    // Handle the text field value changes here
                  },
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'Emergency contact person number:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                height: 25,
                width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10 ),
                child: TextField(
                  controller: cellPhoneController,
                  enabled: false,
                  onChanged: (value) {
                    // Handle the text field value changes here
                  },
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'Suicidal thoughts:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                height: 25,
                width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10 ),
                child: TextField(
                  controller: suicidalThoughtsController,
                  enabled: false,
                  onChanged: (value) {
                    // Handle the text field value changes here
                  },
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'Past suicidal thoughts:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                height: 25,
                width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10 ),
                child: TextField(
                  controller: suicidalThoughtsPastTimeController,
                  enabled: false,
                  onChanged: (value) {
                    // Handle the text field value changes here
                  },
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'Current homicidal thoughts:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                height: 25,
                width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10 ),
                child: TextField(
                  controller:currentHomicidalController,
                  enabled: false,
                  onChanged: (value) {
                    // Handle the text field value changes here
                  },
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'Previous homicidal thoughts:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                height: 25,
                width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10 ),
                child: TextField(
                  controller: pastHomicidalTimeController,
                  enabled: false,
                  onChanged: (value) {
                    // Handle the text field value changes here
                  },
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'Current physical health:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                height: 25,
                width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10 ),
                child: TextField(
                  controller:currentPhysHealthController,
                  enabled: false,
                  onChanged: (value) {
                    // Handle the text field value changes here
                  },
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'Last physical Examination:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                height: 25,
                width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10 ),
                child: TextField(
                  controller:lastPhysExamController,
                  enabled: false,
                  onChanged: (value) {
                    // Handle the text field value changes here
                  },
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'List of chronis health problem:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                height: 25,
                width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10 ),
                child: TextField(
                  controller: chronicIllController,
                  enabled: false,
                  onChanged: (value) {
                    // Handle the text field value changes here
                  },
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'Any Allergies:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                height: 25,
                width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10 ),
                child: TextField(
                  controller: TextEditingController(text: '${allergiesController.text} | ${allergyListController.text}'),
                  enabled: false,
                  onChanged: (value) {
                    // Handle the text field value changes here
                  },
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'List of maintenance medication:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                height: 25,
                width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10 ),
                child: TextField(
                  controller: maintMedsController,
                  enabled: false,
                  onChanged: (value) {
                    // Handle the text field value changes here
                  },
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'Regular intake of alcohol:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                height: 25,
                width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10 ),
                child: TextField(
                  controller: alcoholIntController,
                  enabled: false,
                  onChanged: (value) {
                    // Handle the text field value changes here
                  },
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'Engage in recreational drug use:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                height: 25,
                width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10 ),
                child: TextField(
                  controller: TextEditingController(text: '${drugUseSelController.text} | ${drugUseController.text}'),
                  enabled: false,
                  onChanged: (value) {
                    // Handle the text field value changes here
                  },
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'Habit of Smoke(# of cigar per day):',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                height: 25,
                width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10 ),
                child: TextField(
                  controller: TextEditingController(text: '${smokeSelController.text} | ${smokeDailyController.text}'),
                  enabled: false,
                  onChanged: (value) {
                    // Handle the text field value changes here
                  },
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'Any past head injury:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                height: 25,
                width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10 ),
                child: TextField(
                  controller: headInjController,
                  enabled: false,
                  onChanged: (value) {
                    // Handle the text field value changes here
                  },
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'Lately significant changes or stressors:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                height: 25,
                width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10 ),
                child: TextField(
                  controller: signChanController,
                  enabled: false,
                  onChanged: (value) {
                    // Handle the text field value changes here
                  },
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'Depressed Mood or Sadness:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                height: 25,
                width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10 ),
                child: TextField(
                  controller: TextEditingController(text: '${depressedMoodNowSelController.text} | ${depressedMoodNowRatController.text}'),
                  enabled: false,
                  onChanged: (value) {
                    // Handle the text field value changes here
                  },
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'Anxiety:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                height: 25,
                width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10 ),
                child: TextField(
                  controller: TextEditingController(text: '${anxSelController.text} | ${anxRatingNowController.text}'),
                  enabled: false,
                  onChanged: (value) {
                    // Handle the text field value changes here
                  },
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'Phobias:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                height: 25,
                width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10 ),
                child: TextField(
                  controller: TextEditingController(text: '${phobiasSelNowController.text} | ${phobiasRatNowController.text}'),
                  enabled: false,
                  onChanged: (value) {
                    // Handle the text field value changes here
                  },
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'Hallucinations:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                height: 25,
                width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10 ),
                child: TextField(
                  controller: TextEditingController(text: '${halluSelNowController.text} | ${halluRatNowController.text}'),
                  enabled: false,
                  onChanged: (value) {
                    // Handle the text field value changes here
                  },
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'Sexual Abuse:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                height: 25,
                width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10 ),
                child: TextField(
                  controller: TextEditingController(text: '${sexualAbuseSelNowController.text} | ${sexualAbuseRatNowController.text}'),
                  enabled: false,
                  onChanged: (value) {
                    // Handle the text field value changes here
                  },
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'Physical Abuse:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                height: 25,
                width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10 ),
                child: TextField(
                  controller: TextEditingController(text: '${physicalAbueSelNowController.text} | ${physicalAbuseRatNowController.text}'),
                  enabled: false,
                  onChanged: (value) {
                    // Handle the text field value changes here
                  },
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'Emotional Abuse:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                height: 25,
                width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10 ),
                child: TextField(
                  controller: TextEditingController(text: '${emotionalAbuseSelNowController.text} | ${emotionalAbuseRatNowController.text}'),
                  enabled: false,
                  onChanged: (value) {
                    // Handle the text field value changes here
                  },
                ),
              ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
