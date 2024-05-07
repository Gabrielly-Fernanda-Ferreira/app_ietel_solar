import 'package:flutter/material.dart';
import 'styles.dart';

class AgendamentoManu extends StatefulWidget {
  const AgendamentoManu({super.key});

  @override
  AgendamentoManutencao createState() => AgendamentoManutencao();
}

class AgendamentoManutencao extends State<AgendamentoManu> {
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
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Agendamento da ",
                        style: titulo,
                      ),
                      Text(
                        "Manutenção",
                        style: palavraChave,
                      ),
                      Text(
                        ":",
                        style: titulo,
                      ),
                    ],
                  ),
                ),

                //Data

                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
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
                        prefixIcon: Icon(Icons.date_range)),
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
                    // controller: _timeController,
                    cursorColor: const Color(0xFF082b59),
                    cursorWidth: 1.5,
                    style: const TextStyle(fontSize: 14, color: Colors.black),
                    controller: _timeController,
                    maxLength: 4,
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
                      left: 15, right: 15, bottom: 32, top: 30),
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
