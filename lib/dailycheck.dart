import 'package:flutter/material.dart';
class DailyCheck extends StatelessWidget{
  final _myController=TextEditingController();

  void dispose(){
    _myController.dispose();

  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(title: const Text('데일리 체크'),),
        body:const Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '날짜'
                    ),


                  ),
                ]
            ),
          ),
        )
    );
  }
}