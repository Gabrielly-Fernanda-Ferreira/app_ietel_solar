import 'package:flutter/material.dart';
import 'package:ietel_solar/cadastraCandidatos.page.dart';
import 'styles.dart';

class ListaVagasPage extends StatelessWidget {
  const ListaVagasPage({super.key});

  void _telaCadastraCandidatos(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const CadastraCandidatosPage()));
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
                  padding: EdgeInsets.only(
                    top: 30
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Lista de ",
                        style: titulo,
                      ),
                      Text(
                        "Vagas",
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
                 padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 20
                 ),
                 child: InkWell(
                  onTap: () => _telaCadastraCandidatos(context),
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
                          Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Desenvolvedor Web",
                                  style: listaTitulo,
                                )
                              ],
                             ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                Text(
                                  "Estágio - Presencial",
                                  style: lista,
                                )
                              ],
                             ),
                          ), 
                          Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                Text(
                                  "Potirendaba - SP",
                                  style: listaSubtitulo,
                                )
                              ],
                             ),
                          ), 
                          Row(
                            children: [
                              Icon(Icons.arrow_right, color: Color(0xFF082b59)),
                              Text(
                                "Descrição:",
                                style: listaDescricao,
                              ),
                            ],
                           ),
                            Padding(
                             padding: EdgeInsets.only(top: 10, left: 20),
                             child: Row(
                              children: [
                                SizedBox(
                                  width: 375,
                                  child: Text(
                                    "Requisitos: Capacidade de organização, proatividade, resolução de problemas... ",
                                    style: lista,
                                    textAlign: TextAlign.justify,
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
