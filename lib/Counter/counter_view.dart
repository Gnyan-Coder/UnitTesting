import 'package:flutter/material.dart';
import 'package:unittesting/Counter/counter_controller.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  Counter counter=Counter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            counter.incrementCounter();
          });
        },
        child: const Icon(Icons.add),
      ),
      body: Center(child: Text(counter.count.toString())),
    );
  }
}