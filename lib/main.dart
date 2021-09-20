// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alert Dialog', //es el nombre de la app
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Suscripción con Alert Dialog'), //titulo de la appBar
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {  
  bool _subs = false; // el guion bajo indica que será una variable local, solo se puede usar dentro de la clase

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(        
        title: Text(widget.title),
      ),

      body: Center(        
        child: Column(          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[ 
            const Text("Presione el botón para Suscribirse :D"),   
            const SizedBox(height: 20),         
            ElevatedButton(   
              style: ElevatedButton.styleFrom(
                primary: _subs ? Colors.grey : Colors.red[600] //background - fondo del botón
                //onPrimary: Colors.green //foreground - color de letras del botón
                                          // PD. aunque no se ponga, predeterminadamente lo deja en blanco
              ),
              child: Text( _subs ? "Suscrito" : "Suscribirme"),
              onPressed: (){
                print("jeloiu");
                _mostrarAlerta(context);
              }, 
            ),

            const SizedBox(height: 100),
            
            Text( 
              _subs  ? "Suscrito a este canal" : "No estás Suscrito",
              style: const TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  } //widget Build

  void _mostrarAlerta(BuildContext context){
    showDialog(
      barrierDismissible: false,
      context: context, 
      builder: (context)=> AlertDialog(
          title: Text(_subs ? "Anular suscripción" : "Nueva Suscripción"),
          content: Text( _subs ? "¿Desea Anular la suscripción?" : "¿Desea Suscribirse a este canal?"),
          actions: [
            TextButton(
              onPressed: (){
                print("Nou");
                Navigator.pop(context);  
                print(_subs);
              },
              child: const Text("Cancelar")
            ),

            TextButton(
              onPressed: (){
                print("Siu");
                Navigator.pop(context); 
                setState((){
                  _subs = !_subs; // ! lo contrario a (negación)
                });                
                print(_subs);
              },
              child: Text(_subs ? "Anular suscripcion": "Aceptar")
            ),
          ] //actions
        )
    ); //show dialog
  } //void _mostrarAlerta 
} //class _MyHomePageState