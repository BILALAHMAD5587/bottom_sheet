import 'package:bottom_sheet/db_helper.dart';
import 'package:bottom_sheet/home_screen.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  var emailControler = TextEditingController();
  var passcontroler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Please Login', style: TextStyle(
              fontSize: 30,fontWeight: FontWeight.bold),),
          SizedBox(height: 15,),
          TextField(
            controller: emailControler,
            decoration: InputDecoration(
                hintText: 'Enter Email',
                prefixIcon: Icon(Icons.email_rounded),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)
                )
            ),
          ),
          SizedBox(height: 10,),
          TextField(
            controller: passcontroler,
            decoration: InputDecoration(
                hintText: 'Enter Password',
                prefixIcon: Icon(Icons.password_rounded),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)
                )
            ),
          ),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: ()async{
          if(await DBHelper().Authenticate(emailControler.text.toString(),
               passcontroler.text.toString())){
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => HomeScreen(),));
          } else {
            showDialog(context: context, builder: (context){
              return AlertDialog(
                title: Text('Invalid!'),
                content: Text('Invalid Email or Password'),
                actions: [
                  TextButton(onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute
                      (builder: (context) => LoginPage(),));
                  }, child: Text('Login')),
                  TextButton(onPressed: (){
                    Navigator.pop(context);
                  }, child: Text('Cancel'))
                ],
              );
            });
          }
          }, child: Text('Login'))
        ],
      ),
    );
  }
}
