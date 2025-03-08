import 'package:flutter/material.dart';

class Aboutpage extends StatefulWidget {
  const Aboutpage({super.key});

  @override
  State<Aboutpage> createState() => _Aboutpage();
}

class _Aboutpage extends State<Aboutpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor:Colors.transparent,
        backgroundColor:Colors.white,
        title: Text('About us',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset('assets/Back-Navs.png')),
      ),
      backgroundColor:Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left:15,right:15,top:10),
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Image.asset('assets/aboutus.png'),
              Text(
                'App About Details',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 10),
              Text(
                  'This Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your '
                      'information when You use the Service and tells'
                      ' You about Your privacy rights and how the law protects'
                      'You. We use Your Personal data to provide and improve the Service. '
                      'By using the Service, You agree to the collection and use of information in accordance with '
                      'this Privacy Policy. This Privacy Policy has been created with the help of the',
                  style: TextStyle(color:Color(0XFF9796A1),fontSize: 12, fontWeight: FontWeight.w400),
              textAlign:TextAlign.justify,),
              Text(
                'App Usuage',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 10),
              Text(
                  'The words of which the initial letter is capitalized have meanings'
                      ' defined under the following conditions. '
                      'The following definitions shall have the same meaning regardless of'
                      ' whether they appear in singular or in plural \n \n'
                      'Lorem ipsum dolor sit amet consectetur. Proin urna lorem odio consectetur'
                      ' pharetra nisi sit et. Ut venenatis in id tortor arcu viverra tempor orci'
                      ' felis. Metus urna venenatis accumsan mi id. Molestie ipsum egestas varius'
                      ' mollis tellus neque nec ultrices vel. Integer cursus fermentum nisl pharetra massa id nibh aliquam.'
                      ' Nulla pellentesque diam tellus erat ac consequat a amet scelerisque. '
                      'Ornare magna consequat ut egestas ridiculus consequat. Dictumst habitasse nunc arcu elit.'
                      ' Massa adipiscing penatibus ut mauris.'
                      ' Nibh porttitor ornare interdum scelerisque eros duis gravida amet sodales.'
                      ' Pellentesque at vehicula mus suspendisse aliquam',

                  style: TextStyle(color:Color(0XFF9796A1),fontSize: 12, fontWeight: FontWeight.w400),
              textAlign:TextAlign.justify),
            ],
          ),
        ),
      ),
    );
  }
}
