// ignore_for_file: curly_braces_in_flow_control_structures

import 'styles.dart';
import 'package:flutter/material.dart';

import 'login.page.dart';
import 'contato.page.dart';

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

class App extends StatelessWidget {
  const App({super.key});
  
  void _logout(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/login');
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
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Icon(
                                  Icons.location_on,
                                  color: Color(0xFFF58934),
                                  size: 20,
                                ),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Potirendaba - SP",
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
                              Text(
                                "06:25h - 18:09h",
                                style: clima,
                              )
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
                              Text(
                                "35°C",
                                style: clima,
                              )
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
                              Padding(
                                padding: EdgeInsets.only(right: 15),
                                child: Text(
                                  "17%",
                                  style: clima,
                                ),
                              )
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
                                const ListaVagasPage()));
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
                                const ListaVagasPage()));
                  },
                ),

                //Manutenção
                ListTile(
                  leading:
                      const Icon(Icons.build_rounded, color: Color(0xFFF58934)),
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
                                const ListaVagasPage()));
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
                                const ListaVagasPage()));
                  },
                ),

                //Configurações
                ListTile(
                  leading: const Icon(Icons.settings, color: Color(0xFFF58934)),
                  title: const Text("Configurações", style: menu),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const ListaVagasPage()));
                  },
                ),

                //Botão
                Padding(
                  padding: const EdgeInsets.only(top: 30, right: 120, left: 20),
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
                              const ListaVagasPage()));
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

              //Agenda Orçamentos
              ListTile(
                leading: const Icon(Icons.perm_contact_calendar, color: Color(0xFFF58934)),
                title: const Text("Agenda Orçamentos", style: menu),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const AgendamentoManutencao()));
                },
              ),

              //Lista de Orçamentos
              ListTile(
                leading:
                    const Icon(Icons.book, color: Color(0xFFF58934)),
                title: const Text("Lista de Orçamentos", style: menu),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const ListaVagasPage()));
                },
              ),

              //Agenda Manutenções
              ListTile(
                leading: const Icon(Icons.perm_contact_calendar, color: Color(0xFFF58934)),
                title: const Text("Agenda Manutenções", style: menu),
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
                leading: const Icon(Icons.build_rounded, color: Color(0xFFF58934)),
                title: const Text("Lista de Manutenções", style: menu),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const ContatoPage()));
                },
              ),

              //Lista de Vagas
              ListTile(
                leading: const Icon(Icons.work,
                    color: Color(0xFFF58934)),
                title: const Text("Lista de Vagas", style: menu),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const ListaVagasAdmPage()));
                },
              ),

              //Configurações
              ListTile(
                leading: const Icon(Icons.settings, color: Color(0xFFF58934)),
                title: const Text("Configurações", style: menu),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const ListaVagasPage()));
                },
              ),

              //Botão
              Padding(
                padding: const EdgeInsets.only(top: 30, right: 120, left: 20),
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
        "/listaVagasAdm": (context) => const ListaVagasAdmPage(),
        "/listaVagas": (context) => const ListaVagasPage(),
        "/alteraVagas": (context) => const AlteraVagasPage(),
        "/cadastraCandidatos": (context) => const CadastraCandidatosPage(),
        "/listaCandidatos": (context) => const ListaCandidatosPage(),
      },
      initialRoute: '/login',
    );
  }
}
