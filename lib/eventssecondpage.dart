import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:live_project/eventmodel.dart';
import 'package:http/http.dart' as http;
class Eventssecondpage extends StatefulWidget {
  const Eventssecondpage({super.key});

  @override
  State<Eventssecondpage> createState() => _Eventssecondpage();
}

class _Eventssecondpage extends State<Eventssecondpage> {
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
        Eventmodel  datamodel = Eventmodel.fromJson(jsonDecode(response.body));
        print('Status:${datamodel.status}');
        print("Message:${datamodel.message}");


        setState(() {
          nameList = datamodel;
          isLoading = false;
        });
      }
    else {
      print('APi not working');
      }
  }

  // List<Map<String,dynamic>> imageList = [
  //   {
  //     'image':'assets/e1.png',
  //   },
  //   {
  //     'image':'assets/e2.png',
  //   },
  //   {
  //     'image':'assets/e3.png',
  //   },
  // ];


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor:Colors.white,
      // appBar:AppBar(
      //   automaticallyImplyLeading:false,
      //
      // ),
      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width:width*0.18),
            Stack(
              children: [
                Image.asset('assets/party.png'),
                Positioned(
                  left:24,
                    top:70,
                    child:
                    GestureDetector(
                      onTap:(){
                        Navigator.pop(context);
                      },

                        child: Image.asset('assets/Back-Navs.png')
                    ),
                    ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children: [
                  Text('The Aston Vill Hotel',
                    style:TextStyle(fontSize:23,fontWeight:FontWeight.w700),),
                  ElevatedButton(
                    style:ElevatedButton.styleFrom(
                      backgroundColor:Color(0XFF007AFF),
                      foregroundColor:Color(0XFFFFFFFF),
                      minimumSize:Size(5, 30),
                      shape:RoundedRectangleBorder(
                        borderRadius:BorderRadius.circular(10),
                      ),
                    ),
                    onPressed:(){

                    },
                    child:Text('Follow',
                      style:TextStyle(fontSize:12,fontWeight:FontWeight.w600),),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.asset('assets/Date.png'),
                  SizedBox(width:10),
                  Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [

                      Text('${nameList?.message}',
                        style:TextStyle(fontSize:14,fontWeight:FontWeight.w700),),
                      Text('${nameList?.status}',
                          style:TextStyle(color:Color(0XFF9DB2BF),fontSize:12,fontWeight:FontWeight.w400) )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.asset('assets/Pin_1.png'),
                  SizedBox(width:10),
                  Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                      Text('Goonj NGO',
                        style:TextStyle(fontSize:14,fontWeight:FontWeight.w700),),
                      Text('Sarita Vihar, New Delhi-110076',
                          style:TextStyle(color:Color(0XFF9DB2BF),fontSize:12,fontWeight:FontWeight.w400) )
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              thickness:1,
              color:Color(0XFFD7D7D7),
              indent:20,
              endIndent:20,
            ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Image.asset('assets/Ellipse 4.png'),
                      SizedBox(width:10),
                      Column(
                        children: [
                          Text('Annaclaramm',
                            style:TextStyle(fontSize:18,fontWeight:FontWeight.w700),),
                          Text('Storied allowing you th',
                              style:TextStyle(color:Color(0XFFB0B0B0),fontSize:12,fontWeight:FontWeight.w400)),
                        ],
                      ),
                    ],
                  ),
                ),
            Padding(
              padding: const EdgeInsets.only(left:8.0),
              child: Text('About Event',
                  style:TextStyle(fontSize:18,fontWeight:FontWeight.w700)),
            ),
            Padding(
              padding: const EdgeInsets.only(left:8.0,right:8),
              child: Text('Lorem ipsum dolor sit amet consectetur. '
                  'Lacus maecenas volutpat ipsum magna pharetra eu tellus. '
                  'Vel vestibulum quis ut enim id dui amet diam arcu. '
                  'Id convallis tincidunt amet ornare eget.'
                  ' Fermentum sed risus in gravida ut amet. '
                  'Ac leo vitae elementum feugiat neque pharetra cursus. '
                  'Lectus eget urna lectus neque suspendisse sit tempor.',
                  style:TextStyle(color:Color(0XFF9DB2BF),fontSize:14,fontWeight:FontWeight.w500),
                    textAlign:TextAlign.justify),
            ),
            Padding(
              padding: const EdgeInsets.only(left:8.0),
              child: RichText(
                  text:TextSpan(
                    children: [
                      TextSpan(
                        text:'Read More',
                        style:TextStyle(color:Color(0XFF007AFF),fontSize:14,fontWeight:FontWeight.w500),
                        recognizer:TapGestureRecognizer()
                        .. onTap =(){
                            print('Terms of Service"');
                                  }
                      ),
                    ],
                  ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:8,right:8),
              child: Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children:[
                  Text('Gallery (Pre-Event)',
                    style:TextStyle(fontSize:18,fontWeight:FontWeight.w700),
                  ),
                  Text('See all',
                    style:TextStyle(color:Color(0XFFF7E683),fontSize:14,fontWeight:FontWeight.w500),
                  ),
                ],
              ),
            ),
                SizedBox(
                  height:110,
                  child: isLoading?Center(child:CircularProgressIndicator())
                  :ListView.builder(
                    shrinkWrap:true,
                    scrollDirection:Axis.horizontal,
                    // itemCount:imageList.length,
                      itemCount:nameList?.data?.length,
                    itemBuilder:(context,index){
                      return Container(
                        padding: EdgeInsets.symmetric(vertical:1,horizontal:4),
                        margin:const EdgeInsets.symmetric(horizontal:4),
                        width:130,
                        child:Column(
                          crossAxisAlignment:CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              child:Image.network('${nameList?.data?[index].images?[0].image}',
                              width:MediaQuery.of(context).size.width*0.9,
                                height:MediaQuery.of(context).size.height*0.13,
                                fit:BoxFit.cover,

                              errorBuilder:(context,url,error)=> new Icon(Icons.person),),
                              borderRadius:BorderRadius.circular(20),
                            ),
                            
                          ],
                        ),
                      );
                    },
                  ),
                ),
            Padding(
              padding: const EdgeInsets.only(left:8,right:8),
              child: Text('Locatione',style:TextStyle(fontSize:18,fontWeight:FontWeight.w700),),
            ),
            Padding(
              padding: const EdgeInsets.only(left:8,right:8),
              child: Row(
                children: [
                  Image.asset('assets/location.png'),
                  Text('Grand Park. New York',
                    style:TextStyle(color:Color(0XFF878787),fontSize:15,
                        fontWeight:FontWeight.w500),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:8,right:8,top:8),
              child: Image.asset('assets/map1.png'),
            ),
          ],
        ),
      ),
    );
  }
}
