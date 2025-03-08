import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:live_project/eventmodel.dart';
import 'package:live_project/eventssecondpage.dart';
import 'package:http/http.dart' as http;
class Events extends StatefulWidget {
  const Events({super.key});

  @override
  State<Events> createState() => _Events();
}

class _Events extends State<Events> {
  bool isLoading = true;
  Eventmodel ? nameList;
   // String imageurl ='https://server-php-8-3.technorizen.com/kyna//public/';
  @override
  void initState(){
    super.initState();
      fetechapp();
    }
    Future<void> fetechapp() async{

      final response = await http.get(Uri.parse('https://server-php-8-3.technorizen.com/kyna/api/getEvents'));
      if(response.statusCode==200){
        Eventmodel datamodel = Eventmodel.fromJson(jsonDecode(response.body));
        print('Status:${datamodel.status}');

        setState(() {
          nameList = datamodel;
          isLoading = false;
        });
      }
      else {
        print('Api not working');
      }
    }
  // List<Map<String,dynamic>> nameList=[
  //   {
  //
  //     // 'image1':'assets/1.png',
  //     'image1':'assets/32.png',
  //       'pic':'assets/3.png',
  //
  //   },
  //   {
  //
  //     'image1':'assets/21.png',
  //     'pic':'assets/4.png',
  //   },
  //   {
  //
  //     'image1':'assets/21.png',
  //     'pic':'assets/3.png',
  //
  //   },
  //   {
  //
  //     'image1':'assets/21.png',
  //     'pic':'assets/4.png',
  //   },
  //
  // ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:AppBar(
       title: Text('Events',
          style:TextStyle(fontSize:24,fontWeight:FontWeight.w600),),
        automaticallyImplyLeading: false,
        centerTitle:true,
      ),
      body:Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left:10,bottom:10,right:10,top:10),
            child: Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children:[
                Text('Featured',
                  style:TextStyle(fontSize:18,fontWeight:FontWeight.w700),
                ),
                Text('See all',
                  style:TextStyle(color:Color(0XFF007AFF),fontSize:18,fontWeight:FontWeight.w700),
                ),
              ],
            ),
          ),
          // if(isLoading)
          //   Center(
          //     child:CircularProgressIndicator(),
          //   ),
          // if(!isLoading && nameList !=null && nameList?.data?.isNotEmpty == true)
          SizedBox(
            height:300,
            child:isLoading ? Center(child: CircularProgressIndicator())
                : ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap:true,
                itemCount: nameList?.data?.length,
              itemBuilder:(context,index){
                // print("image ${nameList?.data?[index].images?[0].image}");
                return GestureDetector(
                    onTap:(){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder:(context)=>Eventssecondpage()),
                      );
                    },
                    child: Container(
                     padding: EdgeInsets.only(top:10,right:5,left:5),
                      margin:const EdgeInsets.symmetric(horizontal:5),
                      width:MediaQuery.of(context).size.width * 0.61,
                      // width:220,
                      // height: 313,
                      // color:Colors.red,
                      color:Colors.white,

                      child:Column(
                        crossAxisAlignment:CrossAxisAlignment.start,

                        children: [
                          ClipRRect(
                            child: Image.network('${nameList?.data?[index].images?[0].image}', width:250,height:200,
                              fit:BoxFit.cover,
                              errorBuilder: (context,url,error)=> new Icon(Icons.person),
                            ),
                            borderRadius:BorderRadius.circular(30),
                          ),


                          Padding(
                            padding: const EdgeInsets.only(left:1,top:10),
                            child: Text('${nameList?.data?[index].title}',
                              style:TextStyle(fontSize:16,fontWeight:FontWeight.w700),),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(left:1),
                          //   child: Text('Mon Dec ${nameList?.data?[index].dateTime}',
                          //     style:TextStyle(color:Color(0XFF007AFF),fontSize:12,fontWeight:FontWeight.w500),
                          //   ),
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${nameList?.data?[index].dateTime}',
                                style:TextStyle(color:Color(0XFF007AFF),fontSize:12,fontWeight:FontWeight.w500)),
                              Text('${nameList?.data?[index].startTime}'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left:1),
                                    child: Image.asset('assets/location.png'),
                                  ),
                                  Text('${nameList?.data?[index].type}',
                                    style:TextStyle(color:Color(0XFF878787),fontSize:12,fontWeight:FontWeight.w500,
                                        overflow:TextOverflow.clip),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right:10),
                                child: Image.asset('assets/heart.png'),
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
          Padding(
            padding: const EdgeInsets.only(left:10,right:10,bottom:10),
            child: Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children:[
                Text('Popular Eveent',
                  style:TextStyle(fontSize:18,fontWeight:FontWeight.w700),
                ),
                Text('See all',
                  style:TextStyle(color:Color(0XFF007AFF),fontSize:18,fontWeight:FontWeight.w700),
                ),
              ],
            ),
          ),
          Expanded(
            child:isLoading ? Center(child:CircularProgressIndicator())
                : GridView.builder(
              shrinkWrap:true,
              physics:ScrollPhysics(),
              gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:2,
                crossAxisSpacing:5,
                mainAxisSpacing:5,
                childAspectRatio:0.70,
              ),
              itemCount:nameList?.data?.length,
              itemBuilder:(context,index){
                return GestureDetector(
                  onTap:(){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder:(context)=>Eventssecondpage()),
                    );
                  },
                  child: Container(
                    padding:EdgeInsets.symmetric(vertical:1,horizontal:6),
                    margin:EdgeInsets.symmetric(horizontal:4),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Image.asset(nameList[index]['pic']),

                 ClipRRect(
                child:Image.network('${nameList?.data?[index].images?[0].image}',
                width:160,height:141,fit:BoxFit.cover,
                errorBuilder:(context,url,error)=>new Icon(Icons.person)),
                borderRadius:BorderRadius.circular(30),
                ),
                        Padding(
                          padding: const EdgeInsets.only(left:10,top:10),
                          child: Text('${nameList?.data?[index].title}',
                            style:TextStyle(fontSize:14,fontWeight:FontWeight.w700),),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text('${nameList?.data?[index].dateTime}',
                                  style:TextStyle(color:Color(0XFF007AFF),fontSize:12,fontWeight:FontWeight.w500)),
                            ),
                            Text('${nameList?.data?[index].startTime}'),
                          ],
                        ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left:5),
                                child: Image.asset('assets/location.png'),
                              ),
                              Text('Grand ew York',
                                style:TextStyle(color:Color(0XFF878787),fontSize:10,fontWeight:FontWeight.w500,
                                ),),

                            ],
                          ),
                          Image.asset('assets/heart.png'),


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
