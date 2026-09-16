import 'package:flutter/material.dart';

import '../widgets/app_text_field.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key, required this.nomeUsuario});

  final String nomeUsuario;

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _enderecoController = TextEditingController();
  final TextEditingController _cursoController = TextEditingController();
  final TextEditingController _cidadeController = TextEditingController();
  final TextEditingController _paisController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();

  @override
  void dispose() {
    _nomeController.dispose();
    _enderecoController.dispose();
    _cursoController.dispose();
    _cidadeController.dispose();
    _paisController.dispose();
    _telefoneController.dispose();
    super.dispose();
  }

  void _salvar() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Dados cadastrados'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Nome: ${_nomeController.text}'),
                const SizedBox(height: 8),
                Text('Endereço: ${_enderecoController.text}'),
                const SizedBox(height: 8),
                Text('Curso: ${_cursoController.text}'),
                const SizedBox(height: 8),
                Text('Cidade: ${_cidadeController.text}'),
                const SizedBox(height: 8),
                Text('País: ${_paisController.text}'),
                const SizedBox(height: 8),
                Text('Telefone: ${_telefoneController.text}'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
  }

  void _voltarParaLogin() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bem-vindo'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 420,
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Bem-vindo '${widget.nomeUsuario}'",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Cadastre as informações do usuário',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                AppTextField(
                  controller: _nomeController,
                  label: 'Nome',
                  prefixIcon: Icons.badge,
                ),
                const SizedBox(height: 16),
                AppTextField(
                  controller: _enderecoController,
                  label: 'Endereço',
                  prefixIcon: Icons.home,
                ),
                const SizedBox(height: 16),
                AppTextField(
                  controller: _cursoController,
                  label: 'Curso',
                  prefixIcon: Icons.school,
                ),
                const SizedBox(height: 16),
                AppTextField(
                  controller: _cidadeController,
                  label: 'Cidade',
                  prefixIcon: Icons.location_city,
                ),
                const SizedBox(height: 16),
                AppTextField(
                  controller: _paisController,
                  label: 'País',
                  prefixIcon: Icons.public,
                ),
                const SizedBox(height: 16),
                AppTextField(
                  controller: _telefoneController,
                  label: 'Telefone',
                  prefixIcon: Icons.phone,
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _salvar,
                        child: const Text('Salvar'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _voltarParaLogin,
                        child: const Text('Voltar para o login'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
