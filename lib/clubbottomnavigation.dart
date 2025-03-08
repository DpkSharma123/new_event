import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:live_project/addevent.dart';
import 'package:live_project/club.dart';
import 'package:live_project/clubsecondpage.dart';
import 'package:live_project/events.dart';
import 'package:live_project/homeclub.dart';
import 'package:live_project/homepage.dart';
import 'package:live_project/notifications.dart';
import 'package:live_project/profile.dart';
class Clubbottomnavigation extends StatefulWidget {
  const Clubbottomnavigation({super.key});

  @override
  State<Clubbottomnavigation> createState() => _Clubbottomnavigation();
}

class _Clubbottomnavigation extends State<Clubbottomnavigation> {
  int tabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:Container(
        height:60,
        child:Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap:(){
                    setState(() {
                      tabIndex=0;
                    });
                  },
                  child: Column(
                    children: [
                      Icon(Icons.home,color:tabIndex==0?Color(0XFF007AFF):Color(0XFF9E9E9E)),
                      Text('Home',
                        style:TextStyle(color:tabIndex==0?Color(0XFF048CFF):Color(0XFF9E9E9E),
                            fontSize:10,fontWeight:FontWeight.w600),)
                    ],
                  ),
                ),
                GestureDetector(
                  onTap:(){
                    setState(() {
                      tabIndex=1;
                    });
                  },
                  child:Column(
                    children: [
                      Image.asset('assets/star.png',
                          color:tabIndex==1?Color(0XFF007AFF):Color(0XFF9E9E9E)),
                      Text('Events',
                        style:TextStyle(color:tabIndex==1?Color(0XFF007AFF):Color(0XFF9E9E9E),
                            fontSize:10,fontWeight:FontWeight.w600),),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap:(){
                    setState(() {
                      tabIndex=2;
                    });
                  },
                  child:Column(
                    children: [
                      FaIcon(FontAwesomeIcons.circlePlus,color:tabIndex==2?Color(0XFF007AFF):Color(0XFF9E9E9E),
                      size:50,),
                      // Text('Club',
                      //   style:TextStyle(color:tabIndex==2?Color(0XFF048CFF):Color(0XFF9E9E9E),
                      //       fontSize:10,fontWeight:FontWeight.w600),),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap:(){
                    setState(() {
                      tabIndex=3;
                    });
                  },
                  child:Column(
                    children: [
                      Image.asset('assets/notification-bing.png', color:tabIndex==3?Color(0XFF007AFF):
                      Color(0XFF9E9E9E)),
                      Text('Notifications',
                        style:TextStyle(color:tabIndex==3?Color(0XFF048CFF):Color(0XFF9E9E9E),
                            fontSize:10,fontWeight:FontWeight.w600),),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap:(){
                    setState(() {
                      tabIndex=4;
                    });
                  },
                  child:Column(
                    children: [
                      Image.asset('assets/profile.png', color:tabIndex==4?Color(0XFF007AFF):
                      Color(0XFF9E9E9E)),
                      Text('Profile',
                        style:TextStyle(color:tabIndex==4?Color(0XFF048CFF):Color(0XFF9E9E9E),
                            fontSize:10,fontWeight:FontWeight.w600),),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body:tabScreen(),
    );
  }
  Widget tabScreen(){
    switch(tabIndex){
      case 0:
        return Homeclub();
      case 1:
        return Events();
      case 2 :
        return Addevent();
      case 3:
        return Notifications();
      case 4 :
        return Profile();
      default:
        return Homeclub();
    }
  }
}
