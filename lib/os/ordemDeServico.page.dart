// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';

class NewWorkOrderScreen extends StatefulWidget {
  @override
  _NewWorkOrderScreenState createState() => _NewWorkOrderScreenState();
}

class _NewWorkOrderScreenState extends State<NewWorkOrderScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova Ordem de Serviço'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: TextFormField(
                  cursorColor: Color(0xFF082b59),
                  cursorWidth: 1.5,
                  style: TextStyle(fontSize: 14, color: Colors.black),
                  decoration: InputDecoration(
                    hintText: "Codigo",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF082b59),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFF58934),
                        width: 2,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 20),
                child: TextFormField(
                  cursorColor: Color(0xFF082b59),
                  cursorWidth: 1.5,
                  style: TextStyle(fontSize: 14, color: Colors.black),
                  decoration: InputDecoration(
                    hintText: "Cliente",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF082b59),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFF58934),
                        width: 2,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 20),
                child: TextFormField(
                  cursorColor: Color(0xFF082b59),
                  cursorWidth: 1.5,
                  style: TextStyle(fontSize: 14, color: Colors.black),
                  decoration: InputDecoration(
                    hintText: "Data",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF082b59),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFF58934),
                        width: 2,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.datetime,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 20),
                child: TextFormField(
                  cursorColor:Color(0xFF082b59),
                  cursorWidth: 1.5,
                  style: TextStyle(fontSize: 14, color: Colors.black),
                  decoration: InputDecoration(
                    hintText: "Endereço",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF082b59),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFF58934),
                        width: 2,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 20),
                child: TextFormField(
                  cursorColor: Color(0xFF082b59),
                  cursorWidth: 1.5,
                  style: TextStyle(fontSize: 14, color: Colors.black),
                  decoration: InputDecoration(
                    hintText: "Tecnico",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF082b59),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFF58934),
                        width: 2,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 20),
                child: TextFormField(
                  cursorColor: Color(0xFF082b59),
                  cursorWidth: 1.5,
                  style: TextStyle(fontSize: 14, color: Colors.black),
                  decoration: InputDecoration(
                    hintText: "Motivo da Manutenção",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF082b59),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFF58934),
                        width: 2,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 20),
                child: TextFormField(
                  cursorColor: Color(0xFF082b59),
                  cursorWidth: 1.5,
                  style: TextStyle(fontSize: 14, color: Colors.black),
                  decoration: InputDecoration(
                    hintText: "Diagnostico",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF082b59),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFF58934),
                        width: 2,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 20),
                child: TextFormField(
                  cursorColor: Color(0xFF082b59),
                  cursorWidth: 1.5,
                  style: TextStyle(fontSize: 14, color: Colors.black),
                  decoration: InputDecoration(
                    hintText: "Solução",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF082b59),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFF58934),
                        width: 2,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 20),
                child: TextFormField(
                  cursorColor: Color(0xFF082b59),
                  cursorWidth: 1.5,
                  style: TextStyle(fontSize: 14, color: Colors.black),
                  decoration: InputDecoration(
                    hintText: "Itens",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF082b59),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFF58934),
                        width: 2,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  onPressed: null,
                  child: Text('Salvar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}