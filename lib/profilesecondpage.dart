import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
class Profilesecondpage extends StatefulWidget {
  const Profilesecondpage({super.key});

  @override
  State<Profilesecondpage> createState() => _Profilesecondpage();
}

class _Profilesecondpage extends State<Profilesecondpage> {
  TextEditingController name = TextEditingController();
  TextEditingController surname= TextEditingController();
  TextEditingController number =  TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController date = TextEditingController();


  String selectedGender = 'Male';
  List<String>genderitems = ['Male','Female'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
      title:Text('Profile',
        style:TextStyle(fontSize:22,fontWeight:FontWeight.w700)),
        centerTitle:true,
        leading:GestureDetector(
            onTap:(){
              Navigator.pop(context);
            },
            child: Image.asset('assets/Back-Navs.png')
        ),
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom:15,top:20),
                    child: Image.asset('assets/profileman.png'),
                  ),
                  Positioned(
                      bottom:0,
                      left:30,
                      child:Image.asset('assets/tabler_edit (1).png'),
                  ),
                ],
              ),
            ),
            Container(
              margin:EdgeInsets.symmetric(vertical:10,horizontal:10),
              padding:EdgeInsets.only(left:10),
              decoration:BoxDecoration(
                color:Color(0XFFF7F8F8),
                borderRadius:BorderRadius.circular(15),
        
              ),
              child: TextFormField(
                keyboardType:TextInputType.name,
                controller:name,
                decoration:InputDecoration(
                  border:InputBorder.none,
                  hintText:'John',
                  hintStyle:TextStyle(color:Color(0XFF007AFF),fontFamily:'Poppins', fontSize:14,fontWeight:FontWeight.w600),
                ),
              ),
            ),
            Container(
              margin:EdgeInsets.symmetric(vertical:10,horizontal:10),
              padding:EdgeInsets.only(left:10),
              decoration:BoxDecoration(
                color:Color(0XFFF7F8F8),
                borderRadius:BorderRadius.circular(15),
        
              ),
              child: TextFormField(
                keyboardType:TextInputType.name,
                controller:surname,
                decoration:InputDecoration(
                  border:InputBorder.none,
                  hintText:'Smith',
                  hintStyle:TextStyle(color:Color(0XFF007AFF),fontFamily:'Poppins',fontSize:14,fontWeight:FontWeight.w600),
                ),
              ),
            ),
            Container(
              margin:EdgeInsets.symmetric(horizontal:10,vertical:10),
              padding:EdgeInsets.symmetric(horizontal:10),
              decoration:BoxDecoration(
                color:Color(0XFFF7F8F8),
                borderRadius:BorderRadius.circular(15),
              ),
              child: TextFormField(
                controller:date,
                decoration:InputDecoration(
                  border:InputBorder.none,
                  hintText:'12-02-2024',
                  hintStyle:TextStyle(color:Color(0XFF007AFF),fontSize:14,fontWeight:FontWeight.w600),
                  suffixIcon:IconButton(
                    icon:Image.asset('assets/calendar.png'),
                    onPressed:() async{
                      DateTime? datePicked = await showDatePicker(
                          context: context,
                          initialDate:DateTime.now(),
                          firstDate: DateTime(1950),
                          lastDate: DateTime(2050),
                          builder:(context,child){
                            return Theme(
                              data:ThemeData.light().copyWith(
                                colorScheme:ColorScheme.light(
                                  primary:Colors.green,
                                  onSurface:Colors.black,
                                ),
                                textButtonTheme:TextButtonThemeData(
                                  style : TextButton.styleFrom(
                                    foregroundColor:Colors.blue,
                                  ),
                                ),
                              ),
                              child:child!,
                            );
                          }
                      );
                      if(datePicked!=null){
                        String formattedDate =
                            '${datePicked.year}-${datePicked.month}-${datePicked.day}';
                        date.text = formattedDate;
                        print('Date selected:$formattedDate');
                      }
                    },
                  ),
                ),
              ),
            ),
            Container(
              margin:EdgeInsets.symmetric(vertical:10,horizontal:10),
              padding:EdgeInsets.only(left:10),
              decoration:BoxDecoration(
                color:Color(0XFFF7F8F8),
                borderRadius:BorderRadius.circular(15),
        
              ),
              child: TextFormField(
                keyboardType:TextInputType.emailAddress,
                controller:email,
                decoration:InputDecoration(
                  border:InputBorder.none,
                  hintText:'test@gmail.com',
                  hintStyle:TextStyle(color:Color(0XFF007AFF),fontSize:14,fontWeight:FontWeight.w600),
                  suffixIcon:Image.asset('assets/sms.png'),
                  contentPadding:EdgeInsets.symmetric(vertical:15),
                ),
              ),
            ),
            Row(
              children: [
              SizedBox(
                width:100,
                child: Container(
                  margin:EdgeInsets.symmetric(vertical:10,horizontal:5),
                  decoration:BoxDecoration(
                    color:Color(0XFFF7F8F8),
                    // color:Colors.red,
                     borderRadius:BorderRadius.circular(15),
                  ),
                  child: CountryCodePicker(
                    onChanged:(code){
                      print('Selected Country Code:${code.dialCode}');
                      print('Selected Country name:${code.name}');
                    },
                    initialSelection:'IN',
                    showFlagDialog:false,
                    showFlag:false,
                    alignLeft:true,
                    padding:EdgeInsets.symmetric(horizontal:10),
                    onInit:(code)=>debugPrint("on init ${code?.name} ${code?.dialCode}${code?.name}"),
                  ),
                ),
              ),
                Expanded(
                  child: Container(
                    margin:EdgeInsets.symmetric(vertical:10,horizontal:5),
                    padding:EdgeInsets.symmetric(horizontal:10),
                    decoration:BoxDecoration(
                      color:Color(0XFFF7F8F8),
                      // color:Colors.red,
                      borderRadius:BorderRadius.circular(15),
                    ),
                    child: TextFormField(
                      controller:number,
                      keyboardType:TextInputType.number,
                      decoration:InputDecoration(
                        border:InputBorder.none,
                        hintText:'7412589635',
                        hintStyle:TextStyle(color:Color(0XFF007AFF),fontSize:14,fontWeight:FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin:EdgeInsets.symmetric(vertical:10,horizontal:10),
              padding:EdgeInsets.symmetric(horizontal:10),
              decoration:BoxDecoration(
                color:Color(0XFFF7F8F8),
                borderRadius:BorderRadius.circular(15),

              ),
              child: DropdownButton(
                isExpanded:true,
                  underline:SizedBox(),
                  value:selectedGender,
                  // icon:Icon(Icons.keyboard_arrow_down),
                  items: genderitems.map((String genderItem){
                    return DropdownMenuItem(
                      value:genderItem,
                      child:Text(genderItem,style:TextStyle(color:Color(0XFF007AFF)),),
                    );
                  }).toList(),
                  onChanged:(String ? newValue){
                    setState(() {
                      selectedGender = newValue!;
                    });
                  }
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:8,right:8,top:20),
              child: ElevatedButton(
                style:ElevatedButton.styleFrom(
                  backgroundColor:Color(0XFF007AFF),
                  foregroundColor:Colors.white,
                  minimumSize: Size(382, 60),
                  elevation:5,
                ),
                  onPressed:(){
                    print('Name:${name.text}');
                    print('Surname:${surname.text}');
                    print('Date of Birth:${date.text}');
                    print('Email:${email.text}');
                    print('Phone Number: ${number.text}');
                    print('Selected Gender:${selectedGender}');
                  },
                child:Text('Continue',style:TextStyle(
                fontSize:17,fontWeight:FontWeight.w600)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
