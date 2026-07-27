import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController(text: 'demo@exemple.com');

  @override
  void dispose() {
    _emailCtrl.dispose();
    super.dispose();
  }

  void _seConnecter() {
    if (_formKey.currentState!.validate()) {
      // pushReplacement : on remplace l'écran de login, l'utilisateur
      // ne pourra pas revenir en arrière avec le bouton "retour".
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.flutter_dash, size: 72, color: Colors.indigo),
                  const SizedBox(height: 16),
                  Text(
                    'Bienvenue',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: _emailCtrl,
                    decoration: const InputDecoration(
                      labelText: 'Adresse e-mail',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                    validator: (value) {
                      if (value == null || !value.contains('@')) {
                        return 'Entrez un e-mail valide';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: _seConnecter,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Text('Se connecter'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
