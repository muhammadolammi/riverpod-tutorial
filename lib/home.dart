import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_riverpod/main.dart';
import 'package:learning_riverpod/user.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _MyWidgetState();
}

class _MyWidgetState extends ConsumerState<Home> {
  void onSubmitName(String value) {
    //ref.read(nameProvider1.notifier).update((state) => value);
    ref.read(nameProvider.notifier).updateName(value);
  }

  void onSubmitAge(String value) {
    //ref.read(nameProvider1.notifier).update((state) => value);
    ref.read(nameProvider.notifier).updateAge(int.parse(value));
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(nameProvider);
// TODO the third option is here using the select method to select just a variable
    //final getUserName = ref.watch(nameProvider.select((value) => value.name));
    //print("rebuilt");

    // final getUserAge = ref.watch(nameProvider.select((value) => value.age));
    ///print("rebuilt");
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        children: [
          TextField(
            decoration: InputDecoration(hintText: 'User Name'),
            onSubmitted: (value) => onSubmitName(value),
          ),
          TextField(
            decoration: InputDecoration(hintText: 'User Age'),
            onSubmitted: (value) => onSubmitAge(value),
          ),
          Center(
            child: Text(user.age.toString()),
          )
        ],
      )),
    );
  }
}
