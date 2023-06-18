import 'package:flutter/material.dart';
import 'package:lunan/Patient/MenuList/menulist.dart';

class WellnessGuide extends StatelessWidget {
  const WellnessGuide({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
    backgroundColor: const Color(0xffF5E9CF), // Set the background color
      appBar: AppBar(
    
        backgroundColor: const Color(0xff7DB9B6),
      
        
      
      ),
      
      drawer: Drawer(
        child: MenuList(),
      ),
      
      body: SingleChildScrollView(
          child: Center(
        child: Column(children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(20, 50, 20, 20),
                width: 150,
                height: 150,
                child: ElevatedButton(
                    onPressed: () {
                      //  Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => const WeeklyForms()),
                      // );
                    
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff7DB9B6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            15), // Set the corner radius here
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                          child: const Text('YouTube'),
                        ),
                       
                      ],
                    )),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 50, 20, 20),
                width: 150,
                height: 150,
                child: ElevatedButton(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => const WellnessForms()),
                      // );
                     
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff7DB9B6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            15), // Set the corner radius here
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                          child: const Text('YouTube'),
                        ),
                       
                      ],
                    )),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                width: 150,
                height: 150,
                child: ElevatedButton(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => const Assignment()),
                      // );
                    
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff7DB9B6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            15), // Set the corner radius here
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                          child: const Text('YouTube'),
                        ),
                       
                      ],
                    )),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                width: 150,
                height: 150,
                child: ElevatedButton(
                    onPressed: () {
                    
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => const WellnessGuide()),
                      // );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff7DB9B6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            15), // Set the corner radius here
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                          child: const Text('YouTube'),
                        ),
                    
                      ],
                    )),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                width: 150,
                height: 150,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff7DB9B6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            15), // Set the corner radius here
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                          child: const Text('YouTube'),
                        ),
                        
                      ],
                    )),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                width: 150,
                height: 150,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff7DB9B6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            15), // Set the corner radius here
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                          child: const Text('YouTube'),
                        ),
                        
                      ],
                    )),
              )
            ],
          )
        ]),
      )),
    
    );
  }
}