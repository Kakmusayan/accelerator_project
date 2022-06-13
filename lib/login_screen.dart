import 'package:flutter/material.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  String? login;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Авторизация'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Введите логин и пароль',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text('Логин'),
                        ),
                        maxLength: 8,
                        validator: (value) {
                          if (value == null) return 'Проверьте логин';
                          if (value.length < 3) {
                            return 'Логин должен содержать не менее 3 символов';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          login = value;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text('Пароль'),
                        ),
                        maxLength: 16,
                        validator: (value) {
                          if (value == null) return 'Проверьте пароль';
                          if (value.length < 8) {
                            return 'Пароль должен содержать не менее 8 символов';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          password = value;
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: ElevatedButton(
                    child: const Text('Вход'),
                    onPressed: () {
                      final isValidated = formKey.currentState?.save();
                      if (login == 'qwerty' && password == '123456ab') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Попробуйте снова'),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Закрыть'),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
