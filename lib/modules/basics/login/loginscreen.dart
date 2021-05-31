import 'package:flutter/material.dart';
import 'package:myapp/shared/component/components.dart';


class LoginScreen extends StatefulWidget {
  // ignore: non_constant_identifier_names
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // ignore: non_constant_identifier_names
  var EmailAddress = TextEditingController();

  // ignore: non_constant_identifier_names
  var PasswordAddress = TextEditingController();

  var formkey = GlobalKey<FormState>();

  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Login',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),),
                  SizedBox(height: 40),
                  defaultTextFormField(
                      controller: EmailAddress,
                      label: 'EmailAddress',
                      prefix: Icons.email,
                      type: TextInputType.emailAddress,
                      validate: (String value){
                        if(value.isEmpty)
                        {
                          return 'Email Address can not be empty';
                        }
                        return null;
                      }
                  ),
                  SizedBox(height: 15),
                  defaultTextFormField(
                      controller: PasswordAddress,
                      label: 'Password',
                      prefix: Icons.lock,
                      type: TextInputType.phone,
                      validate: (String value)
                      {
                        if(value.isEmpty)
                        {
                          return 'Password can not be empty ';
                        }
                        return null;
                      },
                      suffix: isPassword ? Icons.visibility : Icons.visibility_off,
                      isPassword: isPassword,
                      suffixPressed: (){
                        setState(() {
                          isPassword = !isPassword;
                        });
                      }
                  ),
                  SizedBox(height: 10),
                  defaultbutton(
                      function: (){
                        if(formkey.currentState.validate())
                        {
                          print(EmailAddress.text);
                          print(PasswordAddress.text);
                        }
                      },
                      text: 'login'
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account',
                          style: TextStyle(
                              fontSize: 15 ,
                              fontWeight: FontWeight.bold
                          )),
                      TextButton(
                        onPressed: (){
                        },
                        child: Text('Register Now'),
                      )


                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
