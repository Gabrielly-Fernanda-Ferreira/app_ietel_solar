import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'styles.dart';
import 'package:brasil_fields/brasil_fields.dart';

class CadastroMan extends StatefulWidget {
  const CadastroMan({super.key});

  @override
  CadastraManutencao createState() => CadastraManutencao();
}

class CadastraManutencao extends State<CadastroMan> {
  final TextEditingController _dataController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Agende a sua ",
                        style: titulo,
                      ),
                      Text(
                        "Manutenção",
                        style: palavraChave,
                      ),
                      Text(
                        ":",
                        style: titulo,
                      )
                    ],
                  ),
                ),

                //Nome
                const Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 20),
                  child: TextField(
                    cursorColor: Color(0xFF082b59),
                    cursorWidth: 1.5,
                    style: TextStyle(fontSize: 14, color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Nome",
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

                //CPF
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: TextField(
                    cursorColor: const Color(0xFF082b59),
                    cursorWidth: 1.5,
                    style: const TextStyle(fontSize: 14, color: Colors.black),
                    decoration: const InputDecoration(
                      counterText: '',
                      hintText: "CPF",
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
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CpfInputFormatter(),
                    ],
                  ),
                ),

                //Telefone
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: TextField(
                    cursorColor: const Color(0xFF082b59),
                    cursorWidth: 1.5,
                    style: const TextStyle(fontSize: 14, color: Colors.black),
                    decoration: const InputDecoration(
                      counterText: '',
                      hintText: "Telefone",
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
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      TelefoneInputFormatter()
                    ],
                  ),
                ),

                //Endereço
                const Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: TextField(
                    cursorColor: Color(0xFF082b59),
                    cursorWidth: 1.5,
                    style: TextStyle(fontSize: 14, color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Endereço",
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
                    keyboardType: TextInputType.multiline,
                  ),
                ),

                //Bairro
                const Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: TextField(
                    cursorColor: Color(0xFF082b59),
                    cursorWidth: 1.5,
                    style: TextStyle(fontSize: 14, color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Bairro",
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

                //Número
                const Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: TextField(
                    cursorColor: Color(0xFF082b59),
                    cursorWidth: 1.5,
                    style: TextStyle(fontSize: 14, color: Colors.black),
                    maxLength: 4,
                    decoration: InputDecoration(
                      counterText: '',
                      hintText: "Número",
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

                //CEP
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: TextField(
                    cursorColor: const Color(0xFF082b59),
                    cursorWidth: 1.5,
                    style: const TextStyle(fontSize: 14, color: Colors.black),
                    decoration: const InputDecoration(
                      counterText: '',
                      hintText: "CEP",
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
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CepInputFormatter(),
                    ],
                  ),
                ),

                //Cidade
                const Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: TextField(
                    cursorColor: Color(0xFF082b59),
                    cursorWidth: 1.5,
                    style: TextStyle(fontSize: 14, color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Cidade",
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

                //Data
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: TextField(
                    controller: _dataController,
                    cursorColor: const Color(0xFF082b59),
                    cursorWidth: 1.5,
                    style: const TextStyle(fontSize: 14, color: Colors.black),
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "Data",
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
                    readOnly: true,
                    onTap: () {
                      _selectDate(context);
                    },
                  ),
                ),

                //Horário
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: TextField(
                    controller: _timeController,
                    cursorColor: const Color(0xFF082b59),
                    cursorWidth: 1.5,
                    style: const TextStyle(fontSize: 14, color: Colors.black),
                    decoration: const InputDecoration(
                      counterText: '',
                      hintText: "Horário",
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
                    readOnly: true,
                    onTap: () {
                      _selectTime(context);
                    },
                  ),
                ),

                //Botão
                Padding(
                  padding: const EdgeInsets.only(
                      top: 30, left: 15, right: 15, bottom: 32),
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
                            if (states.contains(MaterialState.hovered)) {
                              return const Color(0xFF082b59);
                            }
                            return null;
                          },
                        ),
                      ),
                      child: const Text(
                        "AGENDAR",
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

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    );

    if (picked != null) {
      setState(() {
        _dataController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay? timed =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (timed != null) {
      setState(() {
        _timeController.text = timed.format(context).toString();
      });
    }
  }
}
