import 'package:flutter/material.dart';

import 'package:chatcks/widgets/input_widget.dart';
import 'package:chatcks/widgets/logo_widget.dart';
import 'package:chatcks/widgets/labels_widget.dart';
import 'package:chatcks/widgets/btnAzul_widget.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          //physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.95,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                Logo(titulo: 'Messenger'), /* ---Logo---> */

                _Form(), /* ---Formulario registro--- */

                Labels(ruta: 'registrar', pregunta: '¿ No tienes una cuenta ?', opcion: 'Crear cuenta'), /* ---Labels---> */

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

  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [

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

          /* ---Boton ingresar--- */
          BotonAzul(
            text: 'Ingresar',
            onPressed: () {
              print(emailCtrl.text);
              print(passCtrl.text);
            },
          ),

        ],
      ),
    );
  }
}