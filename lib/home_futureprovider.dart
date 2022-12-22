import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_riverpod/main.dart';

class HomeFuture extends ConsumerStatefulWidget {
  const HomeFuture({super.key});

  @override
  ConsumerState<HomeFuture> createState() => _MyWidgetState();
}

class _MyWidgetState extends ConsumerState<HomeFuture> {
  @override
  Widget build(BuildContext context) {
    
  return  ref.watch(fetchUser).when(data: (data){
 return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: Center(child: Column()),
    );
    },
    error: (error, stackTrace){
      return Center(
        child: Text(error.toString()),
      );
    },
    loading: (){
      return Center(
        child: CircularProgressIndicator() ,
      );
    }
    );
   
  }
}
