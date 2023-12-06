import 'package:flutter/material.dart';
import 'resultpage.dart';
import 'main.dart';

class YellowMoon extends StatelessWidget {
  const YellowMoon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage('assets/onlybackcolor.png'),
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
                              const Text('황달',
                                style: TextStyle(color:Color(0xFF455A64),fontWeight: FontWeight.bold, fontSize: 27.0),),
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
  bool _none = false;

  String _getDiagnosis() {
    if (_head && _hot && _none) {
      return name9;//간염
    }
    if (_singyong && _hot &&_eisik) {
      return name10;//담관낭종
    }
    else {
      return "경과관찰 요망";
    }

  }

  List<String> checkList = [];

  var name9 = "간염";
  var name10 = '담관낭종';


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.all(30.0),
                child: Text(
                  "증상이 언제부터 나타났나요?",
                  style: TextStyle(color:Colors.black54,fontWeight: FontWeight.bold, fontSize: 21.0),
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
                    const Text("지금 갑자기",style: TextStyle(color:Colors.black54,fontWeight: FontWeight.bold, fontSize: 17.0),)
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
                    const Text("~5시간",style: TextStyle(color:Colors.black54,fontWeight: FontWeight.bold, fontSize: 17.0),)
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
                    const Text("5~10시간",style: TextStyle(color:Colors.black54,fontWeight: FontWeight.bold, fontSize: 17.0),)
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
                    const Text("~3일",style: TextStyle(color:Colors.black54,fontWeight: FontWeight.bold, fontSize: 17.0),)
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(30.0),
                child: Text(
                  "증상이 얼마나 지속되나요?",
                  style: TextStyle(color:Colors.black54,fontWeight: FontWeight.bold, fontSize: 21.0),
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
                    const Text("올랐다 내렸다 자주 반복",style: TextStyle(color:Colors.black54,fontWeight: FontWeight.bold, fontSize: 17.0),)
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
                    const Text("~30분",style: TextStyle(color:Colors.black54,fontWeight: FontWeight.bold, fontSize: 17.0),)
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
                    const Text('1시간 이상',style: TextStyle(color:Colors.black54,fontWeight: FontWeight.bold, fontSize: 17.0),)
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(30.0),
                child: Text(
                  "동반된 다른 증상이 있나요? (모두 체크해주세요.)",
                  style: TextStyle(color:Colors.black54,fontWeight: FontWeight.bold, fontSize: 21.0),
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
                    const Text("구토",style: TextStyle(color:Colors.black54,fontWeight: FontWeight.bold, fontSize: 17.0),)
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
                    const Text("복통",style: TextStyle(color:Colors.black54,fontWeight: FontWeight.bold, fontSize: 17.0),)
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
                    const Text('회색변',style: TextStyle(color:Colors.black54,fontWeight: FontWeight.bold, fontSize: 17.0),)
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
                    const Text("발열",style: TextStyle(color:Colors.black54,fontWeight: FontWeight.bold, fontSize: 17.0),)
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
                      value: _none,
                      onChanged: (value) {
                        setState(() {
                          _none = value!;
                        });
                      },
                    ),
                    const Text('쇠약감',style: TextStyle(color:Colors.black54,fontWeight: FontWeight.bold, fontSize: 17.0),)
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text("내 결과 확인",style: TextStyle(color:Colors.black54,fontWeight: FontWeight.bold, fontSize: 20.0),),
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
            ]
        )
    );
  }
}