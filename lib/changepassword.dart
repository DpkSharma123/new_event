import 'package:flutter/material.dart';
class Changepassword extends StatefulWidget {
  const Changepassword({super.key});
  @override
  State<Changepassword> createState() => _Changepassword();
}

class _Changepassword extends State<Changepassword> {
  TextEditingController Currentpassword = TextEditingController();
  TextEditingController Newpassword = TextEditingController();
  TextEditingController Confirmpassword = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  // void _changePassword(){
  //   if(_formkey.currentState?.validate()??false)
  //     {
  //       if(Newpassword.text == Confirmpassword)
  //         {
  //           print('The password has been changed');
  //         }
  //     }
  // }
  void _changePassword() {
    if (_formkey.currentState?.validate() ?? false) {
      if (Newpassword.text == Confirmpassword.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Password has been changed successfully!')),
        );
        print('The password has been changed');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Passwords do not match!')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('Change Password',
            style:TextStyle(fontSize:22,fontWeight:FontWeight.w700)),
        centerTitle:true,
        leading:GestureDetector(
            onTap:(){
              Navigator.pop(context);
            },
            child: Image.asset('assets/Back-Navs.png')
        ),
      ),
      body:Form(
        key:_formkey,
        child: Column(
          children: [
           Container(
             margin:EdgeInsets.symmetric(vertical:10,horizontal:5),
             padding:EdgeInsets.only(left:15),
             decoration:BoxDecoration(
               color:Color(0XFFF7F8F8),
               borderRadius:BorderRadius.circular(15),
             ),
             child: TextFormField(
               controller:Currentpassword,
               decoration:InputDecoration(
                 border:InputBorder.none,
                 hintText:'Current Password',
                 hintStyle:TextStyle(color:Color(0XFF000000),fontSize:17,fontWeight:FontWeight.w500),
               ),
               validator:(value){
                 if(value==null || value.isEmpty){
                   return 'Current Password can not be empty';
                 }
                 return null;
               },
             ),
           ),
         Container(
           margin:EdgeInsets.symmetric(vertical:10,horizontal:5),
           padding:EdgeInsets.only(left:15),
           decoration:BoxDecoration(
             color:Color(0XFFF7F8F8),
             borderRadius:BorderRadius.circular(15),
           ),
           child: TextFormField(
             controller:Newpassword,
             decoration:InputDecoration(
               border:InputBorder.none,
               hintText:'Newpassword',
               hintStyle:TextStyle(color:Color(0XFF000000),fontSize:17,fontWeight:FontWeight.w500),
             ),
               validator:(value){
               if(value==null||value.isEmpty)
               {
                 return 'New password can not be empty';
               }
               if(value.length<6){
                 return 'Password must be at least 6 characters long';
                }
                return null;
               }
           ),
         ),
            Container(
              margin:EdgeInsets.symmetric(vertical:10,horizontal:5),
              padding:EdgeInsets.only(left:15),
              decoration:BoxDecoration(
                color:Color(0XFFF7F8F8),
                borderRadius:BorderRadius.circular(15),
              ),
              child: TextFormField(
                  controller:Confirmpassword,
                  decoration:InputDecoration(
                    border:InputBorder.none,
                    hintText:'Confirm password',
                    hintStyle:TextStyle(color:Color(0XFF000000),fontSize:17,fontWeight:FontWeight.w500),
                  ),
                  validator:(value){
                    if(value==null||value.isEmpty)
                    {
                      return 'Confirm password can not be empty';
                    }
                    if(value !=Confirmpassword.text){
                      return 'Password do not match';
                    }
                    return null;
                  }
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
                  _changePassword();
                },
                child:Text('Save',
                  style:TextStyle(fontSize:17,fontWeight:FontWeight.w700),),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
