import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:live_project/eventmodel.dart';
import 'package:http/http.dart' as http;
class Myclubpage extends StatefulWidget {
  const Myclubpage({super.key});

  @override
  State<Myclubpage> createState() => _Myclubpage();
}

class _Myclubpage extends State<Myclubpage> {
  bool isLoading = true;
       Eventmodel ? nameList;

       @override
       void initState(){
         super.initState();
         fetchapp();
       }
       Future<void> fetchapp() async{
         final response = await http.get(Uri.parse('https://server-php-8-3.technorizen.com/kyna/api/getEvents'));
         if(response.statusCode==200){
         Eventmodel datamodel = Eventmodel.fromJson(jsonDecode(response.body));
         print('Status:${datamodel.status}');
        setState(() {
          nameList = datamodel;
          isLoading = false;
        });
       }

       else{
         print('Api is not working');
  }
       }
  // List<Map<String,dynamic>> nameList =[
  //   {
  //     'text' :'Melody Mingle',
  //     'image': 'assets/melody.png',
  //
  //   },
  //   {
  //     'text' :'Harmonic Vibes',
  //     'image': 'assets/harmonic.png',
  //
  //   },
  //   {
  //     'text' :'Rhythm Haven',
  //     'image': 'assets/Rhythem.png',
  //
  //   },
  //   {
  //     'text' :'Echo Beats',
  //     'image': 'assets/echo.png',
  //
  //   },
  //   {
  //     'text' :'Music Concert',
  //     'image': 'assets/echo.png',
  //
  //   },
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar:AppBar(
      //
      // ),
      body:Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom:20),
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: Image.asset('assets/myclub3.png')),
              ),
              Positioned(
                top:50,
                left:20,
                child:GestureDetector(
                  onTap:(){
                    Navigator.pop(context);
                  },
                    child: Image.asset('assets/Back-Navs.png')
                ),
              ),
              Positioned(
                top:70,
                left:200,
                child:Image.asset('assets/infernd.png'),
              ),
              Positioned(
                bottom:70,
                left:10,
                child:Text('Infernd Night Club',
                  style:TextStyle(color:Colors.white,fontSize:18,
                      fontWeight:FontWeight.w700),),
              ),
              Positioned(
                bottom:50,
                left:10,
                child: Row(
                  children: [
                    Image.asset('assets/whitelocation.png'),
                    Text('Stuttgart Germany',
                      style:TextStyle(color:Colors.white,fontSize:12,
                          fontWeight:FontWeight.w500),),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left:10),
            child: Text('Events',style:TextStyle(fontSize:22,fontWeight:FontWeight.w700),),
          ),
          Expanded(
            child:isLoading?Center(child:CircularProgressIndicator())
                : ListView.builder(
              shrinkWrap:true,
              // itemCount:nameList.length,
              itemCount: nameList?.data?.length,
              itemBuilder:(context,index){
                return Card(
                  color:Color(0XFFFFFFFF),
                  elevation:5,
                  margin:EdgeInsets.symmetric(vertical:10,horizontal:10),
                  child: Container(
                    padding:EdgeInsets.symmetric(vertical:10,horizontal:10),
                    child:Row(
                      children: [
                        // Image.asset(nameList[index]['image']),
                          ClipRRect(
                            child:Image.network('${nameList?.data?[index].images?[0].image}',
                              width:131,height:116,fit:BoxFit.cover,
                              errorBuilder:(context,url,error)=>new Icon(Icons.person),
                            ),
                            borderRadius:BorderRadius.circular(20),
                          ),
                        // ClipRRect(
                        //   child:Image.network('${nameList?.data?[index].images?[0].image}',
                        //     width:131,height:116,fit:BoxFit.cover,
                        //     errorBuilder:(context,url,error)=>new Icon(Icons.person),
                        //   ),
                        //   borderRadius:BorderRadius.circular(20),
                        // ),
                        SizedBox(width:10),
                        Column(
                          crossAxisAlignment:CrossAxisAlignment.start,
                          children: [
                            // Text(nameList[index]['text'],
                              Text('${nameList?.data?[index].title}',
                              style:TextStyle(fontSize:18,fontWeight:FontWeight.w600),),

                            SizedBox(height:5),
                            Text('${nameList?.data?[index].dateTime}',
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
