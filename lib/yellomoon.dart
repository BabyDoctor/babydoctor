import 'package:flutter/material.dart';
import 'resultpage.dart';
import 'main.dart';

class YellowMoon extends StatelessWidget {
  const YellowMoon({super.key});

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
                                '황달'
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
                          ]
                      )
            )
                )
            );
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
            "증상이 얼마나 지속되나요?",
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
              Text("올랐다 내렸다 자주 반복")
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
              Text("~30분")
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
              Text('1시간 이상')
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
                  Text("구토")
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
                    value: _singyong,
                    onChanged: (value) {
                      setState(() {
                        _singyong = value!;
                      });
                    },
                  ),
                  Text('회색변')
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
                  Text("발열")
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
                  Text('쇠약감')
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
                          return ResultPage(name: 'test',);
                        }
                    );
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
