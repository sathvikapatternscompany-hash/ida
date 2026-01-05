import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/session.dart';
import '../../shared/session_card.dart';

class ScheduleScreen extends ConsumerWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Mock Data
    final day1Sessions = [
      const Session(
        id: '1',
        title: 'Registration & Welcome',
        speakerName: 'Organizing Committee',
        time: '08:00 AM - 09:00 AM',
        hall: 'Lobby',
        description: 'Check-in',
      ),
      const Session(
        id: '2',
        title: 'Keynote Speech',
        speakerName: 'Dr. John Doe',
        time: '09:00 AM - 10:00 AM',
        hall: 'Main Hall',
        description: '',
      ),
      const Session(
        id: '3',
        title: 'Tea Break',
        speakerName: '-',
        time: '10:00 AM - 10:30 AM',
        hall: 'Cafeteria',
        description: '',
      ),
      const Session(
        id: '4',
        title: 'Panel Discussion',
        speakerName: 'Various Experts',
        time: '10:30 AM - 12:00 PM',
        hall: 'Main Hall',
        description: '',
      ),
    ];

    final day2Sessions = [
      const Session(
        id: '5',
        title: 'Workshop: Implants',
        speakerName: 'Dr. Jane Smith',
        time: '09:00 AM - 11:00 AM',
        hall: 'Workshop Hall',
        description: '',
      ),
      const Session(
        id: '6',
        title: 'Student Paper Presentation',
        speakerName: 'Students',
        time: '11:00 AM - 01:00 PM',
        hall: 'Hall B',
        description: '',
      ),
    ];

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Schedule'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Day 1'),
              Tab(text: 'Day 2'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              itemCount: day1Sessions.length,
              itemBuilder: (context, index) =>
                  SessionCard(session: day1Sessions[index]),
            ),
            ListView.builder(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              itemCount: day2Sessions.length,
              itemBuilder: (context, index) =>
                  SessionCard(session: day2Sessions[index]),
            ),
          ],
        ),
      ),
    );
  }
}
