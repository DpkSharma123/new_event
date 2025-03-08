import 'package:flutter/material.dart';
class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _Notifications();
}

class _Notifications extends State<Notifications> {
  List<Map<String,dynamic>>nameList=[
    {
      'name':'Micheal Ulasi commented',
      'comment':'on your SAAS Mobile App'

    },
    {
      'name':'Roman Kutepov liked your',
      'comment':'SAAS mobile app design'
    },
    {
      'name':'Roman Kutepov liked your',
      'comment':'SAAS mobile app design'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('Notifications',
          style:TextStyle(fontSize:24,fontWeight:FontWeight.w600),),
        centerTitle:true,
        automaticallyImplyLeading: false,
      ),
      body:Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left:12,bottom:8),
            child: Row(
              children: [
                Text('Unread',
                  style:TextStyle(color:Color(0XFF20222C),fontSize:16,fontWeight:FontWeight.w600),),
                SizedBox(width:5),
                Container(
                  width:20,
                  alignment:Alignment.center,
                  decoration:BoxDecoration(
                  border:Border.all(color:Color(0XFF007AFF),width:2),
                    borderRadius:BorderRadius.circular(4),
                  ),
                  child: Text('2',
                  style:TextStyle(color:Color(0XFF007AFF),fontSize:10,fontWeight:FontWeight.w500 ),),
                ),
              ],
            ),
          ),
          Card(
            elevation:5,
            color:Color(0XFFFFFFFF),
            margin:EdgeInsets.symmetric(vertical:10,horizontal:10),
            child: Padding(
              padding: const EdgeInsets.only(left:8,right:8,top:10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/circle1.png'),
                      SizedBox(width:10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Micheal Ulasi started to',
                            style:TextStyle(color:Color(0XFF20222C),fontSize:14,fontWeight:FontWeight.w600),),
                          Text('following you',
                            style:TextStyle(color:Color(0XFF20222C),fontSize:14,fontWeight:FontWeight.w400),),
                        ],
                      ),
                    ],
                  ),
                  Text('Just now',
                    style:TextStyle(fontSize:10,fontWeight:FontWeight.w400),),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:12,bottom:8),
            child: Row(
              children: [
                Text('Yesterday',
                  style:TextStyle(color:Color(0XFF20222C),fontSize:16,fontWeight:FontWeight.w600),),
                SizedBox(width:5),
                Container(
                  width:20,
                  alignment:Alignment.center,
                  decoration:BoxDecoration(
                    border:Border.all(color:Color(0XFF20222C),width:2),
                    borderRadius:BorderRadius.circular(4),
                  ),
                  child: Text('17',
                    style:TextStyle(color:Color(0XFF20222C),fontSize:10,fontWeight:FontWeight.w500 ),),
                ),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap:true,
            itemCount:nameList.length,
            itemBuilder:(context,index){
              return Card(
                color:Color(0XFFFFFFFF),
                elevation:5,
                margin:EdgeInsets.symmetric(vertical:10,horizontal:10),
                child: Container(
                  padding: const EdgeInsets.only(left:8,right:8,top:10),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/circle1.png'),
                          SizedBox(width:10),
                          Column(
                            children: [
                              Text(nameList[index]['name']),
                              Text(nameList[index]['comment'],
                              style: TextStyle(color:Color(0XFF20222C),fontSize:14,fontWeight:FontWeight.w400)),
                            ],
                          ),
                        ],
                      ),
                      Text('10 hr ago',
                          style:TextStyle(fontSize:10,fontWeight:FontWeight.w400)),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );

  }
}
