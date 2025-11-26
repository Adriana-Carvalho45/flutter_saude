import 'package:flutter/material.dart';

class ConsultasScreen extends StatefulWidget {
  @override
  _ConsultasScreenState createState() => _ConsultasScreenState();
}

class _ConsultasScreenState extends State<ConsultasScreen> {
  String? especialidadeSelecionada;
  DateTime? dataSelecionada;
  TimeOfDay? horarioSelecionado;

  void salvarConsultaLocal() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Consulta marcada: $especialidadeSelecionada em ${dataSelecionada!.day}/${dataSelecionada!.month} às ${horarioSelecionado!.format(context)}",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Marcar Consulta"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Ícone + título
            Row(
              children: [
                Icon(Icons.medical_services, color: Colors.teal, size: 28),
                SizedBox(width: 10),
                Text("Escolha a especialidade",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
            DropdownButton<String>(
              isExpanded: true,
              hint: Text("Selecione"),
              value: especialidadeSelecionada,
              items: ["Cardiologia", "Dermatologia", "Ortopedia"]
                  .map((esp) => DropdownMenuItem(value: esp, child: Text(esp)))
                  .toList(),
              onChanged: (value) => setState(() => especialidadeSelecionada = value),
            ),
            SizedBox(height: 20),

            // Ícone + botão de data
            ElevatedButton.icon(
              icon: Icon(Icons.calendar_today),
              label: Text("Escolher Data"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
              onPressed: () async {
                final data = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2026),
                );
                setState(() => dataSelecionada = data);
              },
            ),
            SizedBox(height: 10),

            // Ícone + botão de horário
            ElevatedButton.icon(
              icon: Icon(Icons.access_time),
              label: Text("Escolher Horário"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
              onPressed: () async {
                final hora = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                setState(() => horarioSelecionado = hora);
              },
            ),
            SizedBox(height: 30),

            // Botão confirmar
            ElevatedButton(
              onPressed: () {
                if (especialidadeSelecionada != null &&
                    dataSelecionada != null &&
                    horarioSelecionado != null) {
                  salvarConsultaLocal();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Preencha todos os campos")),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              child: Text("Confirmar", style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}