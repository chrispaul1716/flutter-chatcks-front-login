import 'dart:io'; /* Se usa Platform */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:chatcks/widgets/chat_message.dart';

class ChatPage extends StatefulWidget {

  @override
  _ChatPageState createState() => _ChatPageState();
}
                                             /* Para usar animaciones */
class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {

  final _txtController = TextEditingController();
  final _focuNode = FocusNode();

  List<ChatMessage> _mensajes = [
    /* ChatMessage(uid: '123', texto: 'Hola Mundo'),
    ChatMessage(uid: '456', texto: 'Hola Mundo'),
    ChatMessage(uid: '123', texto: 'Hola Mundo'),
    ChatMessage(uid: '456', texto: 'Hola Mundo'),
    ChatMessage(uid: '123', texto: 'Hola Mundo'), */
  ];

  bool _estaEscribiendo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Row(
          children: [
            CircleAvatar(
              child: Text('Ma', style: TextStyle(fontSize: 12.0)),
            ),
            SizedBox(width: 20.0),
            Text('María', style: TextStyle(color: Colors.black),)
          ],
        ),
        elevation: 2,

      ),
      body: Container(
        child: Column(
          children: [

            /* Lista de mensajes */
            Flexible(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                //itemBuilder: (_, i) => Text('msg $i'),
                itemCount: _mensajes.length,
                itemBuilder: (_, i) => _mensajes[i],
                reverse: true,
              )
            ),

            Divider(height: 1,),

            Container(
              // height: 100.0,
              color: Colors.white,
              child: _inputChat(), /* ---Caja para escribir mensaje--- */
            )

          ],

        ),
     ),
   );
  }

  /* ---Caja para escribir mensaje--- */
  Widget _inputChat() {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [

            Flexible(
              child: TextField(
                controller: _txtController,
                onSubmitted: _textoSubmit, /* ---textoSubmit--- */
                onChanged: (String texto) {
                  /* Si estan escribiendo */
                  setState(() {
                    if (texto.trim().length > 0) {
                      _estaEscribiendo = true;
                    } else {
                      _estaEscribiendo = false;
                    }
                  });
                },
                decoration: InputDecoration.collapsed(
                  hintText: 'Enviar mensaje'
                ),
                focusNode: _focuNode,
              )
            ),

            /* ---Boton de enviar mensaje --- */
            Container(
              margin: EdgeInsets.symmetric(horizontal:  4.0),
              child: Platform.isIOS
              ? CupertinoButton(
                child: Text('Enviar'), 
                onPressed:  _estaEscribiendo
                              ? () => _textoSubmit(_txtController.text.trim())
                              : null,
              )
              : Container(
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                child: IconTheme(
                  data: IconThemeData(color: Colors.blue),
                  child: IconButton(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    icon: Icon(Icons.send),
                    onPressed: _estaEscribiendo
                              ? () => _textoSubmit(_txtController.text.trim())
                              : null, 
                  ),
                )
                
              )
            )

          ],
        ),
      )
    );
  }

  /* ---textoSubmit--- */
  _textoSubmit(String texto) {
    if (texto.length == 0) return; 

    print(texto);
    _txtController.clear();
    _focuNode.requestFocus();

    final nuevoMensaje = new ChatMessage(
      uid: '123', 
      texto: texto, 
      animationController: AnimationController(vsync: this, duration: Duration(milliseconds:400))
    );

    _mensajes.insert(0, nuevoMensaje);
    nuevoMensaje.animationController.forward();

    setState(() {
      _estaEscribiendo = false;
    });
  }

  /* Limpieza al cerrar el chat */
  @override
  void dispose() {
    for (ChatMessage mensaje in _mensajes) {
      mensaje.animationController.dispose();
    }
    super.dispose();
  }
}