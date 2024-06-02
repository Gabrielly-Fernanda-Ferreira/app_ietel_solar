// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ietel_solar/styles.dart';

class ListaOrdemDeServico extends StatelessWidget {
  ListaOrdemDeServico({super.key});

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
      body: StreamBuilder<QuerySnapshot>(
        stream: firestore.collection('ordensDeServico').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return const CircularProgressIndicator();
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
              return Center(
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
                                "Lista de ",
                                style: titulo,
                              ),
                              Text(
                                "Ordens de Serviço",
                                style: palavraChave,
                              ),
                              Text(
                                ":",
                                style: titulo,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 15, right: 15, top: 20),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: const Color(0xFFF58934),
                                width: 1.0,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(6),
                              ),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Ordem de Serviço ${data['id']}",
                                      style: listaTitulo,
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 15),
                                  child: Row(
                                    children: [
                                      Flexible(
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Cliente: ",
                                                  style: listaCampos,
                                                ),
                                                Text(
                                                  data['cliente'],
                                                  style: lista,
                                                  textAlign: TextAlign.justify,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Flexible(
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Telefone: ",
                                                  style: listaCampos,
                                                ),
                                                Text(
                                                  data['telefone'],
                                                  style: lista,
                                                  textAlign: TextAlign.justify,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // ... Add other fields similarly
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}