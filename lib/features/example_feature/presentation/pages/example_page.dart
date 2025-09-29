import 'package:flutter/material.dart';
import '../provider/example_provider.dart';
import 'package:provider/provider.dart';

class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ExampleProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Example Page')),
      body: Center(
        child: provider.isLoading
            ? const CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (provider.message != null) Text(provider.message!),
                  if (provider.error != null)
                    Text(
                      provider.error!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ElevatedButton(
                    onPressed: () => provider.fetchExample(),
                    child: const Text('Fetch Example'),
                  ),
                ],
              ),
      ),
    );
  }
}
