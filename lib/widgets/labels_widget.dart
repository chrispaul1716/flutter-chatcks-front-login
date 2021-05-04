import 'package:flutter/material.dart';

class Labels extends StatelessWidget {

  final String ruta;
  final String pregunta;
  final String opcion;

  const Labels({
    Key key, 
    @required this.ruta,
    @required this.pregunta,
    @required this.opcion
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(this.pregunta, style: TextStyle(color: Colors.black54, fontSize: 15.0)),
          SizedBox(height: 10.0),
          GestureDetector(
            child: Text(this.opcion, style: TextStyle(color: Colors.blue[600], fontSize: 17.0, fontWeight: FontWeight.bold)),
            onTap: () {
              Navigator.pushReplacementNamed(context, this.ruta);
            },
          ),
        ],
      ),
    );
  }
}