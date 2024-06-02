import 'package:flutter/material.dart';
import 'package:ietel_solar/styles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditarOrdemDeServicoPage extends StatefulWidget {
  final String id; // Add this to receive the id of the job to edit

  const EditarOrdemDeServicoPage({super.key, required this.id});

  @override
  State<EditarOrdemDeServicoPage> createState() => _EditarOrdemDeServicoState();
}

class _EditarOrdemDeServicoState extends State<EditarOrdemDeServicoPage> {
  final firestore = FirebaseFirestore.instance;
  final _formKey = GlobalKey<FormState>();

  String _cliente = '';
  String _telefone = '';
  String _endereco = '';
  String _nomeDoTecnico = '';
  String _motivoDaManutencao = '';
  String _diagnostico = '';
  String _solucao = '';
  String _itens = '';

  void _onSaved(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      firestore.collection('ordensDeServico').doc(widget.id).update({
        'cliente': _cliente,
        'telefone': _telefone,
        'endereco': _endereco,
        'nomeDoTecnico': _nomeDoTecnico,
        'motivoDaManutencao': _motivoDaManutencao,
        'diagnostico': _diagnostico,
        'solucao': _solucao,
        'itens': _itens,
      }).then((value) => Navigator.pop(context));
    }
  }

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
      body: StreamBuilder<DocumentSnapshot>(
        stream: firestore.collection('ordensDeServico').doc(widget.id).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (!snapshot.hasData) return const CircularProgressIndicator();
          DocumentSnapshot document = snapshot.data!;
          _cliente = document['cliente'];
          _telefone = document['telefone'];
          _endereco = document['endereco'];
          _nomeDoTecnico = document['nomeDoTecnico'];
          _motivoDaManutencao = document['motivoDaManutencao'];
          _diagnostico = document['diagnostico'];
          _solucao = document['solucao'];
          _itens = document['itens'];

          return Form(
            key: _formKey,
            child: ListView(
              children: [
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
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Altere a ",
                                  style: titulo,
                                ),
                                Text(
                                  "Ordem de Serviço",
                                  style: palavraChave,
                                ),
                                Text(
                                  ":",
                                  style: titulo,
                                ),
                              ],
                            ),
                          ),

                          //Cargo
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
                            child: TextFormField(
                              initialValue: _cliente,
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
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Campo obrigatório';
                                }
                                return null;
                              },
                              onSaved: (value) => _cliente = value!,
                              keyboardType: TextInputType.text,
                            ),
                          ),

                          //Local
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                            child: TextFormField(
                              initialValue: _telefone,
                              cursorColor: Color(0xFF082b59),
                              cursorWidth: 1.5,
                              style: TextStyle(fontSize: 14, color: Colors.black),
                              decoration: InputDecoration(
                                hintText: "CPF OU CNPJ",
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
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Campo obrigatório';
                                }
                                return null;
                              },
                              onSaved: (value) => _telefone = value!,
                              keyboardType: TextInputType.text,
                            ),
                          ),

                          //Modelo
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                            child: TextFormField(
                              initialValue: _endereco,
                              cursorColor: Color(0xFF082b59),
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
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Campo obrigatório';
                                }
                                return null;
                              },
                              onSaved: (value) => _endereco = value!,
                              keyboardType: TextInputType.text,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                            child: TextFormField(
                              initialValue: _nomeDoTecnico,
                              cursorColor: Color(0xFF082b59),
                              cursorWidth: 1.5,
                              style: TextStyle(fontSize: 14, color: Colors.black),
                              decoration: InputDecoration(
                                hintText: "Nome do Técnico",
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
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Campo obrigatório';
                                }
                                return null;
                              },
                              onSaved: (value) => _nomeDoTecnico = value!,
                              keyboardType: TextInputType.text,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                            child: TextFormField(
                              initialValue: _motivoDaManutencao,
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
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Campo obrigatório';
                                }
                                return null;
                              },
                              onSaved: (value) => _motivoDaManutencao = value!,
                              keyboardType: TextInputType.text,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                            child: TextFormField(
                              initialValue: _diagnostico,
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
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Campo obrigatório';
                                }
                                return null;
                              },
                              onSaved: (value) => _diagnostico = value!,
                              keyboardType: TextInputType.text,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                            child: TextFormField(
                              initialValue: _solucao,
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
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Campo obrigatório';
                                }
                                return null;
                              },
                              onSaved: (value) => _solucao = value!,
                              keyboardType: TextInputType.text,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                            child: TextFormField(
                              initialValue: _itens,
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
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Campo obrigatório';
                                }
                                return null;
                              },
                              onSaved: (value) => _itens = value!,
                              keyboardType: TextInputType.text,
                            ),
                          ),

                          //Botão
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
                            child: SizedBox(
                              width: 200,
                              height: 36,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  overlayColor: MaterialStateProperty.resolveWith<Color?>(
                                    (Set<MaterialState> states) {
                                      if (states.contains(MaterialState.hovered))
                                        return const Color(0xFF082b59);
                                      return null;
                                    },
                                  ),
                                ),
                                child: const Text(
                                  "ALTERAR",
                                  style: button,
                                ),
                                onPressed: () => _onSaved(context),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}