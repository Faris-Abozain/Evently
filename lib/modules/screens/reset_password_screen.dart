import 'package:events/modules/widgets/customBtn.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Forget Password",style: TextStyle(color: Colors.black,fontSize: 20),),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset("assets/images/reset_pass_image.png"),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CustomBtn(text: "Reset Password"),
            )
          ],
        ),
      ),
    );
  }
}
