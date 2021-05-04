import 'package:flutter/material.dart';

/* ---Logo--- */
class Logo extends StatelessWidget {

  final String titulo;

  const Logo({
    Key key, 
    @required this.titulo
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 170.0,
        child: Column(
          children: [
            Image(image: AssetImage('assets/logotipo.png')),
            SizedBox(height: 20.0),
            Text(this.titulo, style: TextStyle(fontSize: 30.0),)
          ],
        ),
      ),
    );
  }
}