// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'styles.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

var _txtNome = '';
var _txtCpf = '';
var _txtTelefone = '';
var _txtEndereco = '';
var _txtBairro = '';
var _txtNumero = '';
var _txtCep = '';
var _txtCidade = '';
var _datas = ['Presencial', 'Online', 'Híbrido'];
var _txtData = '';
var _horarios = ['1', '2'];
var _txtHorario = '';

class CadastroMan extends StatefulWidget {
  CadastroMan({super.key});

  @override
  CadastraManutencao createState() => CadastraManutencao();
}

class CadastraManutencao extends State<CadastroMan> {
  final _formKey = GlobalKey<FormState>();
  final firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "IETEL Solar",
            style: ietelSolar,
          ),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF082b59),
        body: ListView(children: [
          Center(
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(6),
                        ),
                      ),
                      child: Form(
                          key: _formKey,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Agende a sua ",
                                        style: titulo,
                                      ),
                                      Text(
                                        "Manutenção",
                                        style: palavraChave,
                                      ),
                                      Text(
                                        ":",
                                        style: titulo,
                                      )
                                    ],
                                  ),
                                ),
                                //Nome
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 15, right: 15, top: 20),
                                  child: TextFormField(
                                    onChanged: (String? novoNome) {
                                      setState(() {
                                        _txtNome = novoNome!;
                                      });
                                    },
                                    cursorColor: Color(0xFF082b59),
                                    cursorWidth: 1.5,
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                    decoration: InputDecoration(
                                        hintText: "Nome",
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
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.red,
                                              width: 2,
                                            ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.red,
                                              width: 2,
                                            ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)))),
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (nome) => nome!.isEmpty
                                        ? 'Preencha o campo !'
                                        : null,
                                    keyboardType: TextInputType.text,
                                  ),
                                ),

                                //CPF
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15, top: 15),
                                  child: TextFormField(
                                    onChanged: (String? novoCpf) {
                                      setState(() {
                                        _txtCpf = novoCpf!;
                                      });
                                    },
                                    cursorColor: const Color(0xFF082b59),
                                    cursorWidth: 1.5,
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.black),
                                    decoration: const InputDecoration(
                                        counterText: '',
                                        hintText: "CPF",
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
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.red,
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.red,
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        )),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      CpfInputFormatter(),
                                    ],
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (cpf) => cpf!.isEmpty
                                        ? 'Preencha o campo !'
                                        : null,
                                  ),
                                ),

                                //Telefone
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15, top: 15),
                                  child: TextFormField(
                                    onChanged: (String? novoTelefone) {
                                      setState(() {
                                        _txtTelefone = novoTelefone!;
                                      });
                                    },
                                    cursorColor: const Color(0xFF082b59),
                                    cursorWidth: 1.5,
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.black),
                                    decoration: const InputDecoration(
                                        counterText: '',
                                        hintText: "Telefone",
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
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.red,
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.red,
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        )),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      TelefoneInputFormatter()
                                    ],
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (telefone) => telefone!.isEmpty
                                        ? 'Preencha o campo !'
                                        : null,
                                  ),
                                ),

                                //Endereço
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 15, right: 15, top: 15),
                                  child: TextFormField(
                                    onChanged: (String? novoEndereco) {
                                      setState(() {
                                        _txtEndereco = novoEndereco!;
                                      });
                                    },
                                    cursorColor: Color(0xFF082b59),
                                    cursorWidth: 1.5,
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
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
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.red,
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.red,
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        )),
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (endereco) => endereco!.isEmpty
                                        ? 'Preencha o campo !'
                                        : null,
                                    keyboardType: TextInputType.multiline,
                                  ),
                                ),

                                //Bairro
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 15, right: 15, top: 15),
                                  child: TextFormField(
                                    onChanged: (String? novoBairro) {
                                      setState(() {
                                        _txtBairro = novoBairro!;
                                      });
                                    },
                                    cursorColor: Color(0xFF082b59),
                                    cursorWidth: 1.5,
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                    decoration: InputDecoration(
                                        hintText: "Bairro",
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
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.red,
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.red,
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        )),
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (bairro) => bairro!.isEmpty
                                        ? 'Preencha o campo !'
                                        : null,
                                    keyboardType: TextInputType.text,
                                  ),
                                ),

                                //Número
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 15, right: 15, top: 15),
                                  child: TextFormField(
                                    onChanged: (String? novoNumero) {
                                      setState(() {
                                        _txtNumero = novoNumero!;
                                      });
                                    },
                                    cursorColor: Color(0xFF082b59),
                                    cursorWidth: 1.5,
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                    maxLength: 4,
                                    decoration: InputDecoration(
                                        counterText: '',
                                        hintText: "Número",
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
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.red,
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.red,
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        )),
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (numero) => numero!.isEmpty
                                        ? 'Preencha o campo !'
                                        : null,
                                    keyboardType: TextInputType.text,
                                  ),
                                ),

                                //CEP
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15, top: 15),
                                  child: TextFormField(
                                    onChanged: (String? novoCep) {
                                      setState(() {
                                        _txtCep = novoCep!;
                                      });
                                    },
                                    cursorColor: const Color(0xFF082b59),
                                    cursorWidth: 1.5,
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.black),
                                    decoration: const InputDecoration(
                                        counterText: '',
                                        hintText: "CEP",
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
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.red,
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.red,
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        )),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      CepInputFormatter(),
                                    ],
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (cep) => cep!.isEmpty
                                        ? 'Preencha o campo !'
                                        : null,
                                  ),
                                ),

                                //Cidade
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 15, right: 15, top: 15),
                                  child: TextFormField(
                                    onChanged: (String? novaCidade) {
                                      setState(() {
                                        _txtCidade = novaCidade!;
                                      });
                                    },
                                    cursorColor: Color(0xFF082b59),
                                    cursorWidth: 1.5,
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                    decoration: InputDecoration(
                                        hintText: "Cidade",
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
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.red,
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.red,
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        )),
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (cidade) => cidade!.isEmpty
                                        ? 'Preencha o campo !'
                                        : null,
                                    keyboardType: TextInputType.text,
                                  ),
                                ),

                                //Data
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 15, top: 15),
                                    child:
                                        // StreamBuilder<
                                        //         QuerySnapshot<
                                        //             Map<String, dynamic>>>(
                                        //     stream: firestore
                                        //         .collection('horarioManutencao')
                                        //         .orderBy('data')
                                        //         .snapshots(),
                                        //     builder: (context, snapshot) {
                                        //       var docs = snapshot.data!.docs;

                                        //       return
                                        SizedBox(
                                      height: 48,
                                      child: DropdownButtonFormField(
                                        decoration: const InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xFFF58934),
                                                width: 2),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xFFF58934),
                                                width: 2),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                          ),
                                        ),
                                        dropdownColor: const Color(0xfffdf0e6),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        items: _datas
                                            .map((String dropDownStringItem) {
                                          return DropdownMenuItem(
                                              value: dropDownStringItem,
                                              child: Text(dropDownStringItem));
                                        }).toList(),
                                        onChanged: (String? novaData) {
                                          setState(() {
                                            _txtData = novaData!;
                                          });
                                        },
                                        style: const TextStyle(
                                            fontSize: 14, color: Colors.black),
                                      ),
                                    )),

                                //Horário
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15, top: 15),
                                  child: SizedBox(
                                    height: 48,
                                    child: DropdownButtonFormField(
                                      decoration: const InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFFF58934),
                                              width: 2),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFFF58934),
                                              width: 2),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                      ),
                                      dropdownColor: const Color(0xfffdf0e6),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      items: _horarios
                                          .map((String dropDownStringItem) {
                                        return DropdownMenuItem(
                                            value: dropDownStringItem,
                                            child: Text(dropDownStringItem));
                                      }).toList(),
                                      onChanged: (String? novoHorario) {
                                        setState(() {
                                          _txtHorario = novoHorario!;
                                        });
                                      },
                                      style: const TextStyle(
                                          fontSize: 14, color: Colors.black),
                                    ),
                                  ),
                                ),

                                //Botão
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 30, left: 15, right: 15, bottom: 32),
                                  child: SizedBox(
                                    width: 200,
                                    height: 36,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        overlayColor: MaterialStateProperty
                                            .resolveWith<Color?>(
                                          (Set<MaterialState> states) {
                                            if (states.contains(
                                                MaterialState.hovered)) {
                                              return const Color(0xFF082b59);
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      child: const Text(
                                        "AGENDAR",
                                        style: button,
                                      ),
                                      onPressed: () => _onSaved(context),
                                    ),
                                  ),
                                ),
                              ])))))
        ]));
  }

  void _onSaved(BuildContext context) {
    if (_txtNome.isEmpty ||
        _txtCpf.isEmpty ||
        _txtTelefone.isEmpty ||
        _txtEndereco.isEmpty ||
        _txtBairro.isEmpty ||
        _txtBairro.isEmpty ||
        _txtNumero.isEmpty ||
        _txtCep.isEmpty ||
        _txtCidade.isEmpty ||
        _txtData.isEmpty ||
        _txtHorario.isEmpty) {
      const snackBar = SnackBar(
        content: Text('Preencha todos os campos !'),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      FirebaseFirestore.instance.collection('manutencao').add({
        'nome': _txtNome,
        'cpf': _txtCpf,
        'telefone': _txtTelefone,
        'endereço': _txtEndereco,
        'bairro': _txtBairro,
        'número': _txtNumero,
        'cep': _txtCep,
        'cidade': _txtCidade,
        'dia': _txtData,
        'hora': _txtHorario
      });

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Cadastro realizado com sucesso !'),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ));

      Navigator.pop(context);
    }
  }
}
