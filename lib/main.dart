import 'package:flutter/material.dart';
import './pages/converter_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  Widget build(BuildContext context){
    return new MaterialApp(
      title: "Unit Converter",
      debugShowCheckedModeBanner: false,
      home: new ConversionPage(),
    );
  }
}