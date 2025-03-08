
import 'package:flutter/material.dart';
import 'package:live_project/clubsecondpage.dart';
class Myfavouriteevent extends StatefulWidget {
  const Myfavouriteevent ({super.key});

  @override
  State<Myfavouriteevent> createState() => _Club();
}

class _Club extends State<Myfavouriteevent> {
  List<Map<String,dynamic>> nameList=[
    {
      'text':'Tech Trends Expo 2024',
      'image':'assets/tech trend.png',
    },
    {
      'text':'Cultural Carnival Night',
      'image':'assets/cultural.png',
    },
    {
      'text':'Fitness Fest 2024',
      'image':'assets/fitness.png',
    },
    {
      'text':'Innovate & Inspire ',
      'image':'assets/innovate.png',
    },
    {
      'text':'Fitness Fest 2024',
      'image':'assets/fitness.png',
    },

  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar:AppBar(
        automaticallyImplyLeading: false,
        surfaceTintColor:Colors.transparent,
        backgroundColor:Colors.white,
        title:Text('My Favourites Event',
          style:TextStyle(fontSize:20,fontWeight:FontWeight.w700),),
        leading:GestureDetector(
          onTap:(){
          Navigator.pop(context);
          },
           child:Image.asset('assets/Back-Navs.png')),
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(width: width * 0.18),
            ListView.builder(
              shrinkWrap:true,
              physics:ScrollPhysics(),
              itemCount:nameList.length,
              itemBuilder:(context,index){
                return GestureDetector(
                  onTap:(){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>Clubsecondpage(dpkId: '50',)),
                    );
                  },
                  child: Card(
                    color:Color(0XFFFFFFFF),
                    margin:EdgeInsets.symmetric(vertical:10,horizontal:10),
                    elevation:5,
                    child: Container(
                      padding:EdgeInsets.symmetric(vertical:10,horizontal:10),
                      child:Row(
                        children: [
                          Image.asset(nameList[index]['image']),
                          SizedBox(width:10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment:CrossAxisAlignment.start,
                              children: [
                                Text(nameList[index]['text'],
                                    style:TextStyle(fontSize: 16,fontWeight:FontWeight.w700,)
                                ),
                                SizedBox(height:5,),
                                Text('Mon. Dec 24-18.00-23.00 PM',
                                  style:TextStyle(color:Color(0XFF007AFF),
                                      fontSize:12,fontWeight:FontWeight.w500),),
                                SizedBox(height:5),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset('assets/location.png'),
                                        Text('Grand Park...',
                                          style:TextStyle(color:Color(0XFF878787),
                                              fontSize:12,fontWeight:FontWeight.w500),),
                                      ],
                                    ),
                                    Image.asset('assets/heart.png'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );

  }
}
