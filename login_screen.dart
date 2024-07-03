import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';
import 'package:trecking_cuaca/styles.dart';
import 'package:trecking_cuaca/widget/custom_textfield.dart';
// ignore: unused_import
import 'package:trecking_cuaca/pages/search_field.dart';

// ignore: camel_case_types
class loginscreen extends StatefulWidget {
  const loginscreen({super.key});

  @override
  State<loginscreen> createState() => _loginscreenState();
}

// ignore: camel_case_types
class _loginscreenState extends State<loginscreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isObscure = true;

    
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'LOGIN',
          style: TextStyles.title,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('assets/images/login_ui.png'),
            const SizedBox(height:10.0),
            Text(
              'Login To Trecking Cuaca',
              style: TextStyles.title.copyWith(fontSize: 20.0),
            ),
            customtextfield(
              controller: emailController,
              textInputType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              hint: 'Email or Username',
              isObscure: false,
            ),
            const SizedBox(height: 16.0),
            customtextfield(
              controller: passwordController,
              textInputType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              hint: 'Password',
              isObscure: isObscure,
              hasSuffix: true,
              onPressed: () {
                setState(() {
                  isObscure = ! isObscure;

                });
              },
            ),
            const SizedBox(height: 16.0),
            Text('Forgot password ?', style: TextStyles.body,),
            const SizedBox(height: 24.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                
                backgroundColor: AppColors.darkblue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0
                  )
                )
              ),
              onPressed: (){
                 Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const searchfield();},
                            ),
                 );
              },
              child: Padding(
                padding:const EdgeInsets.symmetric(vertical: 16.0),
                 child: Text(
                'Login',
                style: TextStyles.title.copyWith(
                  fontSize: 20.0,
                   color: const Color.fromRGBO(246, 246, 248, 1),
                  
               ),
               ),
              ),
            ),
            const SizedBox(height: 24.0,),
            Text(
              'Dont\'t have an acoount  ?',
              style: TextStyles.body.copyWith(fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
            Text(
              'Sing UP',
              style: TextStyles.body.copyWith(fontSize: 18.0,
              color: AppColors.darkblue),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
