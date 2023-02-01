import 'package:bottom_sheet/db_helper.dart';
import 'package:bottom_sheet/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:HOmePage(),
    );
  }
}

class HOmePage extends StatelessWidget {
 var usernameControler = TextEditingController();
 var EmailControler = TextEditingController();
 var MobnoControler = TextEditingController();
 var passControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BOttom Sheet'),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                showModalBottomSheet(context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(21),
                          topRight: Radius.circular(21))
                    ),
                    builder: (context){
                  return Container(height: 600,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Create Account', style: TextStyle(
                          fontSize: 20,fontWeight: FontWeight.w700
                        ),),
                      SizedBox(height: 15,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: usernameControler,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: 'Enter Username',
                            prefixIcon: Icon(Icons.account_box_rounded),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)
                            )
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: EmailControler,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: 'Enter Email',
                              prefixIcon: Icon(Icons.email_rounded),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)
                              )
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: MobnoControler,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Enter Monil No',
                              prefixIcon: Icon(Icons.contact_page_rounded),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)
                              )
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: passControler,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            hintText: 'Enter Password',
                              prefixIcon: Icon(Icons.password_rounded),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)
                              )
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        ElevatedButton(onPressed: ()async{
                          if( await DBHelper().isEmailExtis(EmailControler.text.toString())) {
                           showDialog(context: context, builder: (context){
                             return AlertDialog(
                               title: Text('Email Already Registred'),
                               content: Text('You hsve Already Registed With this Emial'),
                               actions: [
                                 TextButton(onPressed: (){
                                   Navigator.pushReplacement(context, MaterialPageRoute
                                     (builder: (context) => LoginPage(),));
                                 }, child: Text('Login')),
                                 TextButton(onPressed: (){
                                   Navigator.pop(context);
                                 }, child: Text('Sign-Up again '))
                               ],
                             );
                           });
                          } else {
                            DBHelper().signUp(
                                usernameControler.text.toString(),
                                EmailControler.text.toString(),
                                MobnoControler.text.toString(),
                                passControler.text.toString());
                          }
                        }, child: Text('Sign in')),
                      ],)
                    ],),
                  );},

                );
              }, child: Text('Sign up Screen'),),
              SizedBox(width: 20,),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
              }, child: Text('Log in Screen'))
            ],
          ),
        ),
      ),
    );
  }
}
