import 'package:flutter/material.dart';

class InputPersonalizado extends StatelessWidget {

  final IconData icono;
  final String phaceholder;
  final TextEditingController txtController;
  final TextInputType keyboardType;
  final bool isPassword;

  const InputPersonalizado({
    Key key, 
    @required this.icono, 
    @required this.phaceholder, 
    @required this.txtController, 
    this.keyboardType = TextInputType.text, 
    this.isPassword = false
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      padding: EdgeInsets.only(right: 20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            offset: Offset(0, 0.5),
            blurRadius: 0.5
          )
        ]
      ),
      child: TextField(
        controller: this.txtController,
        autocorrect: false,
        keyboardType: this.keyboardType,
        obscureText: this.isPassword,
        decoration: InputDecoration(
          prefixIcon: Icon(this.icono),
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
          hintText: this.phaceholder
        ),
      )
    ); 

  }
}