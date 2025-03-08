import 'package:flutter/material.dart';
class Supportpage extends StatefulWidget {
  const Supportpage({super.key});

  @override
  State<Supportpage> createState() => _Supportpage();
}

class _Supportpage extends State<Supportpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('Support',
            style:TextStyle(fontSize:22,fontWeight:FontWeight.w700)),
        centerTitle:true,
        leading:GestureDetector(
          onTap:(){
            Navigator.pop(context);
          },
            child: Image.asset('assets/Back-Navs.png'),
        ),
      ),
      backgroundColor:Colors.white,
      body:Column(
        children: [
          Image.asset('assets/radioman1.png'),
          Container(
           height:MediaQuery.of(context).size.height*0.2,
            margin:EdgeInsets.symmetric(vertical:10,horizontal:10),
            padding:EdgeInsets.symmetric(horizontal:10),
            decoration:BoxDecoration(
            border:Border.all(color:Colors.black,width:1),
              borderRadius:BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                Text('How can we help?'),
                TextFormField(
                  decoration:InputDecoration(
                    border:InputBorder.none,
                    hintText:'Type Here............',
                    hintStyle:TextStyle(color:Color(0XFF545454),fontSize:12,fontWeight:FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style:ElevatedButton.styleFrom(
                backgroundColor:Color(0XFF007AFF),
                foregroundColor:Color(0XFFFFFFFF),
                minimumSize:Size(382, 60),
                elevation:5,
              ),
              onPressed:(){

              },
              child:Text('Submit',
                style:TextStyle(fontSize:17,fontWeight:FontWeight.w700),),
            ),
          ),
        ],
      ),
    );
  }
}
