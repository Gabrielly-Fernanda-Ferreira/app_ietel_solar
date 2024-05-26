// ignore_for_file: curly_braces_in_flow_control_structures, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'dart:convert';

import 'styles.dart';
import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

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

import 'package:ietel_solar/os/editarOrdemDeServico.dart';
import 'package:ietel_solar/os/listaOrdemDeServico.dart';
import 'package:ietel_solar/os/ordemDeServico.page.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  void _logout(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/login');
  }

  double? latitude;
  double? longitude;
  var cidade = '';
  var apiKey = 'a9f81072d5b1976feb2871ec7f6a024b&';
  var nascer_sol;
  var por_sol;
  var temperatura;
  var umidade;

  
  Future<Position> _pegarClima() async {
    bool serviceEnabled;
    LocationPermission permission;
    var position;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error("Serviço desabilitado !");
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Acesso a localização negado !");
      }
    } else {
      var position = await Geolocator.getCurrentPosition();

      var response = await http.get(Uri.parse(
          'https://nominatim.openstreetmap.org/reverse?lat=${position.latitude}&lon=${position.longitude}&format=json'));

      cidade = jsonDecode(response.body)['address']['town'];

      var url = await http.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=${cidade}&appid=${apiKey}&units=metric'));

      nascer_sol =
          getClockInUtcPlus3Hours(jsonDecode(url.body)['sys']['sunrise'] as int);
      por_sol =
          getClockInUtcPlus3Hours(jsonDecode(url.body)['sys']['sunset'] as int);
      temperatura = jsonDecode(url.body)['main']['temp'];
      umidade = jsonDecode(url.body)['main']['humidity'];

      setState(() {});
    }

    return position;
  }

  String getClockInUtcPlus3Hours(int timeSinceEpochInSec) {
    final time = DateTime.fromMillisecondsSinceEpoch(timeSinceEpochInSec * 1000,
            isUtc: true)
        .add(const Duration(hours: 3));
    return '${(time.hour - 6)}:${time.minute}';
  }


  final _nivel = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: const Color(0xFF082b59),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF082b59),
                  borderRadius: BorderRadius.all(
                    Radius.circular(6),
                  ),
                ),

                //Previsão do Tempo
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(6),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: IconButton(
                                  icon: Icon(Icons.location_on,
                                      color: Color(0xFFF58934)),
                                  iconSize: 20,
                                  onPressed: () => _pegarClima(),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                cidade,
                                style: clima,
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.wb_sunny,
                                color: Color(0xFFF58934),
                                size: 20,
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (nascer_sol == null || por_sol == null) ...[
                                Text(
                                  '',
                                  style: clima,
                                )
                              ] else ...[
                                Text(
                                  '${nascer_sol} - ${por_sol}',
                                  style: clima,
                                )
                              ]
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.thermostat,
                                color: Color(0xFFF58934),
                                size: 20,
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (temperatura == null) ...[
                                Text(
                                  '',
                                  style: clima,
                                )
                              ] else ...[
                                Text(
                                  '${temperatura.round()}°C',
                                  style: clima,
                                )
                              ]
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.water_drop,
                                color: Color(0xFFF58934),
                                size: 20,
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (umidade == null) ...[
                                Padding(
                                  padding: EdgeInsets.only(right: 15),
                                  child: Text(
                                    '',
                                    style: clima,
                                  ),
                                ),
                              ] else ...[
                                Padding(
                                  padding: EdgeInsets.only(right: 15),
                                  child: Text(
                                    '${umidade}%',
                                    style: clima,
                                  ),
                                ),
                              ]
                            ],
                          )
                        ],
                      ),
                    ),

                    //Vídeo
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        height: 215,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(6),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('images/placa_solar.gif', height: 195)
                          ],
                        ),
                      ),
                    ),

                    //Cards
                    Container(
                      color: const Color(0xFF082b59),
                      height: 290,
                      width: 300,
                      alignment: Alignment.center,
                      child: const Padding(
                        padding: EdgeInsets.only(
                          top: 10,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image(
                                    image: ResizeImage(
                                        AssetImage('images/imagem_card_1.png'),
                                        width: 120,
                                        height: 90)),
                                Padding(
                                  padding: EdgeInsets.only(left: 20, right: 20),
                                  child: Text(
                                    "+",
                                    style: card,
                                  ),
                                ),
                                Text(
                                  "ECONÔMICA",
                                  style: card,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Image(
                                    image: ResizeImage(
                                        AssetImage('images/imagem_card_2.png'),
                                        width: 120,
                                        height: 90)),
                                Padding(
                                  padding: EdgeInsets.only(left: 20, right: 20),
                                  child: Text(
                                    "+",
                                    style: card,
                                  ),
                                ),
                                Text(
                                  "SEGURA",
                                  style: card,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Image(
                                    image: ResizeImage(
                                        AssetImage('images/imagem_card_3.png'),
                                        width: 120,
                                        height: 90)),
                                Padding(
                                  padding: EdgeInsets.only(left: 20, right: 20),
                                  child: Text(
                                    "+",
                                    style: card,
                                  ),
                                ),
                                Text(
                                  "SUSTENTÁVEL",
                                  style: card,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          //Título
          appBar: AppBar(
            title: const Text(
              "IETEL Solar",
              style: ietelSolar,
            ),
            iconTheme: const IconThemeData(color: Colors.white),
          ),

          //Menu
          drawer: Drawer(
            backgroundColor: Colors.white,
            child: ListView(
              children: <Widget>[
                const UserAccountsDrawerHeader(
                  accountName: Text(
                    "Gabrielly Fernanda Ferreira",
                    style: menuNome,
                  ),
                  accountEmail: Text(
                    "teste123@gmail.com",
                    style: menuEmail,
                  ),
                  decoration: BoxDecoration(color: Color(0xFF082b59)),
                  currentAccountPicture: CircleAvatar(
                      backgroundImage: AssetImage("images/logo_ietel.png")),
                ),

                //Acesso de Usuário
                if (_nivel == 0) ...[
                  //Funcionamento
                  ListTile(
                    leading: const Icon(Icons.sunny, color: Color(0xFFF58934)),
                    title: const Text("Funcionamento", style: menu),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const FuncionamentoPage()));
                    },
                  ),

                  //Calculadora Solar
                  ListTile(
                    leading:
                        const Icon(Icons.calculate, color: Color(0xFFF58934)),
                    title: const Text("Calculadora Solar", style: menu),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const CalculadoraPage()));
                    },
                  ),

                  //Orçamento
                  ListTile(
                    leading: const Icon(Icons.book, color: Color(0xFFF58934)),
                    title: const Text("Orçamento", style: menu),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const CadastroOrc()));
                    },
                  ),

                  //Manutenção
                  ListTile(
                    leading: const Icon(Icons.build_rounded,
                        color: Color(0xFFF58934)),
                    title: const Text("Manutenção", style: menu),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const CadastraManutencaoPage()));
                    },
                  ),

                  //Trabalhe Conosco
                  ListTile(
                    leading: const Icon(Icons.work, color: Color(0xFFF58934)),
                    title: const Text("Trabalhe Conosco", style: menu),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ListaVagasPage()));
                    },
                  ),

                  //Contatos
                  ListTile(
                    leading: const Icon(Icons.phone, color: Color(0xFFF58934)),
                    title: const Text("Contatos", style: menu),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const ContatoPage()));
                    },
                  ),

                  //Sobre Nós
                  ListTile(
                    leading: const Icon(Icons.store_mall_directory,
                        color: Color(0xFFF58934)),
                    title: const Text("Sobre Nós", style: menu),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const EmpresaPage()));
                    },
                  ),

                  //Configurações
                  ListTile(
                    leading:
                        const Icon(Icons.settings, color: Color(0xFFF58934)),
                    title: const Text("Configurações", style: menu),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const EditaUserPage()));
                    },
                  ),

                  //Botão
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 30, right: 120, left: 20),
                    child: ElevatedButton.icon(
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
                      onPressed: () => _logout(context),
                      icon: const Icon(
                        Icons.exit_to_app,
                        color: Colors.white,
                      ),
                      label: const Text(
                        "SAIR",
                        style: button,
                      ),
                    ),
                  )
                ]

                //Acesso de Administrador
                else ...[
                  //Funcionamento
                  ListTile(
                    leading: const Icon(Icons.sunny, color: Color(0xFFF58934)),
                    title: const Text("Funcionamento", style: menu),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const FuncionamentoPage()));
                    },
                  ),

                  //Calculadora Solar
                  ListTile(
                    leading:
                        const Icon(Icons.calculate, color: Color(0xFFF58934)),
                    title: const Text("Calculadora Solar", style: menu),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const CalculadoraPage()));
                    },
                  ),

                  //Agenda Horário Orçamento
                  ListTile(
                    leading: const Icon(Icons.perm_contact_calendar,
                        color: Color(0xFFF58934)),
                    title: const Text("Agenda Horário Orçamento", style: menu),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const AgendamentoOrcamento()));
                    },
                  ),

                  //Lista de Orçamentos
                  ListTile(
                    leading: const Icon(Icons.book, color: Color(0xFFF58934)),
                    title: const Text("Lista de Orçamentos", style: menu),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const ListaOrcamento()));
                    },
                  ),

                  //Agenda Horário Manutenção
                  ListTile(
                    leading: const Icon(Icons.perm_contact_calendar,
                        color: Color(0xFFF58934)),
                    title: const Text("Agenda Horário Manutenção", style: menu),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const AgendamentoManutencao()));
                    },
                  ),

                  //Lista de Manutenções
                  ListTile(
                    leading: const Icon(Icons.build_rounded,
                        color: Color(0xFFF58934)),
                    title: const Text("Lista de Manutenções", style: menu),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const ListaManuntencao()));
                    },
                  ),

                  //Lista de Vagas
                  ListTile(
                    leading: const Icon(Icons.work, color: Color(0xFFF58934)),
                    title: const Text("Lista de Vagas", style: menu),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ListaVagasAdmPage()));
                    },
                  ),

                  //Configurações
                  ListTile(
                    leading:
                        const Icon(Icons.settings, color: Color(0xFFF58934)),
                    title: const Text("Configurações", style: menu),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const EditaUserPage()));
                    },
                  ),

                  //Botão
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 30, right: 120, left: 20),
                    child: ElevatedButton.icon(
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
                      onPressed: () => _logout(context),
                      icon: const Icon(
                        Icons.exit_to_app,
                        color: Colors.white,
                      ),
                      label: const Text(
                        "SAIR",
                        style: button,
                      ),
                    ),
                  )
                ]
              ],
            ),
          ),
        );
      }),
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
        "/login": (context) => const LoginPage(),
        "/contato": (context) => const ContatoPage(),
        "/agendamentoManutencao": (context) => const AgendamentoManutencao(),
        "/cadastraManutencao": (context) => const CadastraManutencaoPage(),
        "/calculadora": (context) => const CalculadoraPage(),
        "/resultado": (context) => const ResultadoPage(),
        "/cadastraVagas": (context) => const CadastraVagasPage(),
        "/listaVagasAdm": (context) => ListaVagasAdmPage(),
        "/listaVagas": (context) => ListaVagasPage(),
        "/cadastraUser": (context) => const CadastraUserPage(),
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
