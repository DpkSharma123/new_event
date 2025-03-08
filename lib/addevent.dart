import 'package:flutter/material.dart';
class Addevent extends StatefulWidget {
  const Addevent({super.key});

  @override
  State<Addevent> createState() => _Addevent();
}

class _Addevent extends State<Addevent> {
  List<Map<String,dynamic>>nameList=[
    {
      'image':'assets/plus.png',
    },
    {
      'image':'assets/plus.png',
    },
    {
      'image':'assets/plus.png',
    },
    {
      'image':'assets/plus.png',
    },
    {
      'image':'assets/plus.png',
    },
    {
      'image':'assets/plus.png',
    },
    {
      'image':'assets/plus.png',
    },
    {
      'image':'assets/plus.png',
    },
    {
      'image':'assets/plus.png',
    },
    {
      'image':'assets/plus.png',
    },
  ];
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController cost = TextEditingController();
  TextEditingController date = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('Add Event',
          style:TextStyle(fontSize:20,fontWeight:FontWeight.w700),),
        centerTitle:true,
        automaticallyImplyLeading:false,
        surfaceTintColor:Colors.transparent,
        backgroundColor:Colors.white,
      ),
      backgroundColor:Colors.white,
      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left:10,bottom:10),
              child: Text('Photo',
              style:TextStyle(fontSize:21,fontWeight:FontWeight.w700,
              fontFamily:'Poppins'),),
            ),
            GridView.builder(
              shrinkWrap:true,
              physics: ScrollPhysics(),
              gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:5,
                  // crossAxisSpacing:5,
                // mainAxisSpacing:5,
              ),
              itemCount:nameList.length,
              itemBuilder:(context,index){
                return Container(
                  // width:MediaQuery.of(context).size.width*0.1,
                  margin:EdgeInsets.only(left:10,right:10),
                  child:Column(
                    children: [
                      Image.asset(nameList[index]['image']),
                    ],
                  ),
                );
              },
               ),
            Container(
              padding:EdgeInsets.symmetric(vertical:5,horizontal:15),
              margin:EdgeInsets.symmetric(vertical:10,horizontal:10),
              decoration:BoxDecoration(
                // color:Colors.red,
                color:Color(0XFFF7F8F8),
                borderRadius:BorderRadius.circular(40),
              ),
              child: TextFormField(
                controller:title,
                decoration:InputDecoration(
                border:InputBorder.none,
                  hintText:'Title',
                  hintStyle:TextStyle(color:Color(0XFFADA4A5),fontSize:14,fontWeight:FontWeight.w400,
                  fontFamily:'Poppins')
                ),
              ),
            ),
            Container(
              padding:EdgeInsets.symmetric(vertical:5,horizontal:15),
              margin:EdgeInsets.symmetric(vertical:10,horizontal:10),
                height:MediaQuery.of(context).size.height*0.2,
              decoration:BoxDecoration(
                // color:Colors.red,
                color:Color(0XFFF7F8F8),
                borderRadius:BorderRadius.circular(40),
              ),
              child: TextFormField(
                controller:description,
                decoration:InputDecoration(
                    border:InputBorder.none,
                    hintText:'Description',
                    hintStyle:TextStyle(color:Color(0XFFADA4A5),fontSize:14,fontWeight:FontWeight.w400,
                        fontFamily:'Poppins')
                ),
              ),
            ),
            Container(
              padding:EdgeInsets.symmetric(vertical:5,horizontal:15),
              margin:EdgeInsets.symmetric(vertical:10,horizontal:10),
              decoration:BoxDecoration(
                // color:Colors.red,
                color:Color(0XFFF7F8F8),
                borderRadius:BorderRadius.circular(40),
              ),
              child: TextFormField(
                controller:cost,
                decoration:InputDecoration(
                    border:InputBorder.none,
                    hintText:'Cost',
                    hintStyle:TextStyle(color:Color(0XFFADA4A5),fontSize:14,fontWeight:FontWeight.w400,
                        fontFamily:'Poppins')
                ),
              ),
            ),
            Container(
              padding:EdgeInsets.symmetric(vertical:5,horizontal:15),
              margin:EdgeInsets.symmetric(vertical:10,horizontal:10),
              decoration:BoxDecoration(
                // color:Colors.red,
                color:Color(0XFFF7F8F8),
                borderRadius:BorderRadius.circular(40),
              ),
              child: TextFormField(
                controller:date,
                decoration:InputDecoration(
                  border:InputBorder.none,
                    hintText:'Date',
                    hintStyle:TextStyle(color:Color(0XFFADA4A5),fontSize:14,fontWeight:FontWeight.w400,
                        fontFamily:'Poppins'),
                    suffixIcon:IconButton(
                      icon: Image.asset('assets/calendar.png'),
                        onPressed:() async{
                        DateTime? datePicked = await showDatePicker(
                          context:context,
                          initialDate:DateTime.now(),
                          firstDate:DateTime(1950),
                          lastDate:DateTime(2050),
                        );
                        if(datePicked!=null){
                          String formattedDate ='${datePicked.year}-${datePicked.month}-${datePicked.day}';
                          date.text = formattedDate;
                          print('Date Selected : $formattedDate');

                        }
                        },
        
                    ),
                  ),
                ),
              ),
              Container(
                padding:EdgeInsets.symmetric(vertical:5,horizontal:15),
                margin:EdgeInsets.symmetric(vertical:10,horizontal:10),
                decoration:BoxDecoration(
                  // color:Colors.red,
                  color:Color(0XFFF7F8F8),
                  borderRadius:BorderRadius.circular(40),
                ),
                child: TextFormField(
                  decoration:InputDecoration(
                    border:InputBorder.none,
                      hintText:'Location',
                      hintStyle:TextStyle(color:Color(0XFFADA4A5),fontSize:14,fontWeight:FontWeight.w400,
                          fontFamily:'Poppins'),
                    suffixIcon:Image.asset('assets/location22.png'),
                  ),

                ),
              ),
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
                    print('Title : ${title.text}');
                    print('Description: ${description.text}');
                    print('Cost:${cost.text}');
                    print('Date:${date.text}');
                  },
                  child: Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
