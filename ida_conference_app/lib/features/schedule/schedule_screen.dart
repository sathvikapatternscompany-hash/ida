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
        title: 'Registrations & Delegate Kit Collection',
        speakerName: 'Organizing Committee',
        time: '09:00 AM - 10:00 AM',
        hall: 'Lobby',
        description: 'Check-in and delegate kit collection',
      ),
      const Session(
        id: '2',
        title: 'Hands-On Workshops (Endodontics / Prosthodontics / Lasers)',
        speakerName: 'Workshop Instructors',
        time: '09:30 AM - 11:00 AM',
        hall: 'Workshop Halls',
        description: 'Practical hands-on sessions',
      ),
      const Session(
        id: '3',
        title: 'Inauguration Ceremony',
        speakerName: 'Chief Guests',
        time: '10:00 AM - 11:00 AM',
        hall: 'Main Hall',
        description: 'Official conference inauguration',
      ),
      const Session(
        id: '4',
        title: 'Keynote Lecture – Emerging Trends in Dentistry',
        speakerName: 'Keynote Speaker',
        time: '11:30 AM - 01:00 PM',
        hall: 'Main Hall',
        description: 'Exploring the future of dental practice',
      ),
      const Session(
        id: '5',
        title: 'Scientific Paper & Poster Presentations',
        speakerName: 'Researchers',
        time: '02:00 PM - 05:00 PM',
        hall: 'Conference Halls',
        description: 'Academic presentations and research posters',
      ),
      const Session(
        id: '6',
        title: 'Banquet Dinner & Cultural Night',
        speakerName: 'All Participants',
        time: '08:00 PM - 11:00 PM',
        hall: 'Banquet Hall',
        description: 'Evening entertainment and dinner',
      ),
    ];

    final day2Sessions = [
      const Session(
        id: '7',
        title: 'Scientific Sessions – Expert Speakers',
        speakerName: 'Expert Speakers',
        time: '11:30 AM - 01:00 PM',
        hall: 'Main Hall',
        description: 'Expert lectures on advanced dental topics',
      ),
      const Session(
        id: '8',
        title: 'Panel Discussion – Future of Dental Practice',
        speakerName: 'Panel of Experts',
        time: '02:00 PM - 03:30 PM',
        hall: 'Main Hall',
        description: 'Discussion on future trends and challenges',
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
