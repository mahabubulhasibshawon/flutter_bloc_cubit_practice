import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit_practice/counter_screen/counter_screen.dart';
import 'package:flutter_bloc_cubit_practice/counter_screen/cubit/checkbox_cubit.dart';
import 'package:flutter_bloc_cubit_practice/counter_screen/cubit/counter_cubit.dart';
import 'package:flutter_bloc_cubit_practice/counter_screen/cubit/text_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => CounterCubit()),
          BlocProvider(create: (context) => TextCubit()),
          BlocProvider(create: (context) => CheckboxCubit()),
        ],
        child: CounterScreen(),
      ),
    );
  }
}
