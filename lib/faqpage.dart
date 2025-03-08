import 'package:flutter/material.dart';
class Faqpage extends StatefulWidget {
  const Faqpage({super.key});

  @override
  State<Faqpage> createState() => _Faqpage();
}

class _Faqpage extends State<Faqpage> {
  List<Map<String,dynamic>>nameList=[
    {
      'question' : 'What services do you offer Profashion?',
      'status' : false,
      'answer' :' .Valid from July 25th to August 10th \n 20% off on all summer fashion items\n '
          ' All blouses, dresses, pants, and tops listed under the summer collection'
    },
    {
      'question' :'How can I get a quote for your services?',
      'status' :false,
      'answer':'.Valid from July 25th to August 10th \n 20% off on all summer fashion items\n '
          ' All blouses, dresses, pants, and tops listed under the summer collection',
    },
    {
      'question':'How can I contact your customer supportSelect Profashion ?',
      'status' :false,
      'answer':'.Valid from July 25th to August 10th \n 20% off on all summer fashion items\n '
          ' All blouses, dresses, pants, and tops listed under the summer collection',

    },
    {
      'question':'What is your refund policy ?',
      'status' :false,
      'answer':'.Valid from July 25th to August 10th \n 20% off on all summer fashion items\n '
          ' All blouses, dresses, pants, and tops listed under the summer collection',

    },
    {
      'question':'How long does it take to complete a project?',
      'status' :false,
      'answer':'.Valid from July 25th to August 10th \n 20% off on all summer fashion items\n '
          ' All blouses, dresses, pants, and tops listed under the summer collection',

    },
  ];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar:AppBar(
        title:Text('Faq',
            style:TextStyle(fontSize:22,fontWeight:FontWeight.w700)),
        centerTitle:true,
        leading:GestureDetector(
          onTap:(){
            Navigator.pop(context);
          },
          child: Image.asset('assets/Back-Navs.png'),
        ),
      ),
      body:Column(
        children: [
          Image.asset('assets/faqs.png'),
          Text('FAQ',
              style:TextStyle(fontSize:36,fontWeight:FontWeight.w700)),
          Text('Most common question about our services',
              style:TextStyle(color:Color(0XFF9796A1),fontSize:12,fontWeight:FontWeight.w700)),

          SizedBox(height:height*0.02),
          Expanded(
            child: ListView.builder(
              shrinkWrap:true,
              itemCount:nameList.length,
              itemBuilder:(context,index){
                return Container(
                  margin:EdgeInsets.symmetric(vertical:10,horizontal:8),
                  padding:EdgeInsets.symmetric(horizontal:5),
                  decoration:BoxDecoration(
                    color:Color(0XFFF4F8FF),
                    // color:Colors.red,
                    borderRadius:BorderRadius.circular(15),
                  ),
                  child:Column(
                    children: [
                      ListTile(
                        title:Text(nameList[index]['question'],
                        style:TextStyle(color:Color(0XFF1E1E1E),
                        fontSize:14,fontWeight:FontWeight.w700),
                        ),
                        trailing:Icon(nameList[index]['status']?Icons.keyboard_arrow_up:Icons.keyboard_arrow_down),
                        onTap:(){
                          setState(() {
                            nameList[index]['status']=!nameList[index]['status'];
                          });
                        },
                      ),
                      if(nameList[index]['status'])
                        Padding(
                          padding: const EdgeInsets.only(left:8,right:16,bottom:16),
                          child: Text(nameList[index]['answer']),
                        ),
                    ],
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
