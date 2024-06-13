import 'package:flutter/material.dart';
import 'package:flutter_solidart/flutter_solidart.dart';

class SignalExample extends StatefulWidget {
  const SignalExample({super.key});

  @override
  State<SignalExample> createState() => _SignalExampleState();
}

class _SignalExampleState extends State<SignalExample> {
  // This count will call an update on its listeners every time it changes.
  final counter = Signal(0);

  // Creating an effect is one way to register a subscriber to a signal.
  //
  // This effect will just print the counter's value every time it changes.
  late final Effect printEffect;

  @override
  void initState() {
    super.initState();

    // Creating the effect
    printEffect = Effect((_) {
      debugPrint('Signal value: ${counter.value}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            title: const Text('Signal'),
            trailing: IconButton(
              onPressed: () => counter.value++,
              icon: const Icon(Icons.add_rounded),
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(16),
            // A signal builder is required in order to listen to the signal changes.
            child: SignalBuilder(builder: (_, __) {
              return Text('Value: ${counter.value}');
            }),
          ),
        ],
      ),
    );
  }
}
