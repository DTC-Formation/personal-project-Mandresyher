import 'package:flutter/material.dart';
import 'package:lastprojects/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lastprojects/option/option_avanc%C3%A9/api.dart';
import 'package:provider/provider.dart';

import 'option/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BeforeHome(),
        theme: ThemeData(fontFamily: GoogleFonts.oswald().fontFamily),
      ),
    );
  }
}

class BeforeHome extends StatefulWidget {
  const BeforeHome({super.key});

  @override
  State<BeforeHome> createState() => _BeforeHomeState();
}

class _BeforeHomeState extends State<BeforeHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(32),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://i.pinimg.com/originals/ff/fe/5b/fffe5baf5d98f349e1a8821c3a8165cf.jpg"),
                fit: BoxFit.cover)),
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            setState(() {
              JokeApi.getProgrammingJokes();
            });
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
          child: const Icon(
            Icons.play_arrow_outlined,
            color: Colors.purple,
          ),
        ),
      ),
    );
  }
}
