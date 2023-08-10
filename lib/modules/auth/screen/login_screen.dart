import 'package:flutter/material.dart';
import 'package:share_trip/modules/home/screens/home_screen.dart';

import '../../../constants/image_constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height*0.2,),
                Container(
                  width: MediaQuery.of(context).size.width*0.7,
                  height: MediaQuery.of(context).size.height*0.3,
                  padding: const EdgeInsets.all(50),
                  decoration: BoxDecoration(
                    image:DecorationImage(image:  AssetImage(ImageConstants.logo),fit: BoxFit.contain)
                  ),
                ),
                                SizedBox(height: MediaQuery.of(context).size.height*0.05,),

                SizedBox(
                  width: MediaQuery.of(context).size.width*0.7,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
                    ),
                    onPressed: () {
                      //TODO: google login
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomeScreen()));


                    }, child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        decoration:  BoxDecoration(
                        image: DecorationImage(image: AssetImage(ImageConstants.googleLogo, ),)
                        ),
                      ),
                      const SizedBox(width: 8,),
                      const Text("Sign in with Google",style: TextStyle(color: Colors.black,),)
                    ],
                  )),
                )
              ],
            ),
          ),
        
          Positioned(
            bottom: 0,
            child: Container(
              height: MediaQuery.of(context).size.height*0.3,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageConstants.loginBg)
                )
              ),
            ),
          )
        
        
        
        ],
      ),
    );
  }
}
