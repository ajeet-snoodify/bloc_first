import 'package:bloc/bloc.dart';
import 'package:bloc_first/features/counter/presentation/bloc/counter_bloc.dart';
import 'package:bloc_first/features/counter/presentation/screens/counter_screen.dart';
import 'package:flutter/material.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CounterBlocObserver();
  runApp(BlocApp());
}

class BlocApp extends StatelessWidget {
  const BlocApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterScreen(),
    );
  }
}
