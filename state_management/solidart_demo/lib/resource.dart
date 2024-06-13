import 'package:flutter/material.dart';
import 'package:flutter_solidart/flutter_solidart.dart';

class ResourceExample extends StatefulWidget {
  const ResourceExample({super.key});

  @override
  State<ResourceExample> createState() => _ResourceExampleState();
}

class _ResourceExampleState extends State<ResourceExample> {
  // This resource will use a future to fetch its value.
  // This feature is useful when you need to fetch data in an asynchronous way.
  final resourceWithFuture = Resource(
    fetcher: () => Future.delayed(
      const Duration(seconds: 2),
      () => DateTime.now().microsecondsSinceEpoch.isEven
          ? 'Data'
          : throw Exception('Future - Error fetching data'),
    ),
  );

  // This resource will use a stream to update its value over time.
  // This feature is useful when you need to update data in real-time.
  final resourceWithStream = Resource(
    stream: () => Stream.periodic(
      const Duration(seconds: 3),
      (i) => DateTime.now().microsecondsSinceEpoch.isEven
          ? 'Data'
          : throw Exception('Stream - Error fetching data'),
    ),
  );

  @override
  Widget build(BuildContext context) {
    // A signal builder is required in order to listen to the resource changes.
    return SignalBuilder(
      builder: (_, __) {
        return Column(
          children: [
            ListTile(
              title: const Text('Resource with Future'),
              subtitle: resourceWithFuture().on(
                ready: (data) => Text('Data: $data'),
                error: (error, stacktrace) {
                  return Text('Error: $error');
                },
                loading: () => const Text('Loading...'),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () => resourceWithFuture.refresh(),
              ),
            ),
            const Divider(),
            ListTile(
              title: const Text('Resource with Stream'),
              subtitle: resourceWithStream().on(
                ready: (data) => Text('Data: $data'),
                error: (error, stacktrace) {
                  return Text('Error: $error');
                },
                loading: () => const Text('Loading...'),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () => resourceWithStream.refresh(),
              ),
            ),
          ],
        );
      },
    );
  }
}
