import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ResultPage extends StatefulWidget {
  final String name;

  ResultPage({required this.name});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String? detail;
  String baseUrl = 'http://10.0.2.2:8000/disease';
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
      title: Text('Your Result is'),
      content: Container(
        width: MediaQuery.of(context).size.width * 0.9, // width를 조절
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: Text('Detail : ', style: TextStyle(fontSize: 16)),
                subtitle: Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Text(detail ?? 'Loading...'),
                ),
              ),

            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Close'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

}
