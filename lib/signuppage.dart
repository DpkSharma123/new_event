import 'dart:convert';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:live_project/loginpage.dart';
import 'package:live_project/signupmodel.dart';
import 'package:http/http.dart' as http;
class Signuppage extends StatefulWidget {
  const Signuppage({super.key});

  @override
  State<Signuppage> createState() => _Signuppage();
}

class _Signuppage extends State<Signuppage> {
  int tabIndex=0;
  List<bool> isChecked=[false,false];
  String ? selectedClub = null;
  List<String> clubitems = ['Indore','Bhopal','Ujjain'];
  TextEditingController userController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController mobileController = TextEditingController();


  bool isLoading = false;
  Signupmodel ? name;
  @override
  Future<void> pressbutton() async {
    setState(() {
      isLoading = true; // Show loading indicator
    });

    Map<String, String> body = {
      'user_name': userController.text,
      'email': emailController.text,
      'mobile': mobileController.text,
      'country_code': '+91',
      'password': passController.text,
      'user_type': 'USER',
    };
    print('Bodyparam....... ${body}');

    final response = await http.post(
      Uri.parse('https://server-php-8-3.technorizen.com/kyna/api/Register'),
      headers: <String, String>{
        'Accept': 'application/json'
      },
      body: body,
    );

    if (response.statusCode == 200) {
      Signupmodel datamodel = Signupmodel.fromJson(jsonDecode(response.body));
      print('Status: ${datamodel.status}');
      print('Response Body: ${response.body}');

      setState(() {
        name = datamodel;
        if (name?.status == '1') {

          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Signup Successful!'),
          ));
          Future.delayed(Duration(seconds: 2), () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Loginpage()), // Navigate to LoginPage
            );
          });
        }
        else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Signup Failed! Please try again.'),
          ));
        }
        isLoading = false;
      });
    }
    else {
      print('API call failed or returned an error.');
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('API Error: Please try again later.'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    double width= MediaQuery.of(context).size.width;
    return Scaffold(
      appBar:AppBar(
        automaticallyImplyLeading: false,
      ),

      body:isLoading?Center(child:CircularProgressIndicator()):
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width:width*0.18),
            Padding(
              padding: const EdgeInsets.only(left:10),
              child: Image.asset('assets/Frame 2.png',
                width: MediaQuery.of(context).size.width * 0.4,
        
              ),
            ),
            SizedBox(height:10),
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
            SizedBox(height:30),

            Padding(
              padding: const EdgeInsets.only(left:20,top:10),
              child: Text('Sign Up',style:TextStyle(fontSize:24,
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
            SizedBox(height:10),
            Container(
              margin:EdgeInsets.symmetric(vertical:5,horizontal:10),
              decoration:BoxDecoration(
                // border:Border.all(color:Colors.red,width:2),
                borderRadius:BorderRadius.circular(40),
              ),
              child: TextFormField(
                controller: userController,
                keyboardType:TextInputType.text,
                decoration:InputDecoration(
                  border:InputBorder.none,
                  fillColor:Color(0XFFF7F8F8),
                  filled:true,
                  hintText:('Username'),
                  hintStyle:TextStyle(color:Color(0XFFADA4A5),
                      fontSize:14,fontWeight:FontWeight.w400),
                  prefixIcon:Icon(Icons.person),
                  // prefixIcon:Image.asset('assets/globall.png'),
                  contentPadding:EdgeInsets.symmetric(vertical:15),
                ),
              ),
            ),
            Container(
              margin:EdgeInsets.symmetric(vertical:5,horizontal:10),
              decoration:BoxDecoration(
                // border:Border.all(color:Colors.red,width:2),
                borderRadius:BorderRadius.circular(40),
              ),
              child: TextFormField(
                controller: emailController,
                keyboardType:TextInputType.emailAddress,
                decoration:InputDecoration(
                  border:InputBorder.none,
                  fillColor:Color(0XFFF7F8F8),
                  filled:true,
                  hintText:('Email address'),
                  hintStyle:TextStyle(color:Color(0XFFADA4A5),
                      fontSize:14,fontWeight:FontWeight.w400),
                  prefixIcon:Image.asset('assets/Message (1).png'),
                  // prefixIcon:Image.asset('assets/globall.png'),
                  contentPadding:EdgeInsets.symmetric(vertical:15),
                ),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width:90,
                  child: Container(
                    decoration:BoxDecoration(
                      color:Color(0XFFF7F8F8),
                      borderRadius:BorderRadius.circular(15),
                    ),
                    child:CountryCodePicker(
                      onChanged:(code){
                        print("selected country code:${code.dialCode}");
                        print("selected country name:${code.name}");
                      },
                      initialSelection: 'IN',
                      showFlagDialog:false,
                      showFlag: false,
                      alignLeft:true,
                      padding: EdgeInsets.symmetric(horizontal:10),
                      onInit:(code)=>debugPrint("on init ${code?.name} ${code?.dialCode}${code?.name}"),
                    ),
                  ),
                ),
                SizedBox(width:10),
                Expanded(
                  child: Container(
                    padding:EdgeInsets.symmetric(horizontal:10),
                    decoration:BoxDecoration(
                      color:Color(0XFFF7F8F8),
                      borderRadius:BorderRadius.circular(15),
                    ),
                    child: TextFormField(
                      controller:mobileController,
                      keyboardType:TextInputType.number,
                      decoration:InputDecoration(
                        border:InputBorder.none,
                        hintText:'Phone Number',
                        hintStyle:TextStyle(color:Colors.grey,
                            fontSize:14,fontWeight:FontWeight.w500),
                        // prefixIcon:Image.asset('assets/User.png'),
                        // contentPadding:EdgeInsets.symmetric(vertical:15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height:10),
            Container(
              margin:EdgeInsets.symmetric(vertical:5,horizontal:10),
              decoration:BoxDecoration(
                // border:Border.all(color:Colors.red,width:2),
                borderRadius:BorderRadius.circular(40),
              ),
              child: TextFormField(
                controller: passController,
                // keyboardType:TextInputType.number,
                obscureText:true,
                decoration:InputDecoration(
                  border:InputBorder.none,
                  fillColor:Color(0XFFF7F8F8),
                  filled:true,
                  hintText:('Password'),
                  hintStyle:TextStyle(color:Color(0XFFADA4A5),
                      fontSize:14,fontWeight:FontWeight.w400),
                  prefixIcon:Image.asset('assets/Lock.png'),
                  contentPadding:EdgeInsets.symmetric(vertical:15),
                  // suffixIcon:Image.asset('assets/Hide-Password.png'),
                ),
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap:(){
                    setState(() {
                      isChecked[0]=!isChecked[0];
                    });
                  },
                  child: Container(
                    width:30,
                    height:30,
                    decoration:BoxDecoration(
                      shape:BoxShape.circle,
                    ),
                    child:Icon(
                      isChecked[0]?Icons.check_circle:Icons.radio_button_unchecked,
                      color:isChecked[0]?Color(0XFF007AFF):Colors.black,
                    ),
                  ),
                ),
                Text('Rules for Coaches',style:TextStyle(color:Color(0XFF007AFF)),),
              ],
            ),
            SizedBox(height:10),
            Row(
              children: [
                GestureDetector(
                  onTap:(){
                    setState(() {
                      isChecked[1]=!isChecked[1];
                    });
                  },
                  child: Container(
                    width:30,
                    height:30,
                    decoration:BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      isChecked[1]?Icons.check_circle:Icons.radio_button_unchecked,
                      color:isChecked[1]?Color(0XFF007AFF):Colors.black,
                    ),
                  ),
                ),
                RichText(
                  text:TextSpan(
                    children:[
                      TextSpan(
                        text:'I agree to the OKSA',
                        style:TextStyle(color:Color(0XFF909090),fontSize:14,
                            fontWeight:FontWeight.w400),
                      ),
                      TextSpan(
                        text:' Terms of Service ',
                        style:TextStyle(color:Color(0XFF007AFF),fontSize:14,
                            fontWeight:FontWeight.w400),
                      ),
                      TextSpan(
                        text:'and \n',
                        style:TextStyle(color:Color(0XFF909090),fontSize:14,
                            fontWeight:FontWeight.w400),
                      ),
                      TextSpan(
                        text:' Privacy Policy',
                        style:TextStyle(color:Color(0XFF007AFF),fontSize:14,
                            fontWeight:FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical:20,horizontal:30),
              child: ElevatedButton(
                style:ElevatedButton.styleFrom(
                  backgroundColor:Color(0XFF007AFF),
                  foregroundColor:Color(0XFFFFFFFF),
                  minimumSize:Size(300, 50),
                ),
                onPressed:(){
                  pressbutton();
                },
                child:Text('Sign Up'),
              ),
            ),
            Center(
              child: RichText(
                text:TextSpan(
                  children:[
                    TextSpan(
                      text:'Alrady have an account?',
                      style:TextStyle(color:Color(0XFF909090),fontSize:16,
                          fontWeight:FontWeight.w500),
                    ),
                    TextSpan(
                      text:'Login',
                      style:TextStyle(color:Color(0XFF007AFF),fontSize:16,
                          fontWeight:FontWeight.w500),
                      recognizer: TapGestureRecognizer()..onTap = () {
                        // Navigate to LoginPage immediately
                       Navigator.pop(
                           context,
                       );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
