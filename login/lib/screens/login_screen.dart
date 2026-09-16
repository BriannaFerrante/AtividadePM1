import 'package:flutter/material.dart';

import '../constants/app_credentials.dart';
import '../widgets/app_text_field.dart';
import 'welcome_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usuarioController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  bool _senhaVisivel = false;

  @override
  void dispose() {
    _usuarioController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  void _entrar() {
    final usuario = _usuarioController.text.trim();
    final senha = _senhaController.text;

    if (usuario.isEmpty || senha.isEmpty) {
      _mostrarMensagem('Preencha o usuário e a senha.');
      return;
    }

    if (usuario == AppCredentials.usuario && senha == AppCredentials.senha) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WelcomeScreen(nomeUsuario: usuario),
        ),
      );
    } else {
      _mostrarMensagem('Usuário e/ou senha incorretos.');
    }
  }

  void _mostrarMensagem(String mensagem) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensagem)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 360,
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 56,
                      backgroundColor: Colors.indigo,
                      child: ClipOval(
                        child: Image.network(
                          'https://i.pravatar.cc/300?img=12',
                          width: 112,
                          height: 112,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.person,
                              size: 64,
                              color: Colors.white,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const Text(
                  'Entre com sua conta',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),
                AppTextField(
                  controller: _usuarioController,
                  label: 'Nome de usuário',
                  prefixIcon: Icons.person,
                ),
                const SizedBox(height: 16),
                AppTextField(
                  controller: _senhaController,
                  label: 'Senha',
                  prefixIcon: Icons.lock,
                  obscureText: !_senhaVisivel,
                  suffixIcon: IconButton(
                    tooltip: _senhaVisivel ? 'Ocultar senha' : 'Exibir senha',
                    onPressed: () {
                      setState(() {
                        _senhaVisivel = !_senhaVisivel;
                      });
                    },
                    icon: Icon(
                      _senhaVisivel ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _entrar,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text('Entrar'),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Usuário: admin  |  Senha: 123456',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
