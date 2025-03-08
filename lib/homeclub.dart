import 'package:flutter/material.dart';
class Homeclub extends StatefulWidget {
  const Homeclub({super.key});

  @override
  State<Homeclub> createState() => _Homeclub();
}

class _Homeclub extends State<Homeclub> {
  List<Map<String,dynamic>> nameList =[
    {
      'text' :'Melody Mingle',
      'image': 'assets/melody.png',

    },
    {
      'text' :'Harmonic Vibes',
      'image': 'assets/harmonic.png',

    },
    {
      'text' :'Rhythm Haven',
      'image': 'assets/Rhythem.png',

    },
    {
      'text' :'Echo Beats',
      'image': 'assets/echo.png',

    },
    {
      'text' :'Music Concert',
      'image': 'assets/echo.png',

    },
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar:AppBar(
      //
      // ),
      body:Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          // SizedBox(width: width * 0.18),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom:20),
                child: Image.asset('assets/horizon.png',height:208),
              ),
              Positioned(
                top:50,
                left:24,
                child:GestureDetector(
                    onTap:(){
                      Navigator.pop(context);
                    },
                    child: Image.asset('assets/Back-Navs.png')
                ),
              ),
              Positioned(
                top:80,
                right:20,
                child: Image.asset('assets/Ellipse 801.png'),
              ),
              Positioned(
                bottom:40,
                left:10,
                child:SizedBox(
                  width:MediaQuery.of(context).size.width-100,
                  child: Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [

                      Text('Horizon Collective',
                        style:TextStyle(color:Colors.white,fontSize:18,
                            fontWeight:FontWeight.w700),),
                      Row(
                        children: [
                          Image.asset('assets/whitelocation.png'),
                          Text('Stuttgart Germany',
                            style:TextStyle(color:Colors.white,fontSize:12,
                                fontWeight:FontWeight.w500),),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left:10),
            child: Text('Events',style:TextStyle(fontSize:22,fontWeight:FontWeight.w700),),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap:true,
              itemCount:nameList.length,
              itemBuilder:(context,index){
                return Card(
                  color:Color(0XFFFFFFFF),
                  elevation:5,
                  margin:EdgeInsets.symmetric(vertical:10,horizontal:10),
                  child: Container(
                    padding:EdgeInsets.symmetric(vertical:10,horizontal:10),
                    child:Row(
                      children: [
                        Image.asset(nameList[index]['image']),
                        SizedBox(width:10),
                        Column(
                          crossAxisAlignment:CrossAxisAlignment.start,
                          children: [
                            Text(nameList[index]['text'],
                              style:TextStyle(fontSize:18,fontWeight:FontWeight.w600),),
                            SizedBox(height:5),
                            Text('Mon. Dec 24-18.00-23.00 PM',
                              style:TextStyle(color:Color(0XFF007AFF),
                                  fontSize:12,fontWeight:FontWeight.w500),),
                            SizedBox(height:5),
                            Row(
                              children: [
                                Image.asset('assets/location.png'),
                                Text('Stuttgart Germany',style:TextStyle(color:Color(0XFF878787),fontSize:12,
                                    fontWeight:FontWeight.w500),),
                              ],
                            ),
                          ],
                        ),
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
