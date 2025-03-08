import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:live_project/clubmodel.dart';
import 'package:http/http.dart' as http;
class Clubsecondpage extends StatefulWidget {
  final String dpkId;
  const Clubsecondpage({super.key, required this.dpkId});

  @override
  State<Clubsecondpage> createState() => _Clubsecondpage();
}

class _Clubsecondpage extends State<Clubsecondpage> {

  bool isLoading = true;
  Clubmodel ? nameList;
  @override
  void initState(){
    super.initState();
    fetchapp();
  }

Future<void> fetchapp() async{
    Map<String,String> body ={
      'club_id':widget.dpkId

    };
    print('bODY.....${body}');
    final response = await http.post(Uri.parse('https://server-php-8-3.technorizen.com/kyna/api/myEvents'),
    headers:<String,String>{
      'Content-Type' :'application/json;charst=UTF-8',
    },
      body:jsonEncode(body),
    );
    if(response.statusCode==200){
      Clubmodel datamodel = Clubmodel.fromJson(jsonDecode(response.body));
      print('Status:${datamodel.status}');
      setState(() {
            nameList  = datamodel;
            isLoading = false;
          });
    }
    else {
      print('Api is not woking');
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
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar:AppBar(
      //
      // ),
      body:Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          SizedBox(width: width * 0.18),
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
                left:200,
                child: Image.asset('assets/Ellipse 801.png'),
              ),
              Positioned(
                bottom:70,
                left:10,
                child:Text('Horizon Collective',
                  style:TextStyle(color:Colors.white,fontSize:22,
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
              itemCount:nameList?.data?.length,
              itemBuilder:(context,index){
                print('${nameList?.data?[index].images?[0].image}');
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
                          child: Image.network('${nameList?.data?[index].images?[0].image}',
                          width:132,height:117, fit:BoxFit.cover,
                          errorBuilder:(context,url,error)=>Icon(Icons.person),),
                          borderRadius:BorderRadius.circular(20),
                        ),
                        SizedBox(width:10),
                        Column(
                          crossAxisAlignment:CrossAxisAlignment.start,
                          children: [
                            // Text(nameList[index]['text'],
                            // style:TextStyle(fontSize:18,fontWeight:FontWeight.w600),),
                            SizedBox(height:5),
                            Text('${nameList?.data?[index].createdAt}',
                              style:TextStyle(color:Color(0XFF007AFF),
                                  fontSize:12,fontWeight:FontWeight.w500),),
                                  SizedBox(height:5),
                            Row(
                              children: [
                                Image.asset('assets/location.png'),
                                SizedBox(
                                  width:150,
                                  child: Text('${nameList?.data?[index].address}',style:TextStyle(color:Color(0XFF878787),fontSize:12,
                                      fontWeight:FontWeight.w500,
                                  overflow:TextOverflow.ellipsis),),
                                ),
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
