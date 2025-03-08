import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:live_project/bottomnavigationpage.dart';
import 'package:live_project/club.dart';
import 'package:live_project/clubbottomnavigation.dart';
import 'package:live_project/clubsecondpage.dart';
import 'package:live_project/loginmodel.dart';
import 'package:live_project/passwordresetpage.dart';
import 'package:live_project/signuppage.dart';
import 'package:live_project/signuppage2.dart';
import 'package:http/http.dart' as http;
class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _Loginpage();
}

class _Loginpage extends State<Loginpage> {
  int tabIndex = 0;
  bool _passwordvisible = false;

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailText = TextEditingController();
  TextEditingController passText = TextEditingController();

  bool isEmailValid(String email) {
    final emailRegex = RegExp(
        r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    return emailRegex.hasMatch(email);
  }

  bool isPasswordValid(String password) {
    return password != null && password.length >= 5;
  }

  bool isLoading = false;
  LoginResponse ? login;

  @override
  Future<void> loginbutton() async {
    setState(() {
      isLoading = true;
    });
    Map<String, String> body = {
      'identifier': emailText.text,
      'password': passText.text,
      'user_type': 'USER',
    };

    print('Bodyparam.......${body}');
    final response = await http.post(
      Uri.parse('https://server-php-8-3.technorizen.com/kyna/api/Login'),
      headers: <String, String>{
        'Accept': 'application/json'
      },
      body: body,
    );
    if (response.statusCode == 200){
      LoginResponse datamodel =  LoginResponse.fromJson(jsonDecode(response.body));
    print('Status:{$datamodel.status}');
    print('Response Body:${response.body}');

    setState(() {
      login = datamodel;
      if (login?.status == '1') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Login Successful!'),
        ));
        switch(tabIndex){
          case 0:{
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context)=>Bottomnavigationpage()),
            );
          }break;
          case 1:{
            print('hjkkkjj.........');
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context)=>Clubbottomnavigation()),
            );
          }break;
          case 2:{
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context)=>Bottomnavigationpage()),
            );
          }
        }
      }
      else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Login Failed! Please try again'),
        ));
      }
      isLoading = false;
    });
  }

  else{
  print('Api call failed or returned an error');
  setState(() {
  isLoading = false;
  });
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  content:Text('Api error please try again later')));
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        automaticallyImplyLeading: false,

      ),
      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left:10),
              child: Image.asset('assets/Frame 2.png',
              width: MediaQuery.of(context).size.width * 0.4,
        
              ),
            ),
            SizedBox(height:30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap:(){
                    setState(() {
                      tabIndex=0;
                    });
                  },
                  child: Container(
                      padding:EdgeInsets.symmetric(vertical:10,horizontal:40),
                      decoration:BoxDecoration(
                        color:tabIndex==0?Color(0XFF007AFF):Color(0XFFFBFBFB),
                        borderRadius:BorderRadius.circular(10),

                      ),
                      child: Text('User',
                        style:TextStyle(color:tabIndex==0?Color(0XFFFFFFFF):Color(0XFF757575),
                            fontSize:14,fontWeight:FontWeight.w500),)
                  ),
                ),
                GestureDetector(
                  onTap:(){
                    setState(() {
                      tabIndex=1;
                    });
                  },
                  child: Container(
                      padding:EdgeInsets.symmetric(vertical:10,horizontal:40),
                      decoration:BoxDecoration(
                        color:tabIndex==1?Color(0XFF007AFF):Color(0XFFFBFBFB),
                        borderRadius:BorderRadius.circular(10),

                      ),
                      child: Text('Club',
                        style:TextStyle(color:tabIndex==1?Color(0XFFFFFFFF):Color(0XFF757575),
                            fontSize:14,fontWeight:FontWeight.w500),)
                  ),
                ),
                GestureDetector(
                  onTap:(){
                    setState(() {
                      tabIndex=2;
                    });
                  },
                  child: Container(
                      padding:EdgeInsets.symmetric(vertical:10,horizontal:40),
                      decoration:BoxDecoration(
                        color:tabIndex==2?Color(0XFF007AFF):Color(0XFFFBFBFB),
                        borderRadius:BorderRadius.circular(10),

                      ),
                      child: Text('Coach',
                        style:TextStyle(color:tabIndex==2?Color(0XFFFFFFFF):Color(0XFF757575),
                            fontSize:14,fontWeight:FontWeight.w500),)
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(left:20,top:20),
              child: Text('Login',style:TextStyle(fontSize:24,
                  color:Color(0XFF000000),
                  fontWeight:FontWeight.w700
              ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:20,top:10),
              child: Text('Enter your email and password',
                style:TextStyle(color:Color(0XFF9DB2BF),
                    fontSize:16,fontWeight:FontWeight.w400),),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    margin:EdgeInsets.symmetric(vertical:10,horizontal:10),
                    decoration:BoxDecoration(
                      borderRadius:BorderRadius.circular(40),
                    ),
                    child: TextFormField(
                      controller:emailText,
                      decoration:InputDecoration(
                        border:InputBorder.none,
                        fillColor:Color(0XFFF7F8F8),
                        filled:true,
                        hintText:('Email Address / Mobile number'),
                        hintStyle:TextStyle(color:Color(0XFFADA4A5),
                            fontSize:14,fontWeight:FontWeight.w400),
                        prefixIcon:Image.asset('assets/Message (1).png'),
                        contentPadding:EdgeInsets.symmetric(vertical:15),
                      ),
                      validator:(email){
                        if(email!=null && isEmailValid(email)){
                          return null;
                        }
                        else
                        {
                          return 'Enter a valid email';
                        }
        
                      },
        
                    ),
                  ),
                  SizedBox(height:5),
                  Container(
                    margin:EdgeInsets.symmetric(vertical:5,horizontal:10),
                    decoration:BoxDecoration(
                      // border:Border.all(color:Colors.red,width:2),
                      borderRadius:BorderRadius.circular(40),
                    ),
                    child: TextFormField(
                      controller:passText,
                      keyboardType:TextInputType.text,
                      // obscureText:true,
                      obscureText: !_passwordvisible,
                      decoration:InputDecoration(
                        border:InputBorder.none,
                        fillColor:Color(0XFFF7F8F8),
                        filled:true,
                        hintText:('Password'),
                        hintStyle:TextStyle(color:Color(0XFFADA4A5),
                            fontSize:14,fontWeight:FontWeight.w400),
                        prefixIcon:Image.asset('assets/Lock.png'),
                        contentPadding:EdgeInsets.symmetric(vertical:15),
                        suffixIcon:IconButton(
                            icon:Icon(
                              _passwordvisible ? Icons.visibility : Icons.visibility_off,
                            ),
                            onPressed:(){
                              setState(() {
                                _passwordvisible = !_passwordvisible;
                              });
                            }
        
                        ),
                      ),
                      validator:(password){
                        if(password!=null && isPasswordValid(password)){
                          return null;
                        }
                        else{
                          return 'Enter a valid password(min 5 characters)';
                        }
                      },
        
                    ),
                  ),
                  Center(
                    child: GestureDetector(
                      onTap:(){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=>Passwordresetpage()),
                        );
                      },
                      child: Text('Forgot your password?',
                        style:TextStyle(color:Color(0XFF007AFF),fontSize:12,fontWeight:FontWeight.w400,
                            decoration:TextDecoration.underline,decorationColor:Color(0XFF007AFF)),),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical:20,horizontal:30),
                    child: isLoading?Center(child:CircularProgressIndicator()):
                    ElevatedButton(
                      style:ElevatedButton.styleFrom(
                        backgroundColor:Color(0XFF007AFF),
                        foregroundColor:Color(0XFFFFFFFF),
                        minimumSize:Size(300, 50),
        
                      ),
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false)
                        {
                          print('Email:$emailText,Pass:$passText');
                          loginbutton();
                        }
                        else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Please enter valid credentials')),
                          );
                        }
                      },
                      child: Text('Login',
                        style:TextStyle(fontSize:17,fontWeight:FontWeight.w700),),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?",
                        style:TextStyle(color:Color(0XFF909090),fontSize:16,fontWeight:FontWeight.w600),),
                      GestureDetector(
                        onTap:(){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)=>Signuppage()),
                          );
                        },
                        child: Text('Sign Up',
                          style:TextStyle(color:Color(0XFFF007AFF),fontSize:16,fontWeight:FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height:10),
                  Center(
                    child: Text('OR',
                      style:TextStyle(fontSize:16,fontWeight:FontWeight.w500),),
                  ),
                  SizedBox(height:20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/google.png'),
                      SizedBox(width:5),
                      GestureDetector(
                        onTap:(){


                        },
                        child: Text('Sign In with Google',
                          style:TextStyle(color:Color(0XFF909090),fontSize:18,fontWeight:FontWeight.w600),),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}

