import 'package:flutter/material.dart';
class Termspage extends StatefulWidget {
  const Termspage({super.key});

  @override
  State<Termspage> createState() => _Termspage();
}

class _Termspage extends State<Termspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        surfaceTintColor:Colors.transparent,
        backgroundColor:Colors.white,
        title:Text('Terms and Condition',
            style:TextStyle(fontSize:20,fontWeight:FontWeight.w700)),
        centerTitle:true,
        leading:GestureDetector(
            onTap:(){
              Navigator.pop(context);
            },
            child: Image.asset('assets/Back-Navs.png')
        ),
      ),
      backgroundColor:Color(0XFFFFFFFF),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left:15,right:15,top:10),
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset('assets/terms.png')),
              Text('Terms and Condition',
                style:TextStyle(fontSize:20,fontWeight:FontWeight.w700),),
              Text('The words of which the initial letter is capitalized have meanings defined under the following conditions. '
                  'The following definitions shall have '
                  'the same meaning regardless of whether they appear in singular or in'
                  'plural',
                style:TextStyle(color:Color(0XFF9796A1), fontSize:12,fontWeight:FontWeight.w500),
              ),
              SizedBox(height:20),
              Text('orem ipsum dolor sit amet consectetur. Proin urna lorem odio consectetur'
                  ' pharetra nisi sit et. Ut venenatis in id tortor arcu viverra tempor orci felis.'
                  ' Metus urna venenatis accumsan mi id.'
                  ' Molestie ipsum egestas varius mollis tellus neque nec ultrices vel.'
                  ' Integer cursus fermentum nisl pharetra massa id nibh aliquam. Nulla pellentesque diam tellus erat ac consequat a amet scelerisque. '
                  'Ornare magna consequat ut egestas ridiculus consequat. Dictumst habitasse nunc arcu elit. Massa adipiscing penatibus ut mauris.'
                  ' Nibh porttitor ornare interdum scelerisque eros duis gravida amet sodales. Pellentesque at vehicula mus suspendisse aliquam'
                  'Amet dui diam integer purus vitae. Lobortis mauris enim at vestibulum ultrices tortor. Nulla a sed neque quam sed in diam proin. Congue sit arcu volutpat nisi maecenas cursus fusce quam donec. Velit orci pharetra nisl pharetra ligula imperdiet. Donec sit dignissim bibendum tortor semper. Sem odio neque viverra in purus fames. Lacus in nec porttitor mi. Proin metus risus adipiscing in nibh fames. Imperdiet nulla ornare hac turpis vestibulum mauris id. Maecenas sed fames sed nulla rutrum odio. Tristique augue placerat mattis tincidunt et. '
                  'Amet in sit magna convallis odio in vestibulum dignissim semper. ',
                style:TextStyle(color:Color(0XFF9796A1), fontSize:12,fontWeight:FontWeight.w500,
                ),textAlign: TextAlign.justify,),
            ],
          ),
        ),
      ),
    );
  }
}
