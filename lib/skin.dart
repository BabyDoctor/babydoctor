import 'package:flutter/material.dart';
import 'main.dart';
import 'my_container.dart';

class Skin extends StatefulWidget {

  const Skin({super.key});

  @override
  State<Skin> createState() => _SkinState();
}

class _SkinState extends State<Skin> {

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
                      '내 피부질환 검색'
                  ),
                ],
              ),
                    Center(
                      child: TextButton(
                        child: const MyContainer(
                          width: 150.0,
                          height: 70.0,
                          padding: EdgeInsets.all(20.0),
                          margin: EdgeInsets.all(20.0),
                          text: '앨범',
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Center(
                      child: TextButton(
                        child: const MyContainer(
                          width: 150.0,
                          height: 70.0,
                          padding: EdgeInsets.all(20.0),
                          margin: EdgeInsets.all(20.0),
                          text: '실행',
                        ),
                        onPressed: () {},
                        ),
                    ),
                  ],
                ),
              ),
      )
      );
  }
}