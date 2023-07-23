import 'package:flutter/material.dart';
class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(child: Image.asset("assets/images/no_internet.png",width: 200,height: 200,),),
    );
  }
}
