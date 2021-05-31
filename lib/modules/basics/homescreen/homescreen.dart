import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class MyHomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.grey[800],
            leading: Icon( Icons.menu),
            title: Text('Home Page',
                style: TextStyle(
                  color: Colors.blue,
                )),
            centerTitle: true,
            actions: [
              IconButton(
                icon : Icon( Icons.search),
                iconSize: 25,
                onPressed: (){},
              ),
              IconButton(
                icon: Icon(Icons.notification_important),
                iconSize: 25,
                onPressed: (){},
              )
            ]
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.only(
                    topEnd: Radius.circular(10),
                    topStart: Radius.circular(20),
                  ),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                width: 200,
                child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Image(
                        image: NetworkImage('https://cdn.pixabay.com/photo/2015/04/19/08/33/flower-729512__340.jpg'),
                        height: 200,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        width: double.infinity,
                        color: Colors.black.withOpacity(.3),
                        padding: EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 5
                        ),
                        child: Text('Flower',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,

                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          ],
        )
    );
  }


}