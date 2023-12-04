import 'package:cpstn/CNNimage.dart';
import 'package:flutter/material.dart';
import 'bloodpoo.dart';
import 'colic.dart';
import 'convulse.dart';
import 'fever.dart';
import 'kollock.dart';
import 'my_container.dart';
import 'poo.dart';
import 'poopoo.dart';
import 'skin.dart';
import 'yellomoon.dart';

import 'main.dart';

class FindSymptoms extends StatelessWidget {
  const FindSymptoms({super.key});

  @override

  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
        child: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage('assets/onlybackcolor.png'),
    fit: BoxFit.cover,
    ),
    ),


          child: Padding(
              padding: const EdgeInsets.all(outPadding),
              child: GridView.count(
                crossAxisCount: 3,

                children: [
                  IconButton(onPressed: (){
                    Navigator.of(context).pop();
                  },
                    icon: Icon(
                      Icons.child_care,
                      color: Colors.white,
                      size: 60.0,
                    ),
                  ),
                  const Text(
                    '증상을      골라주세요',style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold, fontSize: 25.0),
                  ),
                  const SizedBox(
                    height: outPadding,
                  ),


                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Colic()),
                      );
                    },
                    child: const MyContainer(
                      width: 50.0,
                      height: 50.0,
                      padding: EdgeInsets.all(8.0),
                      margin: EdgeInsets.all(10.0),
                      text: '복통',
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Convulse()),
                      );
                    },
                    child: const MyContainer(
                      width: 50.0,
                      height: 50.0,
                      padding: EdgeInsets.all(8.0),
                      margin: EdgeInsets.all(10.0),
                      text: '경련',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Poo()),
                      );
                    },
                    child: const MyContainer(
                      width: 50.0,
                      height: 50.0,
                      padding: EdgeInsets.all(8.0),
                      margin: EdgeInsets.all(10.0),
                      text: '설사',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const KolLock()),
                      );
                    },
                    child: const MyContainer(
                      width: 50.0,
                      height: 50.0,
                      padding: EdgeInsets.all(8.0),
                      margin: EdgeInsets.all(10.0),
                      text: '기침',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const YellowMoon()),
                      );
                    },
                    child: const MyContainer(
                      width: 50.0,
                      height: 50.0,
                      padding: EdgeInsets.all(8.0),
                      margin: EdgeInsets.all(10.0),
                      text: '황달',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const BloodPoo()),
                      );
                    },
                    child: const MyContainer(
                      width: 50.0,
                      height: 50.0,
                      padding: EdgeInsets.all(8.0),
                      margin: EdgeInsets.all(10.0),
                      text: '혈변',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Fever()),
                      );
                    },
                    child: const MyContainer(
                      width: 50.0,
                      height: 50.0,
                      padding: EdgeInsets.all(8.0),
                      margin: EdgeInsets.all(10.0),
                      text: '발열',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PooPoo()),
                      );
                    },
                    child: const MyContainer(
                      width: 50.0,
                      height: 50.0,
                      padding: EdgeInsets.all(8.0),
                      margin: EdgeInsets.all(10.0),
                      text: '변비',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CNN()),
                      );
                    },
                    child: const MyContainer(
                      width: 50.0,
                      height: 50.0,
                      padding: EdgeInsets.all(8.0),
                      margin: EdgeInsets.all(10.0),

                        text: '   피부'
                            '             이상'
                    ),
                  ),
                ],
              )),
        )
        )
    );
  }
}
