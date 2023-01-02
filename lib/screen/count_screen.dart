import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stat_management/provider/count_provider.dart';

class Count extends StatefulWidget {
  const Count({Key? key}) : super(key: key);

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text("State"),),
      body: Center(child: Text(countProvider.count.toString(),style: TextStyle(fontSize: 50),),),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          countProvider.setCount();
        } ,
        child: const Icon(Icons.scale),

      ),
    );
  }
}
