import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/bloc/counter_bloc.dart';
import 'package:flutter_bloc_example/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CounterCubit(),
        child: MaterialApp(
          title: 'Flutter Demo bloc',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(),
        ));
  }
}
