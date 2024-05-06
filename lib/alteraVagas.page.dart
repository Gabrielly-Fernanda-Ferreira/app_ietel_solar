import 'package:flutter/material.dart';
import 'styles.dart';

var _modelos = ['Tempo Integral', 'Estágio', 'Meio Período', 'Trainee'];
var _itemModelo = 'Tempo Integral';

var _tipos = ['Presencial', 'Online', 'Híbrido'];
var _itemTipo = 'Presencial';


class AlteraVagasPage extends StatefulWidget {
  const AlteraVagasPage({super.key});

  @override
  State<AlteraVagasPage> createState() => _AlteraVagasState();
}

class _AlteraVagasState extends State<AlteraVagasPage> {

  void _onSaved(BuildContext context) {
    Navigator.pop(context);
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
                        "Altere a ",
                        style: titulo,
                      ),
                      Text(
                        "Vaga",
                        style: palavraChave,
                      ),
                      Text(
                        ":",
                        style: titulo,
                      ),
                    ],
                  ),
                ),

                //Cargo
                const Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 20),
                  child: TextField(
                    cursorColor: Color(0xFF082b59),
                    cursorWidth: 1.5,
                    style: TextStyle(fontSize: 14, color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Cargo",
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
                  ),
                ),

                //Tipo
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: SizedBox(
                    height: 48,
                    child: DropdownButtonFormField(
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFF58934), width: 2),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFF58934), width: 2),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      dropdownColor: const Color(0xfffdf0e6),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      items: _tipos.map((String dropDownStringItem) {
                        return DropdownMenuItem(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem)
                        );
                      }).toList(),
                      onChanged: (String? novoItemSelecionado) {
                        setState(() {
                          _itemTipo = novoItemSelecionado!;
                        });
                      },
                      value: _itemTipo,
                      style: const TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ),
                ),

                //Local
                const Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: TextField(
                    cursorColor: Color(0xFF082b59),
                    cursorWidth: 1.5,
                    style: TextStyle(fontSize: 14, color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Local",
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
                  ),
                ),

                //Modelo
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: SizedBox(
                    height: 48,
                    child: DropdownButtonFormField(
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFF58934), width: 2),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFF58934), width: 2),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      dropdownColor: const Color(0xfffdf0e6),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      items: _modelos.map((String dropDownStringItem) {
                        return DropdownMenuItem(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem)
                        );
                      }).toList(),
                      onChanged: (String? novoItemSelecionado) {
                        setState(() {
                          _itemModelo = novoItemSelecionado!;
                        });
                      },
                      value: _itemModelo,
                      style: const TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ),
                ),

                //Descrição
                const Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: TextField(
                    minLines: 5,
                    maxLines: 5,
                    cursorColor: Color(0xFF082b59),
                    cursorWidth: 1.5,
                    style: TextStyle(fontSize: 14, color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Descrição",
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
                  ),
                ),

                //Botão
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
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
                        "ALTERAR",
                        style: button,
                      ),
                      onPressed: () => _onSaved(context),
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
