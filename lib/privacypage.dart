import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:live_project/privacymodelpage.dart';
class Privacypage extends StatefulWidget {
  const Privacypage({super.key});

  @override
  State<Privacypage> createState() => _Privacypage();
}

class _Privacypage extends State<Privacypage> {
  bool isLoading = true;
  privacymodelpage? myDatamodel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPrivacyPolicyRaj();
  }
  Future<void> fetchPrivacyPolicyRaj() async{
    final response = await http.get(Uri.parse('https://server-php-8-3.technorizen.com/kyna/api/get-privacy-policy'));
    if(response.statusCode==200) {
      privacymodelpage datamodel = privacymodelpage.fromJson(
          jsonDecode(response.body));
      print('API Status: ${datamodel.status}');
      print('Message:${datamodel}');
      print('Data Discription: ${datamodel.data?.description}');
      print('Data name: ${datamodel.data?.name}');

      setState(() {
        myDatamodel = datamodel;
        isLoading = false;
      });

    }
    else {
      print('Api not working');
    }

  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('Privacy Policy',
            style:TextStyle(fontSize:20,fontWeight:FontWeight.w700)),
        centerTitle:true,
        leading:GestureDetector(
            onTap:(){
              Navigator.pop(context);
            },
            child: Image.asset('assets/Back-Navs.png')
        ),
      ),
      // body: SingleChildScrollView(
      //   child: Padding(
      //     padding: const EdgeInsets.only(left:15,right:15,top:10),
      //     child: Column(
      //       crossAxisAlignment:CrossAxisAlignment.start,
      //       children: [
      //         SizedBox(height: 10),
      //         Center(child: Image.asset('assets/privacy policy1.png')),
      //         Text(
      //           'Privacy Policy',
      //           style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      //         ),
      //         Text(
      //             'Lorem ipsum dolor sit amet consectetur. Proin urna lorem odio c'
      //                 'onsectetur pharetra nisi sit et.'
      //                 ' Ut venenatis in id tortor arcu viverra tempor orci felis. '
      //                 'Metus urna venenatis accumsan mi id. Molestie ipsum egestas varius mollis tellus neque nec ultrices vel. '
      //                 'Integer cursus fermentum nisl pharetra massa id nibh aliquam.'
      //                 ' Nulla pellentesque diam tellus erat ac consequat a amet scelerisque. '
      //                 'Ornare magna consequat ut egestas ridiculus consequat. '
      //                 'Dictumst habitasse nunc arcu elit. Massa adipiscing penatibus ut mauris.'
      //                 ' Nibh porttitor ornare interdum scelerisque eros duis gravida amet sodales.'
      //                 ' Pellentesque at vehicula mus suspendisse aliquamt'
      //                 'dui diam integer purus vitae. Lobortis' ,
      //             style: TextStyle(color:Color(0XFF9796A1),fontSize: 12, fontWeight: FontWeight.w400),
      //         textAlign:TextAlign.justify,),
      //         Text(
      //           'Interpretation',
      //           style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      //         ),
      //         Text(
      //             'The words of which the initial letter is capitalized have meanings'
      //                 ' defined under the following conditions. '
      //                 'The following definitions shall have the same meaning regardless of'
      //                 ' whether they appear in singular or in plural \n \n'
      //                 'Lorem ipsum dolor sit amet consectetur. Proin urna lorem odio consectetur'
      //                 ' pharetra nisi sit et. Ut venenatis in id tortor arcu viverra tempor orci'
      //                 ' felis. Metus urna venenatis accumsan mi id. Molestie ipsum egestas varius'
      //                 ' mollis tellus neque nec ultrices vel. Integer cursus fermentum nisl pharetra massa id nibh aliquam.'
      //                 ' Nulla pellentesque diam tellus erat ac consequat a amet scelerisque. '
      //                 'Ornare magna consequat ut egestas ridiculus consequat. Dictumst habitasse nunc arcu elit.'
      //                 ' Massa adipiscing penatibus ut mauris.'
      //                 ' Nibh porttitor ornare interdum scelerisque eros duis gravida amet sodales.'
      //                 ' Pellentesque at vehicula mus suspendisse aliquam',
      //
      //             style: TextStyle(color:Color(0XFF9796A1),fontSize: 12, fontWeight: FontWeight.w400),
      //             textAlign:TextAlign.justify),
      //       ],
      //     ),
      //   ),
      // ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isLoading ? Center (
            child:CircularProgressIndicator(
              color:Colors.blue,
            ),
          )
          :Container(
            child:Column(
              // crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                Text('Status: ${myDatamodel?.status}'),
                Text('Message:${myDatamodel?.message}'),
                Text('id:${myDatamodel?.data?.id}'),
                Text('Name:${myDatamodel?.data?.name}'),
                Text('Description:${myDatamodel?.data?.description}'),
                Text('DataTime:${myDatamodel?.data?.dateTime}'),
              ],
            ),
          )
        ],
      ),
    );
  }
}

