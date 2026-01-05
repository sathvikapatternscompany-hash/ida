import 'package:flutter/material.dart';

class UpdatesScreen extends StatelessWidget {
  const UpdatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock Data
    final updates = [
      {
        'title': 'Lunch Time Change',
        'body': 'Lunch will be served at 1:00 PM instead of 12:30 PM today.',
        'time': '10 mins ago',
      },
      {
        'title': 'Session Delayed',
        'body':
            'The Keynote session will start 15 mins late due to technical issues.',
        'time': '1 hour ago',
      },
      {
        'title': 'Welcome Kit',
        'body': 'Please collect your welcome kit from the registration desk.',
        'time': '2 hours ago',
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Latest Updates')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: updates.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final update = updates[index];
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        update['title']!,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                      ),
                      Text(
                        update['time']!,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(update['body']!),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
