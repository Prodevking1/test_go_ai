import 'package:go_ai/login/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final GlobalKey<FormState> formKey = GlobalKey();
  LoginRepository _loginRepository = Get.put(LoginRepository());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FormType _formType = FormType.login;
  final isLoading = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _formType == FormType.login
            ? const Text('Page de connexion')
            : const Text('Page d\'inscription'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(child: logoCover()),
          _formType == FormType.login ? loginForm() : registerForm(),
        ]),
      ),
    );
  }

  /* Widgets */

  Widget logoCover() {
    return Container(
      /* height: 200,
      width: 200, */
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: Image.network(
        "https://goaicorporation.org/img/logo.png",
      ),
    );
  }

  Form loginForm() {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        TextFormField(
          controller: emailController,
          validator: (value) {
            return (value == null || value.isEmpty) ? 'Invalide' : null;
          },
          decoration: inputDecoration('E-mail', Icons.person),
        ),
        SizedBox(
          height: 8,
        ),
        TextFormField(
          validator: (value) {
            return (value == null || value.isEmpty) ? 'Inavalide' : null;
          },
          controller: passwordController,
          decoration: inputDecoration('Mot de passe', Icons.lock),
        ),
        SizedBox(
          height: 15,
        ),
        InkWell(
          onTap: () async {
            if (formKey.currentState?.validate() ?? false) {
              isLoading.value = true;
              await _loginRepository.loginUser(
                  emailController.text, passwordController.text);
              isLoading.value = false;
            }
          },
          child: Obx(() {
            return isLoading.value
                ? const CircularProgressIndicator()
                : Container(
                    width: Get.width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        'Connexion',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
          }),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Vous n\'avez pas de compte?'),
            SizedBox(
              width: 8,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _formType = FormType.register;
                });
              },
              child: Text(
                'Creer un compte',
                style: TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }

  Form registerForm() {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        TextFormField(
          controller: emailController,
          validator: (value) {
            return (value == null || value.isEmpty || value.length < 8)
                ? 'mininum 8'
                : null;
          },
          decoration: inputDecoration('E-mail', Icons.person),
        ),
        SizedBox(
          height: 8,
        ),
        TextFormField(
          validator: (value) {
            return (value == null || value.isEmpty || value.length < 8)
                ? 'Invalid'
                : null;
          },
          controller: passwordController,
          decoration: inputDecoration('Mot de passe', Icons.lock),
        ),
        SizedBox(
          height: 8,
        ),
        TextFormField(
          validator: (value) {
            return (value == null ||
                    value.isEmpty ||
                    value != passwordController.text)
                ? 'Les mots de passe ne correspondent pas'
                : null;
          },
          decoration: inputDecoration('Mot de passe', Icons.lock),
        ),
        //inscription button red large
        SizedBox(
          height: 15,
        ),
        InkWell(
          onTap: () async {
            if (formKey.currentState?.validate() ?? false) {
              isLoading.value = true;
              await _loginRepository.registerUser(emailController.text,
                  emailController.text, passwordController.text);
              isLoading.value = false;
            }
          },
          child: Obx(() {
            return isLoading.value
                ? const CircularProgressIndicator()
                : Container(
                    width: Get.width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        'Inscription',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
          }),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              _formType = FormType.login;
            });
          },
          child: Text('Connexion'),
        )
      ]),
    );
  }
}

InputDecoration inputDecoration(String labelText, IconData iconData,
    {String? prefix, String? helperText}) {
  return InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
    helperText: helperText,
    labelText: labelText,
    labelStyle: TextStyle(color: Colors.grey),
    fillColor: Colors.grey.shade200,
    filled: true,
    prefixText: prefix,
    prefixIcon: Icon(
      iconData,
      size: 20,
    ),
    prefixIconConstraints: BoxConstraints(minWidth: 60),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: Colors.black)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: Colors.black)),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: Colors.black)),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: Colors.black)),
  );
}

enum FormType { login, register }
