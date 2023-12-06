import 'package:flutter/material.dart';
import 'hospitalmap/hospital_map.dart';
import 'main.dart';
import 'my_container.dart';

const seedColor = Color(0xFFFF0000);
const outPadding = 32.0;

class FindHospital extends StatelessWidget {
  const FindHospital({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MyHomePage();
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/onlybackcolor.png'),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: outPadding),
                  child: Row(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.child_care,
                            color: Theme.of(context).colorScheme.onPrimary,
                            size: 60.0,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: outPadding,
                      ),
                      const Text(
                        '병원찾기',
                        style: TextStyle(
                          color: Color(0xFF455A64),
                          fontWeight: FontWeight.bold,
                          fontSize: 27.0,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: outPadding,
                ),
                Center(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  HospitalMap("내과", hospitalProvider),
                            ),
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
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  HospitalMap("이비인후과", hospitalProvider),
                            ),
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
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  HospitalMap("소아청소년과", hospitalProvider),
                            ),
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
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  HospitalMap("피부과", hospitalProvider),
                            ),
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
