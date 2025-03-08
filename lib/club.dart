import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:live_project/clubsecondpage.dart';
import 'package:live_project/clubusermodel.dart';
// import 'package:live_project/eventmodel.dart';
import 'package:http/http.dart' as http;
class Club extends StatefulWidget {
  const Club({super.key});

  @override
  State<Club> createState() => _Club();
}

class _Club extends State<Club> {
   bool isLoading = true;
  Clubusermodel ? nameList;
  // List<Map<String,dynamic>> nameList=[
  //   {
  //     'text':'Tech Trends Expo 2024',
  //     'image':'assets/tech trend.png',
  //   },
  //   {
  //     'text':'Cultural Carnival Night',
  //     'image':'assets/cultural.png',
  //   },
  //   {
  //     'text':'Fitness Fest 2024',
  //     'image':'assets/fitness.png',
  //   },
  //   {
  //     'text':'Innovate & Inspire ',
  //     'image':'assets/innovate.png',
  //   },
  //   {
  //     'text':'Fitness Fest 2024',
  //     'image':'assets/fitness.png',
  //   },
  //
  // ];
   @override
  void initState() {
     super.initState();
     fetchapp();
   }
   Future<void> fetchapp()async{
     Map<String,String> body ={
       'club id':'59'

     };
     print('bODY.....${body}');
      final response = await http.post(Uri.parse('https://server-php-8-3.technorizen.com/kyna/api/getClubusers'),
      headers:<String,String>{
        'Content-Type' :'application/json;charst=UTF-8',
      },
        body:jsonEncode(body),
      );
     if(response.statusCode==200){
       Clubusermodel datamodel = Clubusermodel.fromJson(jsonDecode(response.body));
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

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar:AppBar(
        automaticallyImplyLeading: false,
        surfaceTintColor:Colors.transparent,
        backgroundColor:Colors.white,
        title:Text('Club List',
          style:TextStyle(fontSize:20,fontWeight:FontWeight.w700),),
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(width: width * 0.18),
            isLoading ? Center(child:CircularProgressIndicator())
            :ListView.builder(
              shrinkWrap:true,
              physics:ScrollPhysics(),
              itemCount:nameList?.data?.length,
              itemBuilder:(context,index){
                return GestureDetector(
                  onTap:(){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>Clubsecondpage(dpkId: nameList?.data?[index].id ?? '59'))
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
                           // Image.asset(nameList[index]['image']),
                            ClipRRect(
                              child:Image.network('${nameList?.data?[index].image}',
                              width:131,height:116,fit:BoxFit.cover,
                                errorBuilder:(context,url,error)=>new Icon(Icons.person),
                              ),
                              borderRadius:BorderRadius.circular(20),
                            ),
                          SizedBox(width:10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment:CrossAxisAlignment.start,
                              children: [
                                Text('${nameList?.data?[index].clubName}',
                                style:TextStyle(fontSize: 16,fontWeight:FontWeight.w700,)
                                ),

                                SizedBox(height:5,),
                                // Text('Mon. Dec 24-18.00-23.00 PM',
                                //   style:TextStyle(color:Color(0XFF007AFF),
                                //       fontSize:12,fontWeight:FontWeight.w500),),
                                Text('${nameList?.data?[index].address}',
                                    style:TextStyle(color:Color(0XFF007AFF),fontSize:12,fontWeight:FontWeight.w500)),
                                SizedBox(height:5),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset('assets/location.png'),
                                        SizedBox(
                                          width:130,
                                          child: Text('${nameList?.data?[index].address}',
                                            style:TextStyle(color:Color(0XFF878787),
                                                fontSize:12,fontWeight:FontWeight.w500),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
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
