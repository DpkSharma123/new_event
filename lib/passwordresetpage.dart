import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:live_project/otppage.dart';
import 'package:live_project/resetmodel.dart';
import 'package:http/http.dart' as http;
class Passwordresetpage extends StatefulWidget {
  const Passwordresetpage({super.key});

  @override
  State<Passwordresetpage> createState() => _Passwordresetpage();
}

class _Passwordresetpage extends State<Passwordresetpage> {
  TextEditingController emailController = TextEditingController();
  bool isLoading = false;
  Resetmodel ? password;
  @override
  Future<void> submitbutton() async{
    setState(() {
      isLoading = true;
    });
    Map<String,String> body = {
      'email phone' : emailController.text,
       'type':'email'
    };
    print('Bodyparm...............${body}');
      final response = await http.post(Uri.parse('https://server-php-8-3.technorizen.com/kyna/api/Password-Reset'),
      headers :<String,String>{
        'Accept':'application/json'
      },
        body:body,
      );
      if(response.statusCode==200){
        Resetmodel datamodel = Resetmodel.fromJson(jsonDecode(response.body));
        print('Status:${datamodel.status}');
        print('Response Body:${response.body}');


        setState(() {
          password = datamodel;
          if(password?.status =='1'){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('OTP Sent Successfully!'),
              duration:Duration(seconds:1),
            )
            );
            Future.delayed(Duration(seconds:2),(){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=>Otppage(email:emailController.text)),
              );
            });
          }
          else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Failed to send OTP, please try again!'),
            )
            );
          }
          isLoading = false;
        });
      }
      else {
        print('API call failed or returned an error');
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content:Text('API error :please try again later'),
        ));
      }
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar:AppBar(
       leading:GestureDetector(
          onTap:(){
            Navigator.pop(context);
          },
           child: Image.asset('assets/Back-Navs.png')
       ),
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              SizedBox(width:width * 0.18),
              Text('Password Reset',
                style:TextStyle(fontSize:24,fontWeight:FontWeight.w700),),
              Text('Please put your mobile number to reset your password',
                style:TextStyle(color:Color(0XFF9DB2BF),fontSize:16,fontWeight:FontWeight.w400),),
              SizedBox(height:20),
              Row(
                children: [
                  Image.asset('assets/Group 13.png'),
                  SizedBox(width:10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: [
                        Text('SMS',
                          style:TextStyle(fontSize:16,fontWeight:FontWeight.w700),),
                        TextFormField(
                          decoration:InputDecoration(
                            border:InputBorder.none,
                            hintText:'+91 8********7',
                            hintStyle:TextStyle(color:Color(0XFF9E9E9E),fontSize:12,
                            fontWeight:FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height:10),
              Row(
                children: [
                  Image.asset('assets/Email_Box.png'),
                  SizedBox(width:10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: [
                        Text('Email',
                          style:TextStyle(fontSize:16,fontWeight:FontWeight.w700),),
                        TextFormField(
                          controller:emailController,
                          keyboardType:TextInputType.emailAddress,
                          decoration:InputDecoration(
                            border:InputBorder.none,
                            hintText:'joh*******@gmail.com',
                            hintStyle:TextStyle(color:Color(0XFF9E9E9E),fontSize:12,
                                fontWeight:FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Image.asset('assets/laptop1.png'),
              // Spacer(),
              SizedBox(height:50),
              isLoading?Center(child:CircularProgressIndicator()):
              ElevatedButton(
                style:ElevatedButton.styleFrom(
                  backgroundColor:Color(0XFF007AFF),
                  foregroundColor:Color(0XFFFFFFFF),
                  minimumSize:Size(378, 60),
                  elevation:5,
                ),
                onPressed:(){
                  submitbutton();
                },
                child:Text('Submit',
                style:TextStyle(fontSize:17,fontWeight:FontWeight.w600),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
