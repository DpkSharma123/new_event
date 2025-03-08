import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:live_project/Otpmodel.dart';
import 'package:live_project/createpassword.dart';
import 'package:pinput/pinput.dart';
import 'package:http/http.dart' as http;
class Otppage extends StatefulWidget {
  final String email;
  const Otppage({super.key,required this.email});

  @override
  State<Otppage> createState() => _Otppage();
}

class _Otppage extends State<Otppage> {

  bool isLoading=false;
  Otpmodel ? otpverify;
  String otp = '';


  Future<void>submitbutton() async{
    setState(() {
      isLoading = true;
    });

      Map<String,dynamic> body = {
          'email phone':widget.email,
          'type':'email',
        'otp':otp
      };
      print('Bodyparam..... Otp Page.........${body}');
      final response = await http.post(Uri.parse('https://server-php-8-3.technorizen.com/kyna/api/otpVerify'),
      headers:<String,String> {
        'Accept':'appliation/json',
          },
        body:body,
    );
      if(response.statusCode==200){
        Otpmodel otpmodel = Otpmodel.fromJson(jsonDecode(response.body));
        print('Status:${otpmodel.status}');
        print('Response body:${response.body}');
          print("otp print:---------------------${otpmodel.data?.otp}");
        print("Type of otp: ${otpmodel.data?.id}");

        setState(() {
         otpverify = otpmodel;
         if(otpverify?.status=='1'){
           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
             content: Text('OTP verify Successfully!'),
             duration:Duration(seconds:2),
           ));
           print('OTP-------------------------:${otpverify?.data?.otp}');
           Future.delayed(Duration(seconds:3),(){
             Navigator.push(
               context,
               MaterialPageRoute(builder: (context)=>Createpassword(userId:otpmodel.data?.id??'')),
             );
           });
         }
         else
           {
             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
               content: Text('OTP verify failed!'),
             ));
           }
         isLoading = false;
        });
      }
    else
      {
        print('Api call failed or return an error');
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Api error: please try again later')
        ));
      }
  }

  final defaultPinTheme = PinTheme(
    width:56,
    height:56,
    textStyle:TextStyle(fontSize:22,color:Colors.black),
    decoration:BoxDecoration(
      border:Border.all(color:Colors.black),
      borderRadius:BorderRadius.circular(15),
    ),
  );
  @override
  Widget build(BuildContext context) {
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
              Text('Check your Phone ',
                  style:TextStyle(fontSize:24,fontWeight:FontWeight.w700)),
              Text('Please put the 4 digits sent to you',
                style:TextStyle(color:Color(0XFF9DB2BF),fontSize:16,fontWeight:FontWeight.w700),),
              SizedBox(height:50),

              Center(
                child: Pinput(
                  defaultPinTheme:defaultPinTheme,
                  validator:(value){
                    return value =='9999' ? null: 'Pin is incorrect';
                  },
                  onCompleted:(pin){
                    debugPrint('onComplete:$pin');
                    setState(() {
                      otp=pin;
                    });
                  },
                  onChanged:(value){
                    debugPrint('onChanged:$value');
                  },
                ),
              ),
              SizedBox(height:50),
              Image.asset('assets/otp image.png'),
              SizedBox(height:100),
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
