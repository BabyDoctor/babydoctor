import 'package:flutter/material.dart';
import 'resultpage.dart';
import 'main.dart';

class Colic extends StatelessWidget {
  const Colic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
                decoration: const BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/onlybackcolor.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(outPadding),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: Icon(
                                  Icons.child_care,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  size: 60.0,
                                ),
                              ),
                              const SizedBox(
                                width: outPadding,
                              ),
                              const Text(
                                '복통',
                                style: TextStyle(
                                    color: Color(0xFF455A64),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 27.0),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: outPadding,
                          ),
                          const Expanded(
                            child: Center(
                              child: CheckBoxs(),
                            ),
                          ),
                        ])))));
  }
}

var name1 = "창자벽 공기증";
var name2 = '결장증';
var name3 = '장중첩증';

class CheckBoxs extends StatefulWidget {
  const CheckBoxs({Key? key}) : super(key: key);

  @override
  _CheckBoxsState createState() => _CheckBoxsState();
}

class _CheckBoxsState extends State<CheckBoxs> {
  bool _suddenly = false;
  bool _one = false;
  bool _three = false;
  bool _seconds = false;
  bool _threee = false;
  bool _fivee = false;
  bool _ten = false;
  bool _hot = false;
  bool _eisik = false;
  bool _singyong = false;
  bool _byun = false;
  bool _uoek = false;
  bool _nonne = false;
  bool _week = false;
  bool _water = false;
  bool _nop = false;
  bool _redpoint = false;
  bool _sleep = false;
  bool _banggu = false;
  bool _bed = false;
  bool _sossage = false;
  bool _ko = false;
  bool _temper = false;
  bool _bloodung = false;
  bool _thin = false;
  bool _head = false;

  List<String> checkList = [];

  var name9 = "간염";
  var name10 = '담관낭종';

  String _getDiagnosis() {
    if (_uoek && _bloodung && _temper && _ko && _banggu && _redpoint) {
      return name1; //창자벽 공기증
    }
    if (_byun && _uoek && _banggu) {
      return name2; //결장증
    }
    if (_byun && _uoek && _sossage && _banggu) {
      return name3; //장중첩증
    } else {
      return "경과관찰 요망";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          const Padding(
            padding: EdgeInsets.all(30.0),
            child: Text(
              "증상이 가장 뚜력하게 반응하는 부위는?",
              style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: 21.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  value: _suddenly,
                  onChanged: (value) {
                    setState(() {
                      _suddenly = value!;
                    });
                  },
                ),
                const Text(
                  "명치",
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  value: _one,
                  onChanged: (value) {
                    setState(() {
                      _one = value!;
                    });
                  },
                ),
                const Text(
                  "아랫배",
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  value: _three,
                  onChanged: (value) {
                    setState(() {
                      _three = value!;
                    });
                  },
                ),
                const Text(
                  "아랫배 왼쪽",
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  value: _seconds,
                  onChanged: (value) {
                    setState(() {
                      _seconds = value!;
                    });
                  },
                ),
                const Text(
                  "아랫배 오른쪽",
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  value: _nonne,
                  onChanged: (value) {
                    setState(() {
                      _nonne = value!;
                    });
                  },
                ),
                const Text(
                  "특정부위 없음",
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(30.0),
            child: Text(
              "언제부터 아팠나요?",
              style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: 21.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  value: _threee,
                  onChanged: (value) {
                    setState(() {
                      _threee = value!;
                    });
                  },
                ),
                const Text(
                  "갑자기",
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  value: _fivee,
                  onChanged: (value) {
                    setState(() {
                      _fivee = value!;
                    });
                  },
                ),
                const Text(
                  "~3일",
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  value: _ten,
                  onChanged: (value) {
                    setState(() {
                      _ten = value!;
                    });
                  },
                ),
                const Text(
                  '~5일',
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  value: _week,
                  onChanged: (value) {
                    setState(() {
                      _week = value!;
                    });
                  },
                ),
                const Text(
                  '일주일이상',
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(30.0),
            child: Text(
              "얼마나 지속 되나요?",
              style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: 21.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  value: _hot,
                  onChanged: (value) {
                    setState(() {
                      _hot = value!;
                    });
                  },
                ),
                const Text(
                  "1~2분",
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  value: _eisik,
                  onChanged: (value) {
                    setState(() {
                      _eisik = value!;
                    });
                  },
                ),
                const Text(
                  "~3분",
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  value: _singyong,
                  onChanged: (value) {
                    setState(() {
                      _singyong = value!;
                    });
                  },
                ),
                const Text(
                  '5분~',
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(30.0),
            child: Text(
              "동반된 다른 증상이 있나요?(모두 선택해주세요.)",
              style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: 21.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  value: _byun,
                  onChanged: (value) {
                    setState(() {
                      _byun = value!;
                    });
                  },
                ),
                const Text(
                  "변비",
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  value: _uoek,
                  onChanged: (value) {
                    setState(() {
                      _uoek = value!;
                    });
                  },
                ),
                const Text(
                  "구토",
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  value: _water,
                  onChanged: (value) {
                    setState(() {
                      _water = value!;
                    });
                  },
                ),
                const Text(
                  '설사',
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  value: _head,
                  onChanged: (value) {
                    setState(() {
                      _head = value!;
                    });
                  },
                ),
                const Text(
                  '발열',
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  value: _thin,
                  onChanged: (value) {
                    setState(() {
                      _thin = value!;
                    });
                  },
                ),
                const Text(
                  '가는 변',
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  value: _bloodung,
                  onChanged: (value) {
                    setState(() {
                      _bloodung = value!;
                    });
                  },
                ),
                const Text(
                  '혈변',
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  value: _temper,
                  onChanged: (value) {
                    setState(() {
                      _temper = value!;
                    });
                  },
                ),
                const Text(
                  '체온 불안정',
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(30.0),
            child: Text(
              "신체에 다른 변화가 있나요?(모두 선택해주세요.)",
              style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: 21.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  value: _ko,
                  onChanged: (value) {
                    setState(() {
                      _ko = value!;
                    });
                  },
                ),
                const Text(
                  "꼬르륵 소리가 들린다",
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  value: _sossage,
                  onChanged: (value) {
                    setState(() {
                      _sossage = value!;
                    });
                  },
                ),
                const Expanded(
                    child: Text(
                  "우/상복부에 소시지모양의 덩어리가 만져짐",
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0),
                ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  value: _bed,
                  onChanged: (value) {
                    setState(() {
                      _bed = value!;
                    });
                  },
                ),
                const Text(
                  '삭욕부진 및 활동량 감소',
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  value: _banggu,
                  onChanged: (value) {
                    setState(() {
                      _banggu = value!;
                    });
                  },
                ),
                const Text(
                  '복부팽만 및 방구배출 없음',
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  value: _sleep,
                  onChanged: (value) {
                    setState(() {
                      _sleep = value!;
                    });
                  },
                ),
                const Text(
                  '기면',
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  value: _redpoint,
                  onChanged: (value) {
                    setState(() {
                      _redpoint = value!;
                    });
                  },
                ),
                const Text(
                  '복부에 붉은 반점이 있다.',
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  value: _nop,
                  onChanged: (value) {
                    setState(() {
                      _nop = value!;
                    });
                  },
                ),
                const Text(
                  '특별한거 없음',
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                "내 결과 확인",
                style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
              IconButton(
                onPressed: () {
                  String diagnosisResult = _getDiagnosis();
                  print("진단 결과: $diagnosisResult");

                  showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext context) {
                      return ResultPage(name: diagnosisResult);
                    },
                  );
                },
                icon: const Icon(Icons.sick_outlined),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ]));
  }
}
