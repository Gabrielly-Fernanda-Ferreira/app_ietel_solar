import 'package:flutter/material.dart';
import 'package:ietel_solar/styles.dart';

class ListaOrdemDeServico extends StatelessWidget {
  const ListaOrdemDeServico({super.key});

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
      body: Center(
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
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
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
                    child: const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Ordem de Serviço 01",
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
                                            "Arthur Henrique",
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
                                            "(17) 99787-5432",
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

                          Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 375,
                                  child: Row(
                                    children: [
                                      Text(
                                        "Endereço: ",
                                        style: listaCampos,
                                      ),
                                      Text(
                                        "SJRP, Vila ****, Rua ****, n 123",
                                        style: lista,
                                        textAlign: TextAlign.justify,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
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
                                            "Nome do técnico: ",
                                            style: listaCampos,
                                          ),
                                          Text(
                                            "Gabrielly",
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
                                            "Motivo da Manutenção: ",
                                            style: listaCampos,
                                          ),
                                          Text(
                                            "Falha na placa",
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


                          Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 375,
                                  child: Row(
                                    children: [
                                      Text(
                                        "Diagnostico: ",
                                        style: listaCampos,
                                      ),
                                      Text(
                                        "Sujeira na placa",
                                        style: lista,
                                        textAlign: TextAlign.justify,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 375,
                                  child: Row(
                                    children: [
                                      Text(
                                        "Solução: ",
                                        style: listaCampos,
                                      ),
                                      Text(
                                        "Limpeza",
                                        style: lista,
                                        textAlign: TextAlign.justify,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 375,
                                  child: Row(
                                    children: [
                                      Text(
                                        "Itens: ",
                                        style: listaCampos,
                                      ),
                                      Text(
                                        "Produto de limpeza, Esponja",
                                        style: lista,
                                        textAlign: TextAlign.justify,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),


                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}