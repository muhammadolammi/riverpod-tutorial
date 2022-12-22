import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_riverpod/home.dart';
import 'package:learning_riverpod/home_futureprovider.dart';
import 'package:learning_riverpod/prac.dart';
import 'package:learning_riverpod/user.dart';
import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';
import 'package:learning_riverpod/user_futureprovider.dart';
import 'package:learning_riverpod/user_prac.dart';

var _countera = StateProvider((_) => 0);
//providers
//1. provider
//final nameProvider = Provider<String>((ref) => "Muhammad ");
//2 state provider
//final nameProvider = StateProvider<String?>((ref) => "");
//3 StateNotifier and StateNotifier prvider
//final nameProvider1 = StateNotifierProvider<InfoNotifier, Info>(
//(ref) => InfoNotifier(),
//);
final nameProvider = StateNotifierProvider<UserNotifier, User>(
  (ref) => UserNotifier(),
);

// 4th changeNotifierProvider only recommended when moving from Provider to riverpod
//final nameProvider1 =
//    ChangeNotifierProvider<UserChangeNotifier>((ref) => UserChangeNotifier());
// 5 FutureProvider
final fetchUser = FutureProvider((ref) {
  final userRepository = ref.watch(futureUserRepoProvider);
  return userRepository.fetchUserData();
});
void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Riverpod Tutorial',
      home: Prac(),
    );
  }
}
