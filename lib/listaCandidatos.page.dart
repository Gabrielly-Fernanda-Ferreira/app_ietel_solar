import 'package:flutter/material.dart';
import 'styles.dart';

class ListaCandidatosPage extends StatelessWidget {
  const ListaCandidatosPage({super.key});

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
      body: ListView(
        children:[ 
          Padding(
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
                        "Candidatos",
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
                                "Gabrielly Fernanda Ferreira",
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
                                            "CPF: ",
                                            style: listaCampos,
                                          ),
                                          Text(
                                            "239087654/98",
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
                                Flexible(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Cidade: ",
                                            style: listaCampos,
                                          ),
                                          Text(
                                            "Potirendaba",
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
                                            "Currículo: ",
                                            style: listaCampos,
                                          ),
                                          Text(
                                            "curriculo.png",
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
                                        "LinkedIn: ",
                                        style: listaCampos,
                                      ),
                                      Text(
                                        "linkedIn@email.com",
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
                                        "E-mail: ",
                                        style: listaCampos,
                                      ),
                                      Text(
                                        "teste@email.com",
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
                                        "Mensagem: ",
                                        style: listaCampos,
                                      ),
                                      Text(
                                        "teste 1, 2, 3... ",
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
        ],
      ),
    );
  }
}
