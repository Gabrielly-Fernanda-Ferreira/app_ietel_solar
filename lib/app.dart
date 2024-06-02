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
import 'alteraVagas.page.dart';
import 'cadastraCandidatos.page.dart';
import 'listaCandidatos.page.dart';

import 'package:ietel_solar/cadastoOrcamento.page.dart';
import 'package:ietel_solar/agendamentoOrcamento.dart';
import 'package:ietel_solar/listaManutencao.page.dart';
import 'package:ietel_solar/listaOrcamento.page.dart';

import 'package:ietel_solar/os/editarOrdemDeServico.dart';
import 'package:ietel_solar/os/listaOrdemDeServico.dart';
import 'package:ietel_solar/os/ordemDeServico.page.dart';

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
        // "/telaInicial": (context) => TelaInicial(),
        "/contato": (context) => const ContatoPage(),
        "/agendamentoManutencao": (context) => const AgendamentoManutencao(),
        "/cadastraManutencao": (context) => const CadastraManutencaoPage(),
        "/calculadora": (context) => const CalculadoraPage(),
        "/resultado": (context) => const ResultadoPage(),
        "/cadastraVagas": (context) => const CadastraVagasPage(),
        "/listaVagasAdm": (context) => const ListaVagasAdmPage(),
        "/listaVagas": (context) => const ListaVagasPage(),
        "/alteraVagas": (context) => const AlteraVagasPage(),
        "/cadastraCandidatos": (context) => const CadastraCandidatosPage(),
        "/listaCandidatos": (context) => const ListaCandidatosPage(),
        "/cadastraUser": (context) => CadastraUserPage(),
        "/editaUser": (context) => const EditaUserPage(),
        "/funcionamento": (context) => const FuncionamentoPage(),
        "/empresa": (context) => const EmpresaPage(),
        "/listaManutencao": (context) => const ListaManuntencao(),
        "/listaOrcamento": (context) => const ListaOrcamento(),
        "/cadastraOrcamento": (context) => const CadastroOrc(),
        "/ordemDeServico": (context) => const OrdemDeServicoPage(),
        "/listaOS": (context) => const ListaOrdemDeServico(),
        "/editarOS": (context) => const EditarOrdemDeServicoPage(),
        "/agendamentoOrcamento": (context) => const AgendamentoOrcamento()
      },
      
      initialRoute: '/login',
    );
  }
}
