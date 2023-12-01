import 'package:flutter/material.dart';
import 'resultpage.dart';
import 'main.dart';


class PooPoo extends StatelessWidget {
  const PooPoo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(outPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(onPressed: (){
                    Navigator.of(context).pop();
                  },
                    icon: Icon(
                      Icons.child_care,
                      color: Theme.of(context).colorScheme.onPrimary,
                      size: 40.0,
                    ),
                  ),
                  const SizedBox(
                    width: outPadding,
                  ),
                  const Text(
                      '변비'
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
            ],
          ),
        ),
      ),
    );
  }
}


var name7 = "위장관폐쇄";
var name8 = '큰창자증';


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
  bool _head = false;
  bool _nop = false;


  String _getDiagnosis() {
    if (_ten && _hot && _eisik) {
      return name8; // "큰창자증"
    } else {
      return "경과관찰";
    }
  }



  List<String> checkList = [];


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text(
                  "증상이 언제부터 나타났나요?",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Checkbox(
                      shape:RoundedRectangleBorder (
                          borderRadius: BorderRadius.circular(18)
                      ),
                      value: _suddenly,
                      onChanged: (value) {
                        setState(() {
                          _suddenly = value!;
                        });
                      },
                    ),
                    Text("지금 갑자기")
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Checkbox(
                      shape:RoundedRectangleBorder (
                          borderRadius: BorderRadius.circular(18)
                      ),
                      value: _one,
                      onChanged: (value) {
                        setState(() {
                          _one = value!;
                        });
                      },
                    ),
                    Text("~5시간")
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Checkbox(
                      shape:RoundedRectangleBorder (
                          borderRadius: BorderRadius.circular(18)
                      ),
                      value: _three,
                      onChanged: (value) {
                        setState(() {
                          _three = value!;
                        });
                      },
                    ),
                    Text("5~10시간")
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Checkbox(
                      shape:RoundedRectangleBorder (
                          borderRadius: BorderRadius.circular(18)
                      ),
                      value: _seconds,
                      onChanged: (value) {
                        setState(() {
                          _seconds = value!;
                        });
                      },
                    ),
                    Text("~3일")
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text(
                  "동반된 다른 증상?",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Checkbox(
                      shape:RoundedRectangleBorder (
                          borderRadius: BorderRadius.circular(18)
                      ),
                      value: _threee,
                      onChanged: (value) {
                        setState(() {
                          _threee = value!;
                        });
                      },
                    ),
                    Text("복통")
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Checkbox(
                      shape:RoundedRectangleBorder (
                          borderRadius: BorderRadius.circular(18)
                      ),
                      value: _fivee,
                      onChanged: (value) {
                        setState(() {
                          _fivee = value!;
                        });
                      },
                    ),
                    Text("담즙이 섞인 구토")
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Checkbox(
                      shape:RoundedRectangleBorder (
                          borderRadius: BorderRadius.circular(18)
                      ),
                      value: _ten,
                      onChanged: (value) {
                        setState(() {
                          _ten = value!;
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
                      shape:RoundedRectangleBorder (
                          borderRadius: BorderRadius.circular(18)
                      ),
                      value: _nop,
                      onChanged: (value) {
                        setState(() {
                          _nop = value!;
                        });
                      },
                    ),
                    Text('없음')
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text(
                  "동반된 다른 증상이 있나요? (모두 체크해주세요.)",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Checkbox(
                      shape:RoundedRectangleBorder (
                          borderRadius: BorderRadius.circular(18)
                      ),
                      value: _hot,
                      onChanged: (value) {
                        setState(() {
                          _hot = value!;
                        });
                      },
                    ),
                    Text("복부팽만")
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Checkbox(
                      shape:RoundedRectangleBorder (
                          borderRadius: BorderRadius.circular(18)
                      ),
                      value: _eisik,
                      onChanged: (value) {
                        setState(() {
                          _eisik = value!;
                        });
                      },
                    ),
                    Text("좌측 복부 덩어리 만짐")
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Checkbox(
                      shape:RoundedRectangleBorder (
                          borderRadius: BorderRadius.circular(18)
                      ),
                      value: _singyong,
                      onChanged: (value) {
                        setState(() {
                          _singyong = value!;
                        });
                      },
                    ),
                    Text('변에서 소화되지 않는 분비물 발견')
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Checkbox(
                      shape:RoundedRectangleBorder (
                          borderRadius: BorderRadius.circular(18)
                      ),
                      value: _head,
                      onChanged: (value) {
                        setState(() {
                          _head = value!;
                        });
                      },
                    ),
                    Text("없음")
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text("내 결과 확인"),
                  IconButton(
                    onPressed: () {
                      // 결과 확인 버튼을 눌렀을 때 진단 결과 출력
                      String diagnosisResult = _getDiagnosis();
                      print("진단 결과: $diagnosisResult");

                      // 다이얼로그 띄우기
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
            ]
        )
    );
  }
}