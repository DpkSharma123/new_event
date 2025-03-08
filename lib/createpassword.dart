import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:live_project/bottomnavigationpage.dart';
import 'package:live_project/createpasswordmodel.dart';
import 'package:live_project/loginpage.dart';
import 'package:http/http.dart' as http;
class Createpassword extends StatefulWidget {
  final String userId;
  const Createpassword({super.key,required this.userId});

  @override
  State<Createpassword> createState() => _Createpassword();
}

class _Createpassword extends State<Createpassword> {
  bool _newPasswordVisible = false;
  bool _confirmPasswordVisible = false;
  TextEditingController Newpassword = TextEditingController();
  TextEditingController Confirmpassword = TextEditingController();
  bool isLoading = false;
  Createpasswordmodel ? newpassword;
  @override
  Future<void> savebutton() async{
    setState(() {
      isLoading = true;
    });
    Map<String,String> body ={

      'password':Newpassword.text,
      'confirm_password':Confirmpassword.text,
      'user_id':widget.userId,

    };
    print('Bodyparam:...................${body}');
    final response = await http.post(Uri.parse('https://server-php-8-3.technorizen.com/kyna/api/change-password'),
      headers:<String,String>{
      'Accept':'application/json',
      },
      body:body,
    );
    if(response.statusCode==200){
      Createpasswordmodel createpasswordmodel = Createpasswordmodel.fromJson(jsonDecode(response.body));
      print('Status:${createpasswordmodel.status}');
      print('Response body:${response.body}');
      setState(() {
        newpassword = createpasswordmodel;
        if(newpassword?.status=='1'){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Password has been changed successfully'),
                duration:Duration(seconds:1),
        ));

          Future.delayed(Duration(seconds:3),(){
            Navigator.push(
              context,

              MaterialPageRoute(builder: (context)=>Loginpage()),

            );
          });
        }
        else
          {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content:Text('Password do not match'),
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
            content:Text('Api error:please try again later'),
          ));
        }
  }
  final _formkey = GlobalKey<FormState>();

  void _changePassword() {
    if (_formkey.currentState?.validate() ?? false) {
      if (Newpassword.text == Confirmpassword.text) {
        print("The password has been chaged");
        savebutton();
      }
      else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Passwords do not match')
        ));
      }
    }
    else
      {
        print('Please fill out the fields correctly');
      }

}
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset('assets/Back-Navs.png')
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Text('Create New Password',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),),
                    Text(
                      'Your new password must be different from previous used passwords.',
                      style: TextStyle(color: Color(0XFF9DB2BF),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),),
                    SizedBox(height: 20),

                    Form(
                      key:_formkey,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 15),
                            decoration: BoxDecoration(
                              color: Color(0XFFF7F8F8),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: TextFormField(
                              controller: Newpassword,
                              obscureText: !_newPasswordVisible,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'New Password',
                                hintStyle: TextStyle(color: Color(0XFFADA4A5),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                                prefixIcon: Image.asset('assets/Lock.png'),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _newPasswordVisible=!_newPasswordVisible;
                                    });
                                  },
                                  icon: Icon(
                                    color: Color(0XFFADA4A5),
                                    _newPasswordVisible ? Icons.visibility : Icons
                                        .visibility_off,
                                  ),
                                ),
                                contentPadding: EdgeInsets.symmetric(vertical: 15),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'New password can not be empty';
                                }
                                if (value.length < 6) {
                                  return 'Password must be at least 6 characters long';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.only(left: 15),
                            decoration: BoxDecoration(
                              color: Color(0XFFF7F8F8),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: TextFormField(
                              controller:Confirmpassword,
                              obscureText: !_confirmPasswordVisible,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Confirm Password',
                                hintStyle: TextStyle(color: Color(0XFFADA4A5),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                                prefixIcon: Image.asset('assets/Lock.png'),
                                contentPadding: EdgeInsets.symmetric(vertical: 15),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _confirmPasswordVisible = !_confirmPasswordVisible;
                                    });
                                  },
                                  icon: Icon(
                                    color: Color(0XFFADA4A5),
                                    _confirmPasswordVisible? Icons.visibility : Icons
                                        .visibility_off,
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Confirm password can not be empty';
                                }
                                if (value != Newpassword.text) {
                                  return 'Passwords do not match';
                                }
                                return null;
                              },
                            ),
                          ),




                        ],
                      ),
                    ),
                  ],
                ),
              ),
              isLoading?Center(child:CircularProgressIndicator()):
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0XFF007AFF),
                  foregroundColor: Color(0XFFFFFFFF),
                  minimumSize: Size(378, 60),
                  elevation: 5,
                ),
                onPressed: () {
                  _changePassword();
                },
                child: Text('Save',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),),

              ),
            ],
          ),
        ),
      );
    }
  }
