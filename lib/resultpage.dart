import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'findhospital.dart';

class ResultPage extends StatefulWidget {
  final String name;

  ResultPage({required this.name});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String? detail;
  String baseUrl = 'http://15.165.100.55:8000/disease';
  @override
  void initState() {
    super.initState();
    fetchDetail();
  }

  fetchDetail() async {
    final response = await http.get(Uri.parse(baseUrl));
    List<dynamic> list = [];

    if(response.statusCode == 200){
      list = jsonDecode(utf8.decode(response.bodyBytes));
      for (var item in list) {
        if (item['name'] == widget.name) {
          setState(() {
            detail = item['detail'];
          });
          break;
        }
      }
    } else {
      print('Error');
    }
  }
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      title: const Text('진단 결과는 ...', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
      content:Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Center(child: Text('${widget.name}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
                  subtitle: const Row(mainAxisAlignment: MainAxisAlignment.end,children: [Text('이 의심됩니다.', style: TextStyle(color: Colors.red))]),
                ),
                const Divider(),
                ExpansionTile(
                  title: const Text('자세한 설명 보기', style: TextStyle(fontSize: 16, color: Colors.blue)),
                  children: <Widget>[
                    SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Text(detail ?? 'Loading...', style: const TextStyle(fontSize: 14)),
                      ),
                    ),
                  ],
                ),
                const Divider(),
                ListTile(
                  title: const Center(child: Text('관련된 병원 찾기', style: TextStyle(fontSize: 16, color: Colors.blue))),
                  onTap: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FindHospital()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),

      actions: <Widget>[
        TextButton(
          child: const Text('Close', style: TextStyle(color: Colors.blue)),
          onPressed: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
        ),
      ],
    );
  }

}
