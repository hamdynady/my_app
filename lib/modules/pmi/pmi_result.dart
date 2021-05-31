import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PmiResult extends StatelessWidget {
  final bool isMale;
  // ignore: non_constant_identifier_names
  final int Age;
  // ignore: non_constant_identifier_names
  final int Result;
  PmiResult({
    // ignore: non_constant_identifier_names
    @required this.Age,
    // ignore: non_constant_identifier_names
    @required this.Result,
    @required this.isMale,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Result Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Gender: ${isMale ? 'Male': 'Female'}',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),),
            Text('Age : $Age',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),),
            Text('Result : $Result',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),),
          ],
        ),
      ),
    );
  }
}
