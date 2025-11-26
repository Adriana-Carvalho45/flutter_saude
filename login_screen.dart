import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.lock, size: 80, color: Colors.teal),
            SizedBox(height: 20),
            Text(
              "Bem-vinda Adriana",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),

            // Campo usuário
            TextField(
              controller: userController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person, color: Colors.teal),
                labelText: "Usuário",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            // Campo senha
            TextField(
              controller: passController,
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.password, color: Colors.teal),
                labelText: "Senha",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),

            // Botão entrar
            ElevatedButton.icon(
              icon: Icon(Icons.login),
              label: Text("Entrar", style: TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              ),
              onPressed: () {
                if (userController.text == "adriana" &&
                    passController.text == "123") {
                  Navigator.pushReplacementNamed(context, "/welcome");
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Usuário ou senha inválidos")),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}