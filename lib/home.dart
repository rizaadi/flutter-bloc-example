import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter_bloc.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("cubit"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            //? BloC Consumer is a combination of BloC Builder and BloC Listener.
            BlocConsumer<CounterCubit, int>(
              bloc: BlocProvider.of<CounterCubit>(context),
              listenWhen: (previous, current) {
                if (current % 2 == 0) {
                  return true;
                } else {
                  return false;
                }
              },
              listener: (context, state) {
                //? Execute this function if the BLoC state undergoes a change.
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("ANJAYYY")),
                );
              },
              builder: (context, state) {
                return Text("$state");
              },
            ),
            const SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              IconButton(
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).kurangData();
                },
                icon: const Icon(Icons.remove),
              ),
              IconButton(
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).tambahData();
                },
                icon: const Icon(Icons.add),
              ),
            ])
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
