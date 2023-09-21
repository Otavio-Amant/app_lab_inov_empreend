import 'package:flutter/material.dart';

void main() {
  runApp(AcessoApp());
}

class AcessoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: AcessoScreen(),
    );
  }
}

class AcessoScreen extends StatefulWidget {
  @override
  _AcessoScreenState createState() => _AcessoScreenState();
}

class _AcessoScreenState extends State<AcessoScreen> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController tipoAcessoController = TextEditingController();

  void _navigateToSegundaTela() {
    final usuario = Usuario(
      nome: nomeController.text,
      email: emailController.text,
      tipoAcesso: tipoAcessoController.text,
    );

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => SegundaTela(usuario),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela de Acesso'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              controller: nomeController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              controller: tipoAcessoController,
              decoration: InputDecoration(labelText: 'Tipo de Acesso'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _navigateToSegundaTela,
              child: Text('Acessar'),
            ),
          ],
        ),
      ),
    );
  }
}

class Usuario {
  final String nome;
  final String email;
  final String tipoAcesso;

  Usuario({
    required this.nome,
    required this.email,
    required this.tipoAcesso,
  });
}

class SegundaTela extends StatefulWidget {
  final Usuario usuario;

  SegundaTela(this.usuario);

  @override
  _SegundaTelaState createState() => _SegundaTelaState();
}

class _SegundaTelaState extends State<SegundaTela> {
  bool mostrarInformacoes = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.usuario.nome),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              if (mostrarInformacoes)
                Column(
                  children: [
                    Text('Nome: ${widget.usuario.nome}',
                        style: TextStyle(fontSize: 18)),
                    Text('Email: ${widget.usuario.email}',
                        style: TextStyle(fontSize: 18)),
                    Text('Tipo de Acesso: ${widget.usuario.tipoAcesso}',
                        style: TextStyle(fontSize: 18)),
                    SizedBox(height: 16.0),
                  ],
                ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    mostrarInformacoes = !mostrarInformacoes;
                  });
                },
                style: ElevatedButton.styleFrom(),
                child: Text(
                    mostrarInformacoes
                        ? 'Ocultar informações'
                        : 'Mostrar informações',
                    style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
