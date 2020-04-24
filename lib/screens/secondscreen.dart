import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('secondpage'),),
      body: Center(child: Text('its second'),),
    );
  }
}