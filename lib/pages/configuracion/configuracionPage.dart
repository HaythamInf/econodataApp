import 'package:flutter/material.dart';

class ConfiguracionPage extends StatefulWidget {
  ConfiguracionPage({Key? key}) : super(key: key);

  @override
  State<ConfiguracionPage> createState() => _ConfiguracionPageState();
}

class _ConfiguracionPageState extends State<ConfiguracionPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: 
      ListView(children: [
        Container(
          child: Text('Configuracion'),
        )
      ],)
    );
  }
}