import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:global_form_flutter/Calculator.dart';
import 'package:global_form_flutter/calculator/calculator_bloc.dart';
import 'package:global_form_flutter/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CalculatorBloc>(
        create: (context) => CalculatorBloc(),
        child: MaterialApp(
          title: 'Flutter Demo',
          home: Home(),
        ));
  }
}
