import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wholify/src/utils/Strings.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Color.fromARGB(181, 0, 0, 0), BlendMode.darken),
              image: const NetworkImage(
                  'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExZWtwdHUxd280Zm1qbno4MnVwNzV3dDQ0aWVpbzdmcjhvdnYzenh2eCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/3oz8xus1ykCFgxW2ac/giphy-downsized.gif'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Bienvenido a Whoolify',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                width: size.width,
                height: 20,
                child: DefaultTextStyle(
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  child: AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      TyperAnimatedText(
                        secret,
                      ),
                      TyperAnimatedText(melody),
                      TyperAnimatedText(playlist),
                      TyperAnimatedText(music),
                      TyperAnimatedText(secretPlaylist),
                      TyperAnimatedText(secretplaylist),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 50),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/wait');
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green[400])),
                    child: const Row(
                      children: [
                        Expanded(
                            child: Text(
                          "Inicia sesión con spotify",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                        Icon(
                          FontAwesomeIcons.spotify,
                          color: Colors.white,
                        )
                      ],
                    )),
              ),
            ],
          )),
    );
  }
}
