import 'dart:math';
import 'package:flutter/material.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:chatcks/models/usuario_model.dart';


class UsuariosPage extends StatefulWidget {

  @override
  _UsuariosPageState createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {

  RefreshController _refreshController = RefreshController(initialRefresh: false);

  final usuarios = [
    Usuario(uid: '1', nombre: 'María', email: 'test1@test.com', online: true),
    Usuario(uid: '2', nombre: 'José', email: 'test2@test.com', online: true),
    Usuario(uid: '3', nombre: 'Xavier', email: 'test3@test.com', online: false),
    Usuario(uid: '4', nombre: 'Nancy', email: 'test4@test.com', online: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: Text('Mi nombre', style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        elevation: 2,
        leading: Transform.rotate(
          angle: pi,
          child: IconButton(
            icon: Icon(Icons.exit_to_app),
            color: Colors.black,
            onPressed: (){

            },
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.check_circle),
            color: Colors.green,
            tooltip: 'Open shopping cart',
            onPressed: () {
              // handle the press
            },
          ),

          /* IconButton(
            icon: Icon(Icons.offline_bolt),
            color: Colors.red,
            tooltip: 'Open shopping cart',
            onPressed: () {
              // handle the press
            },
          ), */
        ],
      ),

      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        header: WaterDropHeader(
          complete: Icon(Icons.check, color: Colors.green),
          waterDropColor: Colors.blue,
        ),
        onRefresh: _cargarUsuarios,  /* ---Efecto--- */
        child: _listViewUsuarios(),  /* ---Lista de usuarios--- */
      ),
      
    );
  }

  /* ---Lista de usuarios--- */
  ListView _listViewUsuarios() {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemCount: usuarios.length,
      itemBuilder: (_, i) => _usuarioListTile(usuarios[i]), /* ---Detalle usuario--- */
      separatorBuilder: (_, i) => Divider(),
    );
  }

  /* ---Detalle usuario--- */
  ListTile _usuarioListTile(Usuario usuario) {
    return ListTile(
        title: Text(usuario.nombre),
        subtitle: Text(usuario.email),
        leading: CircleAvatar(
          child: Text(usuario.nombre.substring(0,2)),
        ),
        trailing: Container(
          width: 10.0,
          height: 10.00,
          decoration: BoxDecoration(
            color: usuario.online ? Colors.green : Colors.red,
            borderRadius: BorderRadius.circular(100.0)
          ),
        ),
      );
  }

  /* ---Efecto--- */
  _cargarUsuarios() async {

    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();

  }
}