import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'styles.dart';

class ListaManuntencao extends StatelessWidget {
  ListaManuntencao({super.key});

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
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          height: MediaQuery.of(context).size.height,
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
                      "Manutenções",
                      style: palavraChave,
                    ),
                    Text(
                      ":",
                      style: titulo,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                      stream: firestore.collection('manutencao').snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const CircularProgressIndicator();
                        }

                        var docs = snapshot.data!.docs;

                        return SizedBox(
                          height: 500,
                          child: ListView(children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: docs
                                  .map(
                                    (doc) => Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 15, top: 20),
                                      child: InkWell(
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.9,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                              color: const Color(0xFFF58934),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(6),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(15.0),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 10),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        doc['nome'],
                                                        style: listaTitulo,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 10),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'CPF: ' + doc['cpf'],
                                                        style: lista,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 10),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'Telefone: ' +
                                                            doc['telefone'],
                                                        style: lista,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 10),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'Bairro: ' +
                                                            doc['bairro'],
                                                        style: lista,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 10),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'Número: ' +
                                                            doc['número'],
                                                        style: lista,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 10),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'CEP: ' + doc['cep'],
                                                        style: lista,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 10),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'Cidade: ' +
                                                            doc['cidade'],
                                                        style: lista,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 10),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'Data: ' + doc['dia'],
                                                        style: lista,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 10),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'Horário: ' +
                                                            doc['hora'],
                                                        style: lista,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ]),
                        );
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
