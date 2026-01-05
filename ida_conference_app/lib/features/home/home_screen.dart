import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/session.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Mock Data
    final liveSession = Session(
      id: '1',
      title: 'Keynote: Future of Dentistry',
      speakerName: 'Dr. John Doe',
      time: '10:00 AM - 11:00 AM',
      hall: 'Main Hall',
      description: 'An inspiring talk about the future...',
    );

    final upNextList = [
      Session(
        id: '2',
        title: 'Advanced Root Canal Techniques',
        speakerName: 'Dr. Jane Smith',
        time: '11:30 AM - 12:30 PM',
        hall: 'Hall A',
        description: 'Deep dive into RCT.',
      ),
      Session(
        id: '3',
        title: 'Digital Smile Design',
        speakerName: 'Dr. Emily Brown',
        time: '11:30 AM - 12:30 PM',
        hall: 'Hall B',
        description: 'Using digital tools for smile design.',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('IDA Conference'),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            const SizedBox(height: 24),
            _buildSectionTitle(context, 'Live Now'),
            const SizedBox(height: 12),
            _buildLiveNowCard(context, liveSession),
            const SizedBox(height: 24),
            _buildSectionTitle(context, 'Up Next'),
            const SizedBox(height: 12),
            ...upNextList.map(
              (session) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _buildSessionCard(context, session),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          child: const Icon(Icons.person),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome,', style: Theme.of(context).textTheme.bodyMedium),
            Text(
              'Dr. Dental',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            'LIVE',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(
        context,
      ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
    );
  }

  Widget _buildLiveNowCard(BuildContext context, Session session) {
    return Card(
      elevation: 4,
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.access_time, size: 16),
                const SizedBox(width: 4),
                Text(session.time),
                const Spacer(),
                const Icon(Icons.location_on, size: 16),
                const SizedBox(width: 4),
                Text(session.hall),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              session.title,
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const CircleAvatar(
                  radius: 12,
                  child: Icon(Icons.person, size: 12),
                ),
                const SizedBox(width: 8),
                Text(
                  session.speakerName,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSessionCard(BuildContext context, Session session) {
    return Card(
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondaryContainer,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(Icons.event_note),
        ),
        title: Text(
          session.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('${session.speakerName} • ${session.hall}'),
        trailing: Text(
          session.time,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }
}
