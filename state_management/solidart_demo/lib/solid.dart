import 'package:flutter/material.dart';
import 'package:flutter_solidart/flutter_solidart.dart';

class SolidExample extends StatefulWidget {
  const SolidExample({super.key});

  @override
  State<SolidExample> createState() => _SolidExampleState();
}

class _SolidExampleState extends State<SolidExample> {

  @override
  Widget build(BuildContext context) {
    return Solid(
      providers: [
        // This provider will hold the current counter value.
        // The type of the signal MUST be defined, in this case, it's an integer.
        Provider<Signal<int>>(create: () => Signal(0)),
      ],
      builder: (context) {
        return SignalBuilder(
          builder: (_, __) {
            // Getting the current counter value by using context.get
            // Context.get will find the FIRST provider of the given type
            final c = context.get<Signal<int>>().value;
            return Column(
              children: [
                Text(
                  'SolidExample: $c',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                ElevatedButton(
                  // Increment the counter value by 1
                  onPressed: () => context.get<Signal<int>>().value++,
                  child: const Text('Increment'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
