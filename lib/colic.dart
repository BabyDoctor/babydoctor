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
                decoration: BoxDecoration(
                  image: DecorationImage(
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
                                '복통', style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold, fontSize: 20.0),
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text(
              "증상이 가장 뚜력하게 반응하는 부위는?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  value: _suddenly,
                  onChanged: (value) {
                    setState(() {
                      _suddenly = value!;
                    });
                  },
                ),
                Text("명치")
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
                  value: _one,
                  onChanged: (value) {
                    setState(() {
                      _one = value!;
                    });
                  },
                ),
                Text("아랫배")
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
                Text("아랫배 왼쪽")
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
                Text("아랫배 오른쪽")
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
                Text("특정부위 없음")
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text(
              "언제부터 아팠나요?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
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
                Text("갑자기")
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
                Text("~3일")
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
                Text('~5일')
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
                Text('일주일이상')
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text(
              "얼마나 지속 되나요?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
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
                Text("1~2분")
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
                Text("~3분")
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
                Text('5분~')
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text(
              "동반된 다른 증상이 있나요?(모두 선택해주세요.)",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
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
                Text("변비")
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
                Text("구토")
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
                Text('설사')
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
                Text('발열')
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
                Text('가는 변')
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
                Text('혈변')
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
                Text('체온 불안정')
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text(
              "신체에 다른 변화가 있나요?(모두 선택해주세요.)",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
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
                Text("꼬르륵 소리가 들린다")
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
                Text("우/상복부에 소시지 모양의 덩어리가 만져진다.")
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
                Text('삭욕부진 및 활동량 감소')
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
                Text('복부팽만 및 방구배출 없음')
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
                Text('기면')
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
                Text('복부에 붉은 반점이 있다.')
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
                Text('특별한거 없음')
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text("내 결과 확인"),
              IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      barrierDismissible: true, // 바깥 영역 터치시 닫을지 여부
                      builder: (BuildContext context) {
                        return ResultPage(
                          name: 'test',
                        );
                      });
                },
                icon: Icon(Icons.sick_outlined),
              )
            ],
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
