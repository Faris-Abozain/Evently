import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/app_colors.dart';
import '../layouts/layout_screen.dart';
import '../routes/app_routes_name.dart';
import '../widgets/customBtn.dart';

class RegisterScreen extends StatefulWidget {
   RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formKey=GlobalKey<FormState>();

   TextEditingController passController=TextEditingController();

   TextEditingController rePassController=TextEditingController();

   TextEditingController emailController=TextEditingController(text: "faris@gmail.com");

   TextEditingController nameController=TextEditingController(text: "faris");

   bool isLoading=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                  children: [
                    Image.asset("assets/logo/event_logo.png"),
                    Center(child: Text("Evently",style: GoogleFonts.jockeyOne(color: AppColors.prime,fontSize: 36),)),
                    SizedBox(
                      height: 20,
                    ),
                    ///name
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: nameController,
                        validator: (text){
                          if(text == null || text.trim().isEmpty){
                            return "please Enter your name";
                          }return null;
                        },
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
                    ///email
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: emailController,
                        keyboardType:TextInputType.emailAddress ,
                        validator: (text){
                          if(text==null || text.trim().isEmpty){
                            return "please Enter an Email";
                          }
                          final bool emailValid =
                          RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(text);
                          if(!emailValid){
                            return "please Enter Valid Email";
                          }
                          return null;

                        },
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
                    ),
                    ///password
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller:passController,
                        keyboardType:TextInputType.visiblePassword,
                        validator: (text){
                          if(text==null || text.trim().isEmpty){
                            return "please Enter Password";
                          }if(text.length<6){
                            return "Password Should be at least 6 characters";
                          }
                          return null;
                        },
                        onTapOutside:
                            (PointerDownEvent event){
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        obscureText: true,
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
                    ///re password
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType:TextInputType.visiblePassword,
                        validator: (text){
                          if(text==null || text.trim().isEmpty){
                            return "please Enter Password";
                          }if(text.length<6){
                            return "Password Should be at least 6 characters";
                          }
                          if(text!=passController.text){
                            return "please enter correct password";
                          }
                          return null;
                        },
                        onTapOutside:
                            (PointerDownEvent event){
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        obscureText: true,
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
                      child: InkWell(
                          onTap: Register,
                          child:isLoading?CircularProgressIndicator(): CustomBtn(text: "Create Account"))
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
          ),
        )


    );
  }

  void Register() async {
    if (formKey.currentState?.validate() == true) {
      try {
        setState(() {
          isLoading = true;
        });

        final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passController.text.trim(),
        );

        User? user = FirebaseAuth.instance.currentUser;
        await user?.updateDisplayName(nameController.text.trim());
        await user?.reload();
        user = FirebaseAuth.instance.currentUser;

        setState(() {
          isLoading = false;
        });

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LayoutScreen()),
              (route) => false,
        );

      } on FirebaseAuthException catch (e) {
        setState(() {
          isLoading = false;
        });

        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        setState(() {
          isLoading = false;
        });
        print(e);
      }
    }
  }

}
