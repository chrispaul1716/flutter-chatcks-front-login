import 'package:flutter/material.dart';

import 'package:chatcks/pages/loading_page.dart';
import 'package:chatcks/pages/usuarios_page.dart';
import 'package:chatcks/pages/chat_page.dart';
import 'package:chatcks/pages/login_page.dart';
import 'package:chatcks/pages/registrar_page.dart';

final Map<String, Widget Function(BuildContext)> appRutas = {
  'usuarios'  : (_) => UsuariosPage(),
  'chat'      : (_) => ChatPage(),
  'login'     : (_) => LoginPage(),
  'registrar' : (_) => RegistrarPage(),
  'loading'   : (_) => LoadingPage(),
};