import 'dart:math';
import 'package:flutter/material.dart';
import 'package:myapp/modules/pmi/pmi_result.dart';
import 'package:myapp/shared/component/components.dart';


class PMICal extends StatefulWidget {
  @override
  _PMICalState createState() => _PMICalState();
}

class _PMICalState extends State<PMICal> {
  bool isMale = true;
  var height = 120.0;
  var weight = 40;
  // ignore: non_constant_identifier_names
  var Age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black.withBlue(400),
      appBar: AppBar(
        title:Text('PMI CALCULATOR'),
        backgroundColor: Colors.black.withBlue(400),
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              isMale = true;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadiusDirectional.circular(10),
                              color: isMale ? Colors.blue : Colors.grey[400],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  image: AssetImage('assets/images/male.jpg'),
                                  height: 80,
                                  width: 90,
                                ),
                                SizedBox(height: 15),
                                Text('MALE',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              isMale = false;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadiusDirectional.circular(10),
                              color: !isMale ? Colors.blue : Colors.grey[400],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  image: AssetImage('assets/images/female.jpg'),
                                  height: 80,
                                  width: 90,
                                ),
                                SizedBox(height: 15),
                                Text('FEMALE',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadiusDirectional.circular(10)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('HEIGHT',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        )),
                    // SizedBox(height: 20),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text('${height.round()}',
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w900,
                              )),
                          SizedBox(width:5),
                          Text('cm',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              )),
                        ]),
                    Slider(
                      value: height,
                      max: 200,
                      min: 60,
                      onChanged: (value){
                        setState(() {
                          height = value;
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadiusDirectional.circular(10)
                              ),
                              child: Column(
                                  crossAxisAlignment:CrossAxisAlignment.center ,
                                  children: [
                                    Text('Age',
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Text('${Age.round()}',
                                        style: TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.w900,
                                        )),
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          FloatingActionButton(
                                            onPressed: (){
                                              setState(() {
                                                Age--;
                                              });
                                            },
                                            heroTag: 'Age-',
                                            mini: true,
                                            child: Icon(Icons.remove),
                                          ),
                                          FloatingActionButton(
                                            onPressed: (){
                                              setState(() {
                                                Age++;
                                              });
                                            },
                                            heroTag: 'Age-',
                                            mini: true,
                                            child: Icon(Icons.add),
                                          )
                                        ]),
                                  ]
                              )),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadiusDirectional.circular(10)
                                ),
                                child: Column(
                                    crossAxisAlignment:CrossAxisAlignment.center ,
                                    children: [
                                      Text('Weight',
                                          style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                          )),
                                      Text('${weight.round()}',
                                          style: TextStyle(
                                            fontSize: 40,
                                            fontWeight: FontWeight.w900,
                                          )),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          FloatingActionButton(
                                            onPressed: (){
                                              setState(() {
                                                weight--;
                                              });
                                            },
                                            heroTag: 'weight-',
                                            mini: true,
                                            child: Icon(Icons.remove),
                                          ),
                                          FloatingActionButton(
                                            onPressed: (){
                                              setState(() {
                                                weight++;
                                              });
                                            },
                                            heroTag: 'weight+',
                                            mini: true,
                                            child: Icon(Icons.add),
                                          )
                                        ],
                                      )
                                    ]
                                ))
                        ),

                      ]))),
          Container(
            width: double.infinity,
            height: 50,
            color: Colors.black54,
            child: MaterialButton(
                onPressed: (){
                  // ignore: non_constant_identifier_names
                  var Result = weight / pow(height / 100 , 2);
                  print(Result.round());
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PmiResult(
                          Age: Age,
                          isMale: isMale,
                          Result: Result.round(),
                        ),
                      )
                  );
                },
                child: Text('Calculate',
                  style: TextStyle(
                    color: Colors.white,
                  ),)
            ),
          )
        ],
      ),


    );
  }
}
