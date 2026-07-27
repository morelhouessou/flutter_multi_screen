import 'package:flutter/material.dart';

class ProfileFormScreen extends StatefulWidget {
  const ProfileFormScreen({super.key});

  @override
  State<ProfileFormScreen> createState() => _ProfileFormScreenState();
}

class _ProfileFormScreenState extends State<ProfileFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _phoneCtrl.dispose();
    super.dispose();
  }

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Profil enregistré pour ${_nameCtrl.text}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Modifier le profil')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Informations du profil', style: Theme.of(context).textTheme.headlineSmall),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _nameCtrl,
                        decoration: const InputDecoration(
                          labelText: 'Nom complet',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person_outline),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Entrez votre nom complet';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _emailCtrl,
                        keyboardType: TextInputType.emailAddress,
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
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _phoneCtrl,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          labelText: 'Téléphone',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.phone_outlined),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().length < 8) {
                            return 'Entrez un numéro valide';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24),
                      FilledButton(
                        onPressed: _saveProfile,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 14),
                          child: Text('Enregistrer'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
