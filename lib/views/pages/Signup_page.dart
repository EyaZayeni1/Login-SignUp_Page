import 'package:flutter/material.dart';
import 'package:login_signup/views/pages/Home_page.dart';
import 'package:login_signup/views/pages/welcome_page.dart';
class SignupPage
 extends StatelessWidget {
SignupPage({super.key});
final _formKey = GlobalKey<FormState>();
final _passwordcontroller=TextEditingController();

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
      
                    decoration: const InputDecoration(label: Text("Nom")
                  ),
                  validator: (value) {
                    if (value==null || value.isEmpty){
                      return "Nom est obligatoire";
                    }
                    return null;
                  },) , 
                  TextFormField(
                   
                    decoration: const InputDecoration(label: Text("Prenom")
                  ),
                  validator: (value) {
                    if (value==null || value.isEmpty){
                      return "Nom est obligatoire";
                    }
                    return null;}) , 
                  TextFormField(
                   
                    decoration: const InputDecoration(label: Text("Email Address")
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
                  TextFormField(
                    controller: _passwordcontroller,
                    decoration: const InputDecoration(label: Text("Mot De Passe ")
                  ), 
                  obscureText: true,
                  validator: (value) {
                    // ignore: unrelated_type_equality_checks
                    if (value == Null || value!.isEmpty ){
                      return " veuillez saisir votre mot de passe ";
                    }
                    else {
                      if (value .length>10) {
                        return " la taille maximale du mot de passe est 10 caracteres " ;
                      }
                      else {
                        return null;
                      }
                    }
                  })
                  ,
                  TextFormField(
                    decoration: const InputDecoration(label: Text("Confirm Password")),
                    obscureText: true,
                    validator: (value) {
                      if (value==null || value.isEmpty ){
                      return " veuillez saisir votre mot de passe ";
                    }
                    if(value !=_passwordcontroller.text) {
                      return "Passwords don't match";
                      
                    }
                    else {
                      return null;
                    }},

                  ),


                  const SizedBox(height: 20),

                  FilledButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      }
                    },
                    child: const Text("Sign Up"),
                  ),
                  TextButton(onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                      return WelcomePage();
                    },));
                   }, child: Text(' Already have an Acccount ? Login'))
                ],
              )
              ),
          ]
            
            
          
        ),
      ),
    );
  }
}