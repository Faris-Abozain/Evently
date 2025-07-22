import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/app_colors.dart';
import '../routes/app_routes_name.dart';
import '../widgets/customBtn.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onTapOutside:
                          (PointerDownEvent event){
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16),borderSide: BorderSide(color: AppColors.grey)),
                          prefixIcon: Icon(Icons.person),
                          prefixIconColor: AppColors.grey,
                          hintText: "Name",
                          hintStyle: TextStyle(color: Colors.grey),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.grey),borderRadius: BorderRadius.circular(16))
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onTapOutside:
                          (PointerDownEvent event){
                        FocusManager.instance.primaryFocus?.unfocus();
                      },

                      decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16),borderSide: BorderSide(color: AppColors.grey)),
                          prefixIcon: Image.asset("assets/icons/email_icon.png"),
                          hintText: "Email",
                          hintStyle: TextStyle(color: Colors.grey),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.grey),borderRadius: BorderRadius.circular(16))
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
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
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
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
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: CustomBtn(text: "Create Account")
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already Have Account ? ",style: TextStyle(fontSize: 14),),
                      InkWell(
                          onTap: () {

                          },
                          child: InkWell(
                              onTap:() {
                                Navigator.pushNamed(context, AppRoutesName.login);
                              } ,
                              child: Text("Login",style: TextStyle(color: AppColors.prime,fontWeight: FontWeight.w600,fontSize: 16,fontStyle:FontStyle.italic,decoration: TextDecoration.underline,decorationColor: AppColors.prime,decorationThickness: 2 ),))),
                    ],
                  ),


                ]
            ),
          ),
        )


    );
  }
}
