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
    return MyHomePage();
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/onlybackcolor.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 10, 20, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.child_care),
                          iconSize: 60,
                        ),
                        const Expanded(
                          child: Text(
                            '병원 찾기',
                            style: TextStyle(
                              color: Color(0xFF455A64),
                              fontWeight: FontWeight.bold,
                              fontSize: 40.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(width: 50),  // IconButton의 iconSize와 동일한 너비의 공간을 만듭니다.
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFF455A64),
                        width: 3.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          GestureDetector(
                            child: const MainContainer(content: '내과',iconData: Icons.person_3,),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      HospitalMap("내과", hospitalProvider),
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          GestureDetector(
                            child: const MainContainer(content: '이비인후과',iconData: Icons.hearing,),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      HospitalMap("이비인후과", hospitalProvider),
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          GestureDetector(
                            child: const MainContainer(content: '소아청소년과',iconData: Icons.child_care,),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      HospitalMap("소아청소년과", hospitalProvider),
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          GestureDetector(
                            child: const MainContainer(content: '피부과',iconData: Icons.face,),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      HospitalMap("피부과", hospitalProvider),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )));
  }
}

class MainContainer extends StatelessWidget {
  final String content;
  final IconData? iconData; // 아이콘 데이터가 없을 수도 있으므로 Nullable로 변경
  const MainContainer({Key? key, required this.content, this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.17,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            offset: const Offset(5, 5),
            color: Colors.black.withOpacity(0.3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                if (iconData != null) // 아이콘이 있을 경우에만 아이콘을 렌더링
                  Icon(iconData, color: Colors.black,size: 40,),
                if (iconData != null) // 아이콘이 있을 경우에만 간격을 추가
                  const SizedBox(width: 10),
                Text(
                  content,
                  style: const TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
