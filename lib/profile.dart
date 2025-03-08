import 'package:flutter/material.dart';
import 'package:live_project/aboutpage.dart';
import 'package:live_project/changepassword.dart';
import 'package:live_project/faqpage.dart';
import 'package:live_project/loginpage.dart';
import 'package:live_project/myclubpage.dart';
import 'package:live_project/myfavouriteevent.dart';
import 'package:live_project/notifications.dart';
import 'package:live_project/privacypage.dart';
import 'package:live_project/profilesecondpage.dart';
import 'package:live_project/supportpage.dart';
import 'package:live_project/termspage.dart';
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _Profile();
}

class _Profile extends State<Profile> {
  List<Map<String,dynamic>> nameList= [
    {
      'text' :'My club',
      'image': 'assets/myclub.png',
    },
    {
      'text':'My Favorites Event ',
      'image':'assets/favouriteevent.png'
    },
    {
      'text':'My Follow Events ',
      'image':'assets/followevent.png'
    },
    {
      'text':'Change Password ',
      'image':'assets/Change Password.png'
    },
    {
      'text':'Notifications ',
      'image':'assets/Notifications.png'
    },
    {
      'text':'Support ',
      'image':'assets/Support.png'
    },
    {
      'text':'Faq ',
      'image':'assets/FAQ.png'
    },
    {
      'text':'About us',
      'image':'assets/About us.png'
    },
    {
      'text':'Terms and Condition',
      'image':'assets/Terms and Condition.png',
    },
    {
      'text':'Privacy Policy',
      'image':'assets/Terms and Condition.png',
    },
    {
      'text':'Logout',
      'image':'assets/Privacy Policy.png'
    },
  ];
    void _navigatetoPage(int index){
      switch(index){
        case 0: {
          Navigator.push(
              context,
            MaterialPageRoute(builder: (context)=>Myclubpage()),
          );
          break;
        }
        case 1:{
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=>Myfavouriteevent()),
          );
        }
        case 3 :{
          Navigator.push(
              context,
            MaterialPageRoute(builder: (context)=>Changepassword()),
          );
          break;
        }
        case 4 : {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context)=>Notifications()),
          );
          break;
        }
        case 5 :
          {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context)=>Supportpage()),
            );
            break;
          }
        case 6:{
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=>Faqpage()),
          );
          break;
        }
        case 7:{
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=>Aboutpage()),
          );
          break;
        }
        case 8:{
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=>Termspage()),
          );
          break;
        }
        case 9:{
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=>Privacypage()),
          );
          break;
        }
        case 10:{
         _showLogoutDialog();
         break;
        }
      }
    }
      void _showLogoutDialog(){
      showDialog(
          context: context,
          builder: (BuildContext context)=> AlertDialog(
            title:Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap:(){
                    Navigator.pop(context);
                  },
                    child: Image.asset('assets/close.png')
                ),
              Center(
                child: Text('Logout',
                    style:TextStyle(fontSize:24 )),
              ),
                  SizedBox(height:10),
                Text('Are you sure want to log out?',
                style:TextStyle(color:Color(0XFF9DB2BF),
                fontSize:16,fontWeight:FontWeight.w400),),
                SizedBox(height:10),
                GestureDetector(
                  onTap:(){
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context)=>Loginpage()),
                        (route)=>false,
                    );
                  },
                  child:Container(
                    width:double.infinity,
                    alignment:Alignment.center,
                    padding:EdgeInsets.symmetric(vertical:10),
                    margin:EdgeInsets.symmetric(vertical:10),
                    decoration:BoxDecoration(
                      color:Color(0XFF1C1B1B),
                      borderRadius:BorderRadius.circular(10),
                    ),
                      child: Text('Logout',
                        style:TextStyle(color:Color(0XFFFFFFFF), fontSize:12,fontWeight:FontWeight.w600),)
                  ),
                ),
              ],
            ),
          ),
      );
      }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('Profile',
          style:TextStyle(fontSize:24,fontWeight:FontWeight.w600),),
        centerTitle:true,
        automaticallyImplyLeading: false,
        surfaceTintColor:Colors.transparent,
        backgroundColor:Colors.white,
      ),
      body:Column(

        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap:(){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>Profilesecondpage()),
                );
              },
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/profileman.png'),
                      SizedBox(width:10),
                      Column(
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children: [
                          Text('Marcus Aminoff',
                            style:TextStyle(color:Color(0XFF007AFF),
                                fontSize:19,fontWeight:FontWeight.w600),),
                          Text('Mercedes-Benz E-Cl',style:TextStyle(color:Color(0XFF9DB2BF),fontSize:12,fontWeight:FontWeight.w500),),
                        ],
                      ),
                    ],
                  ),
                  Image.asset('assets/Vector.png'),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap:true,
              itemCount:nameList.length,
              itemBuilder:(context,index){
                return GestureDetector(
                  onTap:(){
                    _navigatetoPage(index);
                  },
                  child: Container(
                    margin:EdgeInsets.all(8),
                    padding:EdgeInsets.only(left:10,right:10),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children:[
                            Image.asset(nameList[index]['image']),
                            SizedBox(width:10),
                            Text(nameList[index]['text']),
                          ],
                        ),
                        Image.asset('assets/Vector.png'),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );

  }
}
