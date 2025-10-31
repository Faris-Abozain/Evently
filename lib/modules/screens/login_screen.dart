import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/app_colors.dart';
import '../layouts/layout_screen.dart';
import '../routes/app_routes_name.dart';
import '../widgets/customBtn.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
   LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey=GlobalKey<FormState>();

   TextEditingController emailController=TextEditingController(text: "faresabozein@gmail.com");

   TextEditingController passController=TextEditingController();

   bool isLoading =false;

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
                 TextFormField(
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
                 SizedBox(
                   height: 20,
                 ),
                 TextFormField(
                   controller: passController,
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
                         onTap:()=>login(context),
                         child:isLoading?CircularProgressIndicator(): CustomBtn(text: "Login")),
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
                     onTap: (){},
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
       ),
     )


    );
  }

  void login(BuildContext context) async {
    if (formKey.currentState?.validate() == true) {
      try {
        setState(() {
          isLoading = true;
        });

        final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passController.text.trim(),
        );

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
          isLoading = true;
        });

        await Future.delayed(const Duration(seconds: 2));

        setState(() {
          isLoading = false;
        });

        if (e.code == 'user-not-found') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('No user found for that email.')),
          );
        } else if (e.code == 'wrong-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Wrong password provided.')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.message ?? 'Login failed')),
          );
        }
      }
    }
  }

  // Future<UserCredential> signInWithGoogle() async {
  //   // Trigger the authentication flow
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //
  //   // Obtain the auth details from the request
  //   final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
  //
  //   // Create a new credential
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );
  //
  //   // Once signed in, return the UserCredential
  //   return await FirebaseAuth.instance.signInWithCredential(credential);
  // }

}
