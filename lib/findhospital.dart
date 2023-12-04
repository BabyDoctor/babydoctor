import 'package:flutter/material.dart';
import 'hospitalmap/hospital_map.dart';
import 'main.dart';
import 'my_container.dart';


const seedColor = Color(0xFFFF0000);
const outPadding = 32.0;

class FindHospital extends StatelessWidget {
  const FindHospital({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: seedColor,
        brightness: Brightness.light,
        fontFamily: 'Pretendard',
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/main_background_image.png'),
            ),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(outPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '',
                  ),
                  const SizedBox(
                    height: outPadding,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HospitalMap("내과", hospitalProvider)),
                      );
                    },
                    child: const MyContainer(
                      width: 200.0,
                      height: 90.0,
                      padding: EdgeInsets.all(8.0),
                      margin: EdgeInsets.all(10.0),
                      text: '내과',
                    ),
                  ),
                  const SizedBox(
                    height: outPadding,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HospitalMap("이비인후과", hospitalProvider)),
                      );
                    },
                    child: const MyContainer(
                      width: 200.0,
                      height: 90.0,
                      padding: EdgeInsets.all(8.0),
                      margin: EdgeInsets.all(10.0),
                      text: '이비인후과',
                    ),
                  ),
                  const SizedBox(
                    height: outPadding,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HospitalMap("소아청소년과", hospitalProvider)),
                      );
                    },
                    child: const MyContainer(
                      width: 200.0,
                      height: 90.0,
                      padding: EdgeInsets.all(8.0),
                      margin: EdgeInsets.all(10.0),
                      text: '소아청소년과',
                    ),
                  ),
                  const SizedBox(
                    height: outPadding,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>HospitalMap("피부과", hospitalProvider)),
                      );
                    },
                    child: const MyContainer(
                      width: 200.0,
                      height: 90.0,
                      padding: EdgeInsets.all(8.0),
                      margin: EdgeInsets.all(10.0),
                      text: '피부과',
                    ),
                  ),
                  const SizedBox(
                    height: outPadding,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

