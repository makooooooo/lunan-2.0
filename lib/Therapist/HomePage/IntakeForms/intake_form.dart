import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lunan/Therapist/HomePage/ViewPatient/patient_info.dart';
import 'package:lunan/Therapist/HomePage/chat.dart';
import 'package:lunan/Therapist/MenuList/menulist.dart';

class IntakeForm extends StatefulWidget {
  final Map<String, dynamic>? data;
  final String selectedPatientUID;
  final String? PhoneNum;
  final String? Email;
  final String? HomePhone;
  final String? firstName;
  const IntakeForm({
    Key? key,
    this.data,
    required this.selectedPatientUID,
    this.PhoneNum,
    this.Email,
    this.HomePhone,
    this.firstName,
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
  TextEditingController suicidalThoughtsPastController =
      TextEditingController();
  TextEditingController suicidalThoughtsPastTimeController =
      TextEditingController();
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
  TextEditingController emotionalAbuseRatNowController =
      TextEditingController();
  TextEditingController emotionalAbuseSelNowController =
      TextEditingController();
  TextEditingController HomePhone = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController pastDepMoodSel = TextEditingController();
  TextEditingController pastDepMoodRat = TextEditingController();
  TextEditingController pastIrrSel = TextEditingController();
  TextEditingController pastIrrRat = TextEditingController();
  TextEditingController pastMoodSwingsSel = TextEditingController();
  TextEditingController pastMoodSwingsRat = TextEditingController();
  TextEditingController pastRapidSpeechSel = TextEditingController();
  TextEditingController pastRapidSpeechRat = TextEditingController();
  TextEditingController pastRacThoSel = TextEditingController();
  TextEditingController pastRacThoRat = TextEditingController();
  TextEditingController pastAnxSel = TextEditingController();
  TextEditingController pastAnxRat = TextEditingController();
  TextEditingController pastConsWorSel = TextEditingController();
  TextEditingController pastConsWorRat = TextEditingController();
  TextEditingController pastPanicAttSel = TextEditingController();
  TextEditingController pastPanicAttRat = TextEditingController();
  TextEditingController pastPhobSel = TextEditingController();
  TextEditingController pastPhobRat = TextEditingController();
  TextEditingController pastSleepDistSel = TextEditingController();
  TextEditingController pastSleepDistRat = TextEditingController();
  TextEditingController pastHalSel = TextEditingController();
  TextEditingController pastHalRat = TextEditingController();
  TextEditingController pastParSel = TextEditingController();
  TextEditingController pastParRat = TextEditingController();
  TextEditingController pastPoorConSel = TextEditingController();
  TextEditingController pastPoorConRat = TextEditingController();
  TextEditingController pastAlcAbuSel = TextEditingController();
  TextEditingController pastAlcAbuRat = TextEditingController();
  TextEditingController pastFreqBodyCompSel = TextEditingController();
  TextEditingController pastFreqBodyCompRat = TextEditingController();
  TextEditingController pastEatDisSel = TextEditingController();
  TextEditingController pastEatDisRat = TextEditingController();
  TextEditingController pastBodyImageSel = TextEditingController();
  TextEditingController pastBodyImageRat = TextEditingController();
  TextEditingController pastRepThouSel = TextEditingController();
  TextEditingController pastRepThouRat = TextEditingController();
  TextEditingController pastRepBehSel = TextEditingController();
  TextEditingController pastRepBehRat = TextEditingController();
  TextEditingController pastPoorImpSel = TextEditingController();
  TextEditingController pastPoorImpRat = TextEditingController();
  TextEditingController pastSelfMutSel = TextEditingController();
  TextEditingController pastSelfMutRat = TextEditingController();
  TextEditingController pastSexAbuseSel = TextEditingController();
  TextEditingController pastSexAbuseRat = TextEditingController();
  TextEditingController pastPhyAbuSel = TextEditingController();
  TextEditingController pastPhyAbuRat = TextEditingController();
  TextEditingController pastEmoAbuSel = TextEditingController();
  TextEditingController pastEmoAbuRat = TextEditingController();

  @override
  void initState() {
    super.initState();
    now = DateTime.now();
    formattedDate = DateFormat('yyyy / MM / dd').format(now);
    fetchDataFromFirestore();
    HomePhone.text = widget.HomePhone ?? '';
    Email.text = widget.Email ?? '';
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
          suicidalThoughtsPastTimeController.text =
              doc['SuicidalThoughtsPastTime'];
          currentHomicidalController.text = doc['CurrentHomicidal'];
          pastHomicidalController.text = doc['HadPreviousHomicide'];
          pastHomicidalTimeController.text = doc['PastHomicidalTime'];
          currentPhysHealthController.text = doc['currentPhysicalHealth'];
          lastPhysExamController.text = doc['LastPhysicalExam'];
          chronicIllController.text = doc['ChronicIll'];
          maintMedsController.text = doc['MaintMeds'];
          alcoholIntController.text = doc['AlcoholInt'];
          drugUseController.text = doc['DrugUse'];
          drugUseSelController.text = doc['DrugUseSel'];
          smokeSelController.text = doc['SmokeSel'];
          smokeDailyController.text = doc['CiggDaily'];
          headInjController.text = doc['HeadInjDef'];
          signChanController.text = doc['SignChanSel'];
          depressedMoodNowSelController.text = doc['depressedMoodNowSel'];
          depressedMoodNowRatController.text = doc['depressedMoodRatingNow'];
          anxSelController.text = doc['anxietySelNow'];
          anxRatingNowController.text = doc['anxietyRatingNow'];
          phobiasRatNowController.text = doc['phobiasRatingNow'];
          phobiasSelNowController.text = doc['phobiasSelNow'];
          halluSelNowController.text = doc['hallucinationsSelNow'];
          halluRatNowController.text = doc['hallucinationsRatingNow'];
          sexualAbuseSelNowController.text = doc['sexualAbuseSelNow'];
          sexualAbuseRatNowController.text = doc['sexualAbuseRatingNow'];
          physicalAbueSelNowController.text = doc['physicalAbuseSelNow'];
          physicalAbuseRatNowController.text = doc['physicalAbuseRatingNow'];
          emotionalAbuseSelNowController.text = doc['emotionalAbuseSelNow'];
          emotionalAbuseRatNowController.text = doc['emotionalAbuseRatingNow'];
          pastDepMoodSel.text = doc['depressedMoodPastSel'];
          pastDepMoodRat.text = doc['depressedMoodRatingPast'];
          pastIrrSel.text = doc['irritabilitySelPast'];
          pastIrrRat.text = doc['irritabilityRatingPast'];
          pastMoodSwingsSel.text = doc['moodSwingsSelPast'];
          pastMoodSwingsRat.text = doc['moodSwingsRatingPast'];
          pastRapidSpeechSel.text = doc['rapidSpeechSelPast'];
          pastRapidSpeechRat.text = doc['rapidSpeechRatingPast'];
          pastRacThoSel.text = doc['racingThoughtsSelPast'];
          pastRacThoRat.text = doc['racingThoughtsRatingPast'];
          pastAnxSel.text = doc['anxietySelPast'];
          pastAnxRat.text = doc['anxietyRatingPast'];
          pastConsWorSel.text = doc['constantWorrySelPast'];
          pastConsWorRat.text = doc['constantWorryRatingPast'];
          pastPanicAttSel.text = doc['panicAttacksSelPast'];
          pastPanicAttRat.text = doc['panicAttacksRatingPast'];
          pastPhobSel.text = doc['phobiasSelPast'];
          pastPhobRat.text = doc['phobiasRatingPast'];
          pastSleepDistSel.text = doc['sleepDisturbancesSelPast'];
          pastSleepDistRat.text = doc['sleepDisturbancesRatingPast'];
          pastHalSel.text = doc['hallucinationsSelPast'];
          pastHalRat.text = doc['hallucinationsRatingPast'];
          pastParSel.text = doc['paranoiaSelPast'];
          pastParRat.text = doc['paranoiaRatingPast'];
          pastPoorConSel.text = doc['poorConcentrationSelPast'];
          pastPoorConRat.text = doc['poorImpulseControlRatingPast'];
          pastAlcAbuSel.text = doc['alcoholSubstanceAbuseSelPast'];
          pastAlcAbuRat.text = doc['alcoholSubstanceAbuseRatingPast'];
          pastFreqBodyCompSel.text = doc['frequentBodyComplaintsSelPast'];
          pastFreqBodyCompRat.text = doc['frequentBodyComplaintsRatingPast'];
          pastEatDisSel.text = doc['eatingDisorderSelPast'];
          pastEatDisRat.text = doc['eatingDisorderRatingPast'];
          pastBodyImageSel.text = doc['bodyImageProblemsSelPast'];
          pastBodyImageRat.text = doc['bodyImageProblemsRatingPast'];
          pastRepThouSel.text = doc['repetitiveThoughtsSelPast'];
          pastRepThouRat.text = doc['repetitiveThoughtsRatingPast'];
          pastRepBehSel.text = doc['repetitiveBehaviorsSelPast'];
          pastRepBehRat.text = doc['repetitiveBehaviorsRatingPast'];
          pastPoorImpSel.text = doc['poorImpulseControlSelPast'];
          pastPoorImpRat.text = doc['poorImpulseControlRatingPast'];
          pastSelfMutSel.text = doc['selfMutilationSelPast'];
          pastSelfMutRat.text = doc['selfMutilationRatingPast'];
          pastSexAbuseSel.text = doc['sexualAbuseSelPast'];
          pastSexAbuseRat.text = doc['sexualAbuseRatingPast'];
          pastPhyAbuSel.text = doc['sexualAbuseSelPast'];
          pastPhyAbuRat.text = doc['sexualAbuseRatingPast'];
          pastEmoAbuSel.text = doc['emotionalAbuseRatingPast'];
          pastEmoAbuRat.text = doc['emotionalAbuseSelPast'];
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
    pastDepMoodSel.dispose();
    pastDepMoodRat.dispose();
    pastIrrSel.dispose();
    pastIrrRat.dispose();
    pastMoodSwingsSel.dispose();
    pastMoodSwingsRat.dispose();
    pastRapidSpeechSel.dispose();
    pastRapidSpeechRat.dispose();
    pastRacThoSel.dispose();
    pastRacThoRat.dispose();
    pastAnxSel.dispose();
    pastAnxRat.dispose();
    pastConsWorSel.dispose();
    pastConsWorRat.dispose();
    pastPanicAttSel.dispose();
    pastPanicAttRat.dispose();
    pastPhobSel.dispose();
    pastPhobRat.dispose();
    pastSleepDistSel.dispose();
    pastSleepDistRat.dispose();
    pastHalSel.dispose();
    pastHalRat.dispose();
    pastParSel.dispose();
    pastParRat.dispose();
    pastPoorConSel.dispose();
    pastPoorConRat.dispose();
    pastAlcAbuSel.dispose();
    pastAlcAbuRat.dispose();
    pastFreqBodyCompSel.dispose();
    pastFreqBodyCompRat.dispose();
    pastEatDisSel.dispose();
    pastEatDisRat.dispose();
    pastBodyImageSel.dispose();
    pastBodyImageRat.dispose();
    pastRepThouSel.dispose();
    pastRepThouRat.dispose();
    pastRepBehSel.dispose();
    pastRepBehRat.dispose();
    pastPoorImpSel.dispose();
    pastPoorImpRat.dispose();
    pastSelfMutSel.dispose();
    pastSelfMutRat.dispose();
    pastSexAbuseSel.dispose();
    pastSexAbuseRat.dispose();
    pastPhyAbuSel.dispose();
    pastPhyAbuRat.dispose();
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
          color: Color(0xff4D455D), // Change this color to your desired color
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
                child: Text(
                  'Intake Form of \n${widget.firstName}',
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
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                child: const Text(
                  '\nThe provided information below was the information that the patient has submitted upon signing up.',
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
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    'Cell Phone Number: ',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 25,
                  width: 350,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    enabled: false,
                    controller: cellPhoneController,
                    onChanged: (value) {
                      // Handle the text field value changes here
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: const Text(
                    'Home Phone Number:',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 25,
                  width: 350,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    controller: HomePhone,
                    enabled: false,
                    onChanged: (value) {
                      // Handle the text field value changes here
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: const Text(
                    'Email:',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 25,
                  width: 350,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    controller: Email,
                    enabled: false,
                    onChanged: (value) {
                      // Handle the text field value changes here
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: const Text(
                    'Sexual Preference:',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 25,
                  width: 350,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    controller: sexualPrefController,
                    enabled: false,
                    onChanged: (value) {
                      // Handle the text field value changes here
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: const Text(
                    'Marital Status:',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 25,
                  width: 350,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    enabled: false,
                    controller: maritalStatusController,
                    onChanged: (value) {
                      // Handle the text field value changes here
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: const Text(
                    'Previous Psychotherapy:',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 25,
                  width: 350,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    enabled: false,
                    controller: therapyStatusController,
                    onChanged: (value) {
                      // Handle the text field value changes here
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: const Text(
                    'Current prescribed psychiatric meditations:',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 25,
                  width: 350,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    controller: currPyschMedsController,
                    enabled: false,
                    onChanged: (value) {
                      // Handle the text field value changes here
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: const Text(
                    'Emergency contact person name:',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 25,
                  width: 350,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    controller: contactPersonNameController,
                    enabled: false,
                    onChanged: (value) {
                      // Handle the text field value changes here
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: const Text(
                    'Emergency contact person number:',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 25,
                  width: 350,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    controller: cellPhoneController,
                    enabled: false,
                    onChanged: (value) {
                      // Handle the text field value changes here
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: const Text(
                    'Suicidal thoughts:',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 25,
                  width: 350,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    controller: suicidalThoughtsController,
                    enabled: false,
                    onChanged: (value) {
                      // Handle the text field value changes here
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: const Text(
                    'Past suicidal thoughts:',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 25,
                  width: 350,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    controller: suicidalThoughtsPastTimeController,
                    enabled: false,
                    onChanged: (value) {
                      // Handle the text field value changes here
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: const Text(
                    'Current homicidal thoughts:',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 25,
                  width: 350,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    controller: currentHomicidalController,
                    enabled: false,
                    onChanged: (value) {
                      // Handle the text field value changes here
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: const Text(
                    'Previous homicidal thoughts:',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 25,
                  width: 350,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    controller: pastHomicidalTimeController,
                    enabled: false,
                    onChanged: (value) {
                      // Handle the text field value changes here
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: const Text(
                    'Current physical health:',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 25,
                  width: 350,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    controller: currentPhysHealthController,
                    enabled: false,
                    onChanged: (value) {
                      // Handle the text field value changes here
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: const Text(
                    'Last physical Examination:',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 25,
                  width: 350,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    controller: lastPhysExamController,
                    enabled: false,
                    onChanged: (value) {
                      // Handle the text field value changes here
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: const Text(
                    'List of chronis health problem:',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 25,
                  width: 350,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    controller: chronicIllController,
                    enabled: false,
                    onChanged: (value) {
                      // Handle the text field value changes here
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: const Text(
                    'Any Allergies:',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 25,
                  width: 350,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    controller: allergyListController,
                    enabled: false,
                    onChanged: (value) {
                      // Handle the text field value changes here
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: const Text(
                    'List of maintenance medication:',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 25,
                  width: 350,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    controller: maintMedsController,
                    enabled: false,
                    onChanged: (value) {
                      // Handle the text field value changes here
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: const Text(
                    'Regular intake of alcohol:',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 25,
                  width: 350,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    controller: alcoholIntController,
                    enabled: false,
                    onChanged: (value) {
                      // Handle the text field value changes here
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: const Text(
                    'Engage in recreational drug use:',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 25,
                  width: 350,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    controller: TextEditingController(
                        text:
                            '${drugUseSelController.text} | ${drugUseController.text}'),
                    enabled: false,
                    onChanged: (value) {
                      // Handle the text field value changes here
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: const Text(
                    'Habit of Smoke & Number of Cigar per day:',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 25,
                  width: 350,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    controller: TextEditingController(
                        text:
                            '${smokeSelController.text} | ${smokeDailyController.text}'),
                    enabled: false,
                    onChanged: (value) {
                      // Handle the text field value changes here
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: const Text(
                    'Any past head injury:',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 25,
                  width: 350,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    controller: headInjController,
                    enabled: false,
                    onChanged: (value) {
                      // Handle the text field value changes here
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: const Text(
                    'Lately significant changes or stressors:',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 25,
                  width: 350,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    controller: signChanController,
                    enabled: false,
                    onChanged: (value) {
                      // Handle the text field value changes here
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: const Text(
                    'Depressed Mood or Sadness:',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 25,
                  width: 350,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    controller: TextEditingController(
                        text:
                            '${depressedMoodNowSelController.text} | ${depressedMoodNowRatController.text}'),
                    enabled: false,
                    onChanged: (value) {
                      // Handle the text field value changes here
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: const Text(
                    'Anxiety:',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 25,
                  width: 350,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    controller: TextEditingController(
                        text:
                            '${anxSelController.text} | ${anxRatingNowController.text}'),
                    enabled: false,
                    onChanged: (value) {
                      // Handle the text field value changes here
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: const Text(
                    'Phobias:',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 25,
                  width: 350,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    controller: TextEditingController(
                        text:
                            '${phobiasSelNowController.text} | ${phobiasRatNowController.text}'),
                    enabled: false,
                    onChanged: (value) {
                      // Handle the text field value changes here
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: const Text(
                    'Hallucinations:',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 25,
                  width: 350,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    controller: TextEditingController(
                        text:
                            '${halluSelNowController.text} | ${halluRatNowController.text}'),
                    enabled: false,
                    onChanged: (value) {
                      // Handle the text field value changes here
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: const Text(
                    'Sexual Abuse:',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 25,
                  width: 350,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    controller: TextEditingController(
                        text:
                            '${sexualAbuseSelNowController.text} | ${sexualAbuseRatNowController.text}'),
                    enabled: false,
                    onChanged: (value) {
                      // Handle the text field value changes here
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: const Text(
                    'Physical Abuse:',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 25,
                  width: 350,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    controller: TextEditingController(
                        text:
                            '${physicalAbueSelNowController.text} | ${physicalAbuseRatNowController.text}'),
                    enabled: false,
                    onChanged: (value) {
                      // Handle the text field value changes here
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: const Text(
                    'Emotional Abuse:',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 25,
                  width: 350,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    controller: TextEditingController(
                      text:
                          '${emotionalAbuseSelNowController.text} | ${emotionalAbuseRatNowController.text}',
                    ),
                    enabled: false,
                    onChanged: (value) {
                      // Handle the text field value changes here
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text(
                  'Experiences from the past \n',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                    fontSize: 25,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    'Depressed Mood or Sadness: ',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 25,
                  width: 350,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    controller: TextEditingController(
                      text: '${pastDepMoodSel.text} | ${pastDepMoodRat.text}',
                    ),
                    enabled: false,
                    onChanged: (value) {
                      // Handle the text field value changes here
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    'Irritablity/Anger: ',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 25,
                  width: 350,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    controller: TextEditingController(
                      text: '${pastIrrSel.text} | ${pastIrrRat.text}',
                    ),
                    enabled: false,
                    onChanged: (value) {
                      // Handle the text field value changes here
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    'Mood Swings: ',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 25,
                  width: 350,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    controller: TextEditingController(
                      text:
                          '${pastMoodSwingsSel.text} | ${pastMoodSwingsRat.text}',
                    ),
                    enabled: false,
                    onChanged: (value) {
                      // Handle the text field value changes here
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    'Rapid Speech: ',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 25,
                  width: 350,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    controller: TextEditingController(
                      text:
                          '${pastRapidSpeechSel.text} | ${pastRapidSpeechRat.text}',
                    ),
                    enabled: false,
                    onChanged: (value) {
                      // Handle the text field value changes here
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    'Racing Thoughts: ',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 25,
                  width: 350,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    controller: TextEditingController(
                      text: '${pastRacThoSel.text} | ${pastRacThoRat.text}',
                    ),
                    enabled: false,
                    onChanged: (value) {
                      // Handle the text field value changes here
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    'Anxiety: ',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 25,
                  width: 350,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    controller: TextEditingController(
                      text: '${pastAnxSel.text} | ${pastAnxRat.text}',
                    ),
                    enabled: false,
                    onChanged: (value) {
                      // Handle the text field value changes here
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    'Constant Worry: ',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 25,
                  width: 350,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    controller: TextEditingController(
                      text: '${pastConsWorSel.text} | ${pastConsWorRat.text}',
                    ),
                    enabled: false,
                    onChanged: (value) {
                      // Handle the text field value changes here
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    'Panic Attacks: ',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 25,
                  width: 350,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    controller: TextEditingController(
                      text: '${pastPanicAttSel.text} | ${pastPanicAttRat.text}',
                    ),
                    enabled: false,
                    onChanged: (value) {
                      // Handle the text field value changes here
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    'Phobias: ',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 25,
                  width: 350,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    controller: TextEditingController(
                      text: '${pastPhobSel.text} | ${pastPhobRat.text}',
                    ),
                    enabled: false,
                    onChanged: (value) {
                      // Handle the text field value changes here
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    'Sleep Disturbances: ',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 25,
                  width: 350,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    controller: TextEditingController(
                      text:
                          '${pastSleepDistSel.text} | ${pastSleepDistRat.text}',
                    ),
                    enabled: false,
                    onChanged: (value) {
                      // Handle the text field value changes here
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    'Hallucinations: ',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 25,
                  width: 350,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    controller: TextEditingController(
                      text: '${pastHalSel.text} | ${pastHalRat.text}',
                    ),
                    enabled: false,
                    onChanged: (value) {
                      // Handle the text field value changes here
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    'Paranoia: ',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 25,
                  width: 350,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    controller: TextEditingController(
                      text: '${pastParSel.text} | ${pastParRat.text}',
                    ),
                    enabled: false,
                    onChanged: (value) {
                      // Handle the text field value changes here
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    'Poor Concentration: ',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 25,
                  width: 350,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    controller: TextEditingController(
                      text: '${pastPoorConSel.text} | ${pastPoorConRat.text}',
                    ),
                    enabled: false,
                    onChanged: (value) {
                      // Handle the text field value changes here
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    'Alcohol Abuse: ',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 25,
                  width: 350,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    controller: TextEditingController(
                      text: '${pastAlcAbuSel.text} | ${pastAlcAbuRat.text}',
                    ),
                    enabled: false,
                    onChanged: (value) {
                      // Handle the text field value changes here
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    'Frequent Body Complaints: ',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 25,
                  width: 350,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    controller: TextEditingController(
                      text:
                          '${pastFreqBodyCompSel.text} | ${pastFreqBodyCompRat.text}',
                    ),
                    enabled: false,
                    onChanged: (value) {
                      // Handle the text field value changes here
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    'Eating Disorder: ',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 25,
                  width: 350,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    controller: TextEditingController(
                      text: '${pastEatDisSel.text} | ${pastEatDisRat.text}',
                    ),
                    enabled: false,
                    onChanged: (value) {
                      // Handle the text field value changes here
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    'Eating Disorder: ',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 25,
                  width: 350,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    controller: TextEditingController(
                      text: '${pastEatDisSel.text} | ${pastEatDisRat.text}',
                    ),
                    enabled: false,
                    onChanged: (value) {
                      // Handle the text field value changes here
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    'Body Image Problems: ',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 25,
                  width: 350,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    controller: TextEditingController(
                      text:
                          '${pastBodyImageSel.text} | ${pastBodyImageRat.text}',
                    ),
                    enabled: false,
                    onChanged: (value) {
                      // Handle the text field value changes here
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    'Repetitive Thoughts: ',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 25,
                  width: 350,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    controller: TextEditingController(
                      text: '${pastRepThouSel.text} | ${pastRepThouRat.text}',
                    ),
                    enabled: false,
                    onChanged: (value) {
                      // Handle the text field value changes here
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    'Repetitive Behaviors: ',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 25,
                  width: 350,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    controller: TextEditingController(
                      text: '${pastRepBehSel.text} | ${pastRepBehRat.text}',
                    ),
                    enabled: false,
                    onChanged: (value) {
                      // Handle the text field value changes here
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    'Poor Impulse Control: ',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 25,
                  width: 350,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    controller: TextEditingController(
                      text: '${pastPoorImpSel.text} | ${pastPoorImpRat.text}',
                    ),
                    enabled: false,
                    onChanged: (value) {
                      // Handle the text field value changes here
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    'Self-Mutilation: ',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 25,
                  width: 350,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    controller: TextEditingController(
                      text: '${pastSelfMutSel.text} | ${pastSelfMutRat.text}',
                    ),
                    enabled: false,
                    onChanged: (value) {
                      // Handle the text field value changes here
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    'Sexual Abuse: ',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 25,
                  width: 350,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    controller: TextEditingController(
                      text: '${pastSexAbuseSel.text} | ${pastSexAbuseRat.text}',
                    ),
                    enabled: false,
                    onChanged: (value) {
                      // Handle the text field value changes here
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    'Physical Abuse: ',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 25,
                  width: 350,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    controller: TextEditingController(
                      text: '${pastPhyAbuSel.text} | ${pastPhyAbuRat.text}',
                    ),
                    enabled: false,
                    onChanged: (value) {
                      // Handle the text field value changes here
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    'Emotional Abuse: ',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 25,
                  width: 350,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    controller: TextEditingController(
                      text: '${pastEmoAbuSel.text} | ${pastEmoAbuRat.text}',
                    ),
                    enabled: false,
                    onChanged: (value) {
                      // Handle the text field value changes here
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
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
