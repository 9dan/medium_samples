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
    return Card.outlined(
      clipBehavior: Clip.antiAlias,
      child: Solid(
        providers: [
          // The subtree will have access to this signal by using context.get
          Provider<Signal<int>>(create: () => Signal(0)),
        ],
        builder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListTile(
                title: const Text('Solid'),
                trailing: IconButton(
                  onPressed: () => context.get<Signal<int>>().value++,
                  icon: const Icon(Icons.add_rounded),
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(16),
                child: SignalBuilder(
                  builder: (_, __) {
                    // Getting the current counter value by using context.get
                    // Context.get will find the FIRST provider of the given type
                    final value = context.get<Signal<int>>().value;
                    return Text('Value: $value');
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
