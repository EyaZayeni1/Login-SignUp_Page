import 'package:flutter/material.dart';

class ForgetPasswordPage extends StatelessWidget {
  ForgetPasswordPage({super.key});
  
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forgot Password"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Write your New password",
              style: TextStyle(fontSize: 18),
            ),
            
            const SizedBox(height: 30),
            
            Form(
              key: _formKey,
              child: TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password  required";
                  }
                  if (value.length > 10) {
                        return "La taille maximale du mot de passe est 10 caractères";
                      }
                      if (value.length < 6) { 
                        return "Le mot de passe doit contenir au moins 6 caractères";
                      }
                  return null;
                },
              ),
            ),
            
            const SizedBox(height: 30),
            
            FilledButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Reset password "),
                    ),
                  );
                  
                  // Go back to login page after 2 seconds
                  Future.delayed(const Duration(seconds: 2), () {
                    Navigator.pop(context);
                  });
                }
              },
              child: const Text("Reset Password"),
            ),
            
            const SizedBox(height: 20),
            
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Go back to login
              },
              child: const Text("Back to Login"),
            ),
          ],
        ),
      ),
    );
  }
}