
import 'package:flutter/material.dart';

import 'login.page.dart';
import 'cadastraUser.page.dart';
import 'editaUser.page.dart';

import 'contato.page.dart';
import 'funcionamento.page.dart';
import 'empresa.page.dart';

import 'agendamentoManutencao.dart';
import 'cadastraManutencao.page.dart';

import 'resultado.page.dart';
import 'calculadora.page.dart';

import 'cadastraVagas.page.dart';
import 'listaVagasAdm.page.dart';
import 'listaVagas.page.dart';

import 'cadastraOrcamento.page.dart';
import 'agendamentoOrcamento.dart';
import 'listaManutencao.page.dart';
import 'listaOrcamento.page.dart';
import 'package:ietel_solar/os/listaOrdemDeServico.dart';

class App extends StatelessWidget {
  App({super.key});

  @override
  Widget build(BuildContext context){

  return MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        useMaterial3: false,
        primarySwatch: MaterialColor(
          0xFFF58934,
          {
            50: Colors.orange[50]!,
            100: Colors.orange[100]!,
            200: Colors.orange[200]!,
            300: Colors.orange[300]!,
            500: Colors.orange[500]!,
            600: Colors.orange[600]!,
            700: Colors.orange[700]!,
            800: Colors.orange[800]!,
            900: Colors.orange[900]!,
          },
        ),
    ),



      routes: {
        "/login": (context) => LoginPage(),
        "/contato": (context) => const ContatoPage(),
        "/agendamentoManutencao": (context) => const AgendamentoManutencao(),
        "/cadastraManutencao": (context) => CadastraManutencao(),
        "/calculadora": (context) => const CalculadoraPage(),
        "/resultado": (context) => const ResultadoPage(),
        "/cadastraVagas": (context) => const CadastraVagasPage(),
        "/listaVagasAdm": (context) => ListaVagasAdmPage(),
        "/listaVagas": (context) => ListaVagasPage(),
        "/cadastraUser": (context) => const CadastraUserPage(),
        "/editaUser": (context) => const EditaUserPage(),
        "/funcionamento": (context) => const FuncionamentoPage(),
        "/empresa": (context) => const EmpresaPage(),
        "/listaManutencao": (context) => ListaManuntencao(),
        "/listaOrcamento": (context) => const ListaOrcamento(),
        "/cadastraOrcamento": (context) => const CadastroOrc(),
        "/listaOS": (context) => ListaOrdemDeServico(),
        "/agendamentoOrcamento": (context) => const AgendamentoOrcamento()
      },
      initialRoute: '/login',
    );
  }
}
