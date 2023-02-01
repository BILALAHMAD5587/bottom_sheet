import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen '),
      ),
      body:Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.green.shade300,
            child: Text('success Full Login', style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 78
            ),),
          )
        ],
      ),),
    );
  }
}
