import 'package:flutter/material.dart';
import 'package:ietel_solar/cadastoOrcamento.page.dart';
import 'package:ietel_solar/listaManutencao.page.dart';
import 'package:ietel_solar/listaOrcamento.page.dart';
import 'resultado.page.dart';
import 'calculadora.page.dart';
import 'cadastraManutencao.page.dart';
import 'agendamentoManutencao.dart';
import 'login.page.dart';
import 'contato.page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
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
        "/calculadora": (context) => const CalculadoraPage(),
        "/resultado": (context) => const ResultadoPage(),
        "/cadastraManutencao": (context) => CadastroMan(),
        "/agendamentoManutencao": (context) => const AgendamentoManu(),
        "/login": (context) => const LoginPage(),
        "/contato": (context) => const ContatoPage(),
        "/cadastroOrcamento": (context) => CadastroOrc(),
        "/listaOrcamento": (context) => ListaOrcamento(),
        "/listaManutencao": (context) => ListaManuntencao()
      },
      initialRoute: '/listaManutencao',
    );
  }
}
