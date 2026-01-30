import 'package:flutter/material.dart';
import 'package:login_signup/views/pages/Home_page.dart';
import 'package:login_signup/views/pages/Signup_page.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({super.key});
  
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20.0), 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _formKey, 
              child: Column(
                children: [ 
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text("Email Address"),
                      border: OutlineInputBorder(), // Added for better visibility
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email obligatoire";
                      }

                      final emailRegex = RegExp(
                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                      );

                      if (!emailRegex.hasMatch(value)) {
                        return "Email invalide";
                      }

                      return null; 
                    },
                  ),
                  
                  const SizedBox(height: 20), // Added spacing
                  
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text("Mot De Passe"),
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true, 
                    validator: (value) {
                      
                      if (value == null || value.isEmpty) {
                        return "Veuillez saisir votre mot de passe";
                      }
                      if (value.length > 10) {
                        return "La taille maximale du mot de passe est 10 caractères";
                      }
                      if (value.length < 6) { // Added minimum length check (optional)
                        return "Le mot de passe doit contenir au moins 6 caractères";
                      }
                      return null;
                    },
                  ),
                  
                  const SizedBox(height: 40),

                  FilledButton(
                    onPressed: () {
                      // Check if form is valid
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      }
                    },
                    child: const Text("Login"),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 20), 
            
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignupPage(),
                  ),
                );
              },
              child: const Text("Don't have an account? Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}