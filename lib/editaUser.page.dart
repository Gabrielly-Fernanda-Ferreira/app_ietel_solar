import 'package:flutter/material.dart';
import 'styles.dart';

class EditaUserPage extends StatelessWidget {
  const EditaUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "IETEL SOLAR",
          style: ietelSolar,
        ),
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text.rich(
                  TextSpan(
                    children: <TextSpan>[
                      TextSpan(text: 'Editar', style: titulo),
                      TextSpan(text: ' USUÁRIO', style: palavraChave)
                    ],
                  ),
                ),

                //Nome
                const Padding(
                  padding: EdgeInsets.only(
                    left: 15,
                    right: 15,
                    top: 15,
                  ),
                  child: TextField(
                    cursorColor: Color(0xFF082b59),
                    cursorWidth: 1.5,
                    style: TextStyle(fontSize: 14, color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Digite o seu Nome",
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF082b59),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFF58934),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.name,
                  ),
                ),

                //Email
                const Padding(
                  padding: EdgeInsets.only(
                    left: 15,
                    right: 15,
                    top: 30,
                    bottom: 15,
                  ),
                  child: TextField(
                    cursorColor: Color(0xFF082b59),
                    cursorWidth: 1.5,
                    style: TextStyle(fontSize: 14, color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Digite seu email",
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF082b59),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFF58934),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),

                //Senha
                const Padding(
                  padding: EdgeInsets.only(
                    left: 15,
                    right: 15,
                    top: 15,
                    bottom: 15,
                  ),
                  child: TextField(
                    cursorColor: Color(0xFF082b59),
                    cursorWidth: 1.5,
                    style: TextStyle(fontSize: 14, color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Digite sua senha",
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF082b59),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFF58934),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.text,
                    obscureText: true,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 15,
                    right: 15,
                    top: 15,
                    bottom: 15,
                  ),
                  child: TextField(
                    cursorColor: Color(0xFF082b59),
                    cursorWidth: 1.5,
                    style: TextStyle(fontSize: 14, color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Digite sua senha novamente",
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF082b59),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFF58934),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.text,
                    obscureText: true,
                  ),
                ),

                //Botão
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 30, bottom: 32),
                  child: SizedBox(
                    width: 200,
                    height: 36,
                    child: ElevatedButton(
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
                      child: const Text(
                        "EDITAR",
                        style: button,
                      ),
                      onPressed: () {},
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
