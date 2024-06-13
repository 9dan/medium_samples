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
      debugPrint('SignalExample: ${counter.value}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SignalBuilder(
      builder: (_, __) {
        // Calling counter.value inside a builder of a SignalBuilder is
        // another way to register a listener, so the builder will be
        // called every time our counter value changes.
        final c = counter.value;
        return Column(
          children: [
            Text(
              'SignalExample: $c',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
              onPressed: () => counter.value++,
              child: const Text('Increment'),
            ),
          ],
        );
      },
    );
  }
}
