import 'package:flutter/material.dart';
 
import 'package:chatcks/routes/rutas.dart';


void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat CKS',
      initialRoute: 'login',
      routes: appRutas,
    );
  }
}