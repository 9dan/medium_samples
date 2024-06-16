import 'package:flutter/material.dart';
import 'package:flutter_solidart/flutter_solidart.dart';

class SignalPage extends StatefulWidget {
  const SignalPage({super.key});

  @override
  State<SignalPage> createState() => _SignalPageState();
}

class _SignalPageState extends State<SignalPage> {
  // This count will call an update on its listeners every time it changes.
  final counter = Signal(0);

  // Creating an effect is one way to register a subscriber to a signal.
  //
  // This effect will just print the counter's value every time it changes.
  late final Effect printEffect;

  @override
  void initState() {
    super.initState();

    counter.onDispose(() {
      debugPrint('Counter disposed');
    });

    // Creating the effect
    printEffect = Effect((_) {
      debugPrint('Signal value: ${counter.value}');
    });
  }

  @override
  void dispose() {
    super.dispose();
    /// We NEED to dispose the effect manually in order to avoid memory leaks
    /// and to have the signal disposed when this state is disposed.
    /// 
    /// This is because Effect instances are not disposed automatically.
    /// In addition, the fact that the effect reads the counter signal, causes
    /// the signal not to be automatically disposed when this state is disposed.
    ///
    /// Since this effect is [counter] only subscriber by the time this state
    /// disposes, the signal's 'onDispose' callback will be called once it is
    /// disposed with the following line.
    ///
    /// You can try it yourself by removing this line and checking that the
    /// log 'Counter disposed' will not be printed anymore when this state is
    /// disposed.
    printEffect.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Signal')),
      body: Card.outlined(
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
              child: SignalBuilder(
                builder: (_, __) {
                  return Text('Value: ${counter.value}');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
