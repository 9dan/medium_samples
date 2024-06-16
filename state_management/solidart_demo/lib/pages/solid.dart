import 'package:flutter/material.dart';
import 'package:flutter_solidart/flutter_solidart.dart';

class SolidPage extends StatefulWidget {
  const SolidPage({super.key});

  @override
  State<SolidPage> createState() => _SolidPageState();
}

class _SolidPageState extends State<SolidPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Solid')),
      body: Card.outlined(
        clipBehavior: Clip.antiAlias,
        child: Solid(
          providers: [
            // The subtree will have access to this signal by using context.get
            Provider<Signal<int>>(
              create: () {
                final signal = Signal(0);
                signal.onDispose(() {
                  debugPrint('Signal disposed');
                });
                return signal;
              },
            ),
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
      ),
    );
  }
}
