import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_riverpod/main.dart';
import 'package:learning_riverpod/user.dart';
import 'package:learning_riverpod/user_prac.dart';

class Prac extends ConsumerStatefulWidget {
  const Prac({super.key});

  @override
  ConsumerState<Prac> createState() => _PracState();
}

class _PracState extends ConsumerState<Prac> {
  @override
  Widget build(BuildContext context) {
    return ref.watch(fetchUser).when(data: (data) {
      return Scaffold(
        appBar: AppBar(
          title: Text(data.name),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Column(
          children: [
            TextField(
              decoration: InputDecoration(hintText: 'User Name'),
            ),
            TextField(
              decoration: InputDecoration(hintText: 'User Age'),
            ),
            Center(
              child: Text(""),
            )
          ],
        )),
      );
    }, error: (error, stackTrace) {
      print(error.toString());
      return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Container(
                height: 100,
                width: MediaQuery.of(context).size.width * 0.70,
                color: Colors.pink,
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(error.toString()),
                ))),
          ));
    }, loading: () {
      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
