import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/models/users/user_model.dart';



// ignore: must_be_immutable
class UsersModel extends StatelessWidget {


  // ignore: non_constant_identifier_names
  List <UserModel> Users =[
    UserModel(
        id: 1,
        name: 'Adullah Mansour',
        phone: '+201554847265'
    ),
    UserModel(
        id: 2,
        name: 'Hassan Ahmed',
        phone: '+201526568794'
    ),
    UserModel(
        id: 3,
        name: 'mark mark',
        phone: '+20115647545'
    ),
    UserModel(
        id: 4,
        name: 'Adle Mohamed',
        phone: '+201554847265'
    ),
    UserModel(
        id: 1,
        name: 'Adullah Mansour',
        phone: '+201554847265'
    ),
    UserModel(
        id: 2,
        name: 'Hassan Ahmed',
        phone: '+201526568794'
    ),
    UserModel(
        id: 3,
        name: 'mark mark',
        phone: '+20115647545'
    ),
    UserModel(
        id: 4,
        name: 'Adle Mohamed',
        phone: '+201554847265'
    ),
    UserModel(
        id: 1,
        name: 'Adullah Mansour',
        phone: '+201554847265'
    ),
    UserModel(
        id: 2,
        name: 'Hassan Ahmed',
        phone: '+201526568794'
    ),
    UserModel(
        id: 3,
        name: 'mark mark',
        phone: '+20115647545'
    ),
    UserModel(
        id: 4,
        name: 'Adle Mohamed',
        phone: '+201554847265'
    ),
    UserModel(
        id: 1,
        name: 'Adullah Mansour',
        phone: '+201554847265'
    ),
    UserModel(
        id: 2,
        name: 'Hassan Ahmed',
        phone: '+201526568794'
    ),
    UserModel(
        id: 3,
        name: 'mark mark',
        phone: '+20115647545'
    ),
    UserModel(
        id: 4,
        name: 'Adle Mohamed',
        phone: '+201554847265'
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => buildUserItem(Users[index]) ,
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsetsDirectional.only(start: 20.0),
          child: Container(
            height: 1.0,
            color: Colors.grey[300],
          ),
        ),
        itemCount: Users.length,
      ),

    );
  }

  Widget buildUserItem(UserModel user) => Padding(
    padding: const EdgeInsets.all(15.0),
    child: Row(
      children: [
        CircleAvatar(
            radius: 25,
            child:Text('${user.id}',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ))
        ),
        SizedBox(width: 20),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${user.name}',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                )),
            Text('${user.phone}',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15
              ),),
          ],
        )

      ],
    ),
  );
}
