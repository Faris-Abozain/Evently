import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/app_colors.dart';
import '../routes/app_routes_name.dart';
import '../widgets/customBtn.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SafeArea(
       child: SingleChildScrollView(
         child: Column(
             children: [
               Image.asset("assets/logo/event_logo.png"),
               Center(child: Text("Evently",style: GoogleFonts.jockeyOne(color: AppColors.prime,fontSize: 36),)),
             SizedBox(
               height: 20,
             ),
               TextFormField(
                 onTapOutside:
                     (PointerDownEvent event){
                   FocusManager.instance.primaryFocus?.unfocus();
                 },
               decoration: InputDecoration(
                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(16),borderSide: BorderSide(color: AppColors.grey)),
                 prefixIcon: Image.asset("assets/icons/email_icon.png"),
                 hintText: "email",
                 hintStyle: TextStyle(color: Colors.grey),
                 focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.grey),borderRadius: BorderRadius.circular(16))
               ),
             ),
               SizedBox(
                 height: 20,
               ),
               TextFormField(
                 onTapOutside:
                 (PointerDownEvent event){
                   FocusManager.instance.primaryFocus?.unfocus();
                 },
         
               decoration: InputDecoration(
                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(16),borderSide: BorderSide(color: AppColors.grey)),
                 prefixIcon: Image.asset("assets/icons/lock_icon.png"),
                 suffixIcon: Icon(Icons.visibility,color: AppColors.grey,),
                 hintText: "password",
                 hintStyle: TextStyle(color: Colors.grey),
                   focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.grey),borderRadius: BorderRadius.circular(16))
               ),
             ),
               Align(
                   alignment: Alignment.topRight,
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: InkWell(
                         onTap: () {
                           Navigator.pushNamed(context, AppRoutesName.resetPassword);
                         },
                         child: Text("Forget Password?",style: TextStyle(color: AppColors.prime,fontSize: 15,fontWeight: FontWeight.w600,decoration: TextDecoration.underline,decorationColor: AppColors.prime,decorationThickness: 2),)),
                   )),
               Padding(
                 padding: const EdgeInsets.all(14.0),
                 child: InkWell(
                   onTap: () {
                   },
                   child: InkWell(
                       onTap: () {
                         Navigator.pushNamedAndRemoveUntil(context, AppRoutesName.layout, (route) => false,);
                       },
                       child: CustomBtn(text: "Login")),
                 ),
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text("Don’t Have Account ? ",style: TextStyle(fontSize: 14),),
                   InkWell(
                       onTap: () {
                      Navigator.pushNamed(context, AppRoutesName.register);
                       },
                       child: Text("Create Account",style: TextStyle(color: AppColors.prime,fontWeight: FontWeight.w600,fontSize: 16,decoration: TextDecoration.underline,decorationColor: AppColors.prime,decorationThickness: 2),)),
                 ],
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 1,
                      width: 160,
                      decoration: BoxDecoration(color: AppColors.prime),
                    ),
                  ),
                   Text("or"),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Container(
                      height: 1,
                      width: 160,
                      decoration: BoxDecoration(color: AppColors.prime),
                                     ),
                   )
                 ],
               ),
               Padding(
                 padding: const EdgeInsets.all(17.0),
                 child: InkWell(
                   onTap: () {
                   },
                   child: Container(
                     height: 55,
                     width: 360,
                     decoration: BoxDecoration(
                         color: Colors.transparent,
                         borderRadius: BorderRadius.circular(16),
                       border: Border.all(color: AppColors.prime)
                     ),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Image.asset("assets/icons/google_icon.png",height: 25,width: 25,),
                         Text(
                           " Login With Google",
                           style: TextStyle(color: AppColors.prime, fontSize: 18,fontWeight: FontWeight.w500),
                         ),
                       ],
                     ),
                   ),
                 ),
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   AnimatedToggleSwitch<int>.rolling(
                     style: ToggleStyle(
                       borderRadius: BorderRadius.circular(20),
                       borderColor: AppColors.prime,
                       backgroundColor: Colors.transparent,
                       indicatorColor: AppColors.prime,
                     ),
                     current: 0,
                     values: [0, 1],
                     iconList: [
                       Image.asset("assets/icons/america.png"),
                       Image.asset("assets/icons/egypt.png"),
                     ],
                   )
                 ],
               )
         
             ]
             ),
       ),
     )


    );
  }
}
