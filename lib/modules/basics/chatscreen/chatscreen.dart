import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[750],
        elevation: 0.0,
        titleSpacing: 20,
        title: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage('https://www.logodesign.net/images/illustration-logo.png') ,

              ),
              SizedBox(width: 15),
              Text('Chat',
                style: TextStyle(
                  color: Colors.black,
                ),),
            ]),
        actions: [
          IconButton(
              icon: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blue,
                child: Icon(Icons.camera_alt),
              ),
              onPressed: (){}
          ),
          IconButton(
            icon: CircleAvatar(
              child: Icon(Icons.edit),
              backgroundColor: Colors.blue,
            ),
            onPressed: (){},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey ,
                ),
                child: Row(
                    children: [
                      Icon(Icons.search),
                      Text('Search'),
                    ]),
              ),
              SizedBox(height: 5),
              Container(
                height: 100,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder : (context, index) => buildStoryItem(),
                  separatorBuilder:(context, index) => SizedBox(width: 10),
                  itemCount: 10,
                ),
              ),
              SizedBox(height: 30),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => buildChatItem(),
                separatorBuilder: (context, index)  => SizedBox(height: 10),
                itemCount: 20,
              )
            ],
          ),
        ),

      ),


    );
  }

  // 1- Build item
  Widget buildChatItem() =>   Row(
      children: [
        Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 30,
                // backgroundImage: AssetImage('assets/1.jpg'),
              ),
              CircleAvatar(
                radius: 8,
                backgroundColor: Colors.white,
              ),
              CircleAvatar(
                radius: 7,
                backgroundColor: Colors.green,
              ),
            ]),
        SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('hamdy nady ibrahim ',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Row(
                  children : [

                    Text('any Message is written here',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(width:5),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10
                      ),
                      child: Container(
                        width: 7,
                        height: 7,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,

                        ),
                      ),
                    ),
                    Text('2:35 pm',
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),)
                  ]
              )
            ],
          ),
        ),

      ]
  );
  Widget buildStoryItem() => Container(
    width: 60,
    child: Column(
      children: [
        Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 30,
                // backgroundImage: AssetImage('assets/1.jpg'),
              ),
              CircleAvatar(
                radius: 8,
                backgroundColor: Colors.white,
              ),
              CircleAvatar(
                radius: 7,
                backgroundColor: Colors.green,
              ),
            ]),
        SizedBox(height: 3),
        Center(
          child: Text('hamdy nady ibrahim ',
            style:TextStyle(
                fontWeight: FontWeight.bold),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );

}
