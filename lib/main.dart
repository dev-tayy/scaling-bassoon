import 'package:defi/cubit/coin_cubit.dart';
import 'package:defi/repository/coin_repo.dart';
import 'package:defi/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeFi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Karla',
      ),
      home: BlocProvider(
        create: (context) => CoinCubit(CoinRepository()),
        child: const HomeScreen(),
      ),
    );
  }
}
