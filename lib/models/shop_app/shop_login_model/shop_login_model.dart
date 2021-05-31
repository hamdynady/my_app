class ShopLoginModel {
   bool status;
   String message;
   UserData data;

   ShopLoginModel.fromJson( Map<String,dynamic> json)
   {
     status = json['status'];
     message = json['message'];
     data = json['data'] != null ? UserData.fromJson(json['data']) : null;
   }

}

class UserData{

  int id;
  String name;
  String message;
  String phone;
  String image;
  String points;
  String credit;
  String token;
  
  //named constructor
  UserData.fromJson(Map<String, dynamic> json)
  {
     id = json['id'];
     name = json['name'];
     message = json['message'];
     phone = json['phone'];
     image = json['image'];
     points = json['points'];
     credit = json['credit'];
     token = json['token'];
  }
}