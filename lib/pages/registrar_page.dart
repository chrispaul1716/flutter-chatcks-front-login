import 'package:flutter/material.dart';

import 'package:chatcks/widgets/input_widget.dart';
import 'package:chatcks/widgets/logo_widget.dart';
import 'package:chatcks/widgets/labels_widget.dart';
import 'package:chatcks/widgets/btnAzul_widget.dart';

class RegistrarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final Orientation orientacion = MediaQuery.of(context).orientation;

    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: (orientacion == Orientation.landscape) ? MediaQuery.of(context).size.height * 1.5 : MediaQuery.of(context).size.height * 0.95,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                Logo(titulo: 'Registrarse'), /* ---Logo---> */

                _Form(), /* ---Formulario registro--- */

                Labels(ruta: 'login', pregunta: '¿ Ya tienes una cuenta ?', opcion: 'Ingresar',), /* ---Labels---> */

                Text('Terminos y condiciones de uso', style: TextStyle(color: Colors.black54))

              ],
            ),
          ),
        ),
      )
   );
  }
}

/* ---Formulario registro--- */
class _Form extends StatefulWidget {

  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {

  final nombreCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [

           /* ---Entrada para nombre--- */
          InputPersonalizado(
            icono: Icons.perm_identity,
            phaceholder: 'Nombre',
            keyboardType: TextInputType.text,
            isPassword: false,
            txtController: nombreCtrl,
          ), 

          /* ---Entrada para email--- */
          InputPersonalizado(
            icono: Icons.mail_outline,
            phaceholder: 'Correo electrónico',
            keyboardType: TextInputType.emailAddress,
            isPassword: false,
            txtController: emailCtrl,
          ), 

          /* ---Entrada para password--- */
          InputPersonalizado(
            icono: Icons.lock_outline,
            phaceholder: 'Contraseña',
            isPassword: true,
            txtController: passCtrl,
          ), 

          /* ---Boton registrar--- */
          BotonAzul(
            text: 'Registrar',
            onPressed: () {
              print(emailCtrl.text);
              print(passCtrl.text);
              print(nombreCtrl.text);
            },
          ),

        ],
      ),
    );
  }
}