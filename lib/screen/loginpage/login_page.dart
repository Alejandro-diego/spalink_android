import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final usuario = TextEditingController();
  final senha = TextEditingController();

  @override
  void dispose() {
    usuario.dispose();
    senha.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/image/fondospa.png'),
                fit: BoxFit.cover),
          ),
          child: Stack(
            children: [
              Positioned(
                width: size.width * 0.88,
                height: size.height,
                left: size.width * 0.10,
                top: size.height * 0.15,
                child: const Text(
                  'Log In',
                  style: TextStyle(fontSize: 40),
                ),
              ),
              Positioned(
                width: size.width * 0.88,
                height: size.height,
                left: size.width * 0.05,
                top: size.height * 0.05,
                child: FormSigIn(
                  keyvalidator: _formKey,
                  passcontroller: senha,
                  usercontroller: usuario,
                ),
              ),
              Positioned(
                left: size.width * 0.2,
                top: size.height * 0.64,
                child: SizedBox(
                  height: 60,
                  width: size.width * 0.60,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        sigIN();

                        colocarCredenciales();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: const Text(
                      'Log in',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: size.width * 0.01,
                top: size.height * 0.95,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Power By',
                      style: GoogleFonts.cedarvilleCursive(
                        textStyle: const TextStyle(fontSize: 15),
                      ),
                    ),
                    Text(
                      'IOT',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w500,
                        textStyle:
                            const TextStyle(color: Colors.red, fontSize: 30),
                      ),
                    ),
                    Text(
                      'ech',
                      style: GoogleFonts.roboto(
                        textStyle:
                            const TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: size.width * 0.05,
                top: size.height * 0.79,
                child: Row(
                  children: [
                    Text(
                      'Spa',
                      style: GoogleFonts.msMadi(
                        textStyle: const TextStyle(
                          color: Colors.redAccent,
                          fontSize: 80.0),
                      ),
                    ),
                      Text(
                      'LINK',
                      style: GoogleFonts.ubuntuCondensed(
                        textStyle: const TextStyle(fontSize: 35.0),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future sigIN() async {
    late String error = "erro";
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: usuario.text.trim(),
        password: senha.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        error = "E-mail não registrado";
        if (kDebugMode) {
          print('No user found for that email.');
        }
      } else if (e.code == 'wrong-password') {
        error = "Senha invalida";
        if (kDebugMode) {
          print('Wrong password provided for that user.');
        }
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.black,
          content: Text(
            error,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );
    }
  }

  Future<void> colocarCredenciales() async {
    SharedPreferences preference = await SharedPreferences.getInstance();

    setState(
      () {
        preference.setString('email', usuario.text);
        preference.setString('password', senha.text);
      },
    );
  }
}
