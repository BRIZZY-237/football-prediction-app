
import 'package:flutter/material.dart';

void main() {
  runApp(const BrizzyApp());
}

class BrizzyApp extends StatelessWidget {
  const BrizzyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Brizzy Football',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF07140F),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00C878),
          brightness: Brightness.dark,
        ),
      ),
      home: const BrizzyHome(),
    );
  }
}

class BrizzyHome extends StatefulWidget {
  const BrizzyHome({super.key});

  @override
  State<BrizzyHome> createState() => _BrizzyHomeState();
}

class _BrizzyHomeState extends State<BrizzyHome> {
  int selectedPage = 0;
  String selectedMarket = '1X2';

  final List<String> markets = [
    '1X2',
    'Correct Score',
    'BTTS',
    'Over 1.5',
    'Over 2.5',
    'Over 3.5',
    'Over 4.5',
    'Under 1.5',
    'Under 2.5',
    'Under 3.5',
    'Under 4.5',
    'First Half',
    'Second Half',
    'Corners',
    'Yellow Cards',
    'Red Cards',
  ];

  Widget sectionTitle(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(height: 4),
          Text(subtitle,
              style: const TextStyle(
                color: Colors.white60,
                fontSize: 12,
              )),
        ],
      ),
    );
  }

  Widget categoryCard(
      String title, String description, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
          color: const Color(0xFF12251B),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: color.withOpacity(0.4)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 27),
            const SizedBox(height: 12),
            Text(title,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 15)),
            const SizedBox(height: 5),
            Text(description,
                style: const TextStyle(
                    fontSize: 11, color: Colors.white60)),
          ],
        ),
      ),
    );
  }

  Widget marketSelector() {
    return Wrap(
      spacing: 8,
      runSpacing: 9,
      children: markets.map((market) {
        final selected = selectedMarket == market;
        return ChoiceChip(
          label: Text(market),
          selected: selected,
          onSelected: (_) {
            setState(() => selectedMarket = market);
          },
          selectedColor: const Color(0xFF00A968),
          backgroundColor: const Color(0xFF17251E),
        );
      }).toList(),
    );
  }

  Widget matchCard(String home, String away, String time) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFF12251B),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.sports_soccer,
                  color: Color(0xFF00D783), size: 22),
              const SizedBox(width: 9),
              const Text('DEMO FIXTURE',
                  style: TextStyle(
                      color: Color(0xFF00D783),
                      fontWeight: FontWeight.bold,
                      fontSize: 11)),
              const Spacer(),
              Text(time,
                  style: const TextStyle(
                      color: Colors.white70, fontSize: 12)),
            ],
          ),
          const Divider(color: Colors.white12, height: 24),
          Row(
            children: [
              Expanded(
                child: Text(home,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              const Text('VS',
                  style: TextStyle(
                      color: Colors.white54,
                      fontWeight: FontWeight.bold)),
              Expanded(
                child: Text(away,
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              const Icon(Icons.analytics_outlined,
                  color: Color(0xFF00D783), size: 18),
              const SizedBox(width: 7),
              Expanded(
                child: Text(
                  'Selected market: $selectedMarket',
                  style: const TextStyle(fontSize: 12),
                ),
              ),
              const Text('Analysis pending',
                  style: TextStyle(
                      color: Colors.orangeAccent, fontSize: 11)),
            ],
          ),
        ],
      ),
    );
  }

  Widget dashboard() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
    Padding(
  padding: const EdgeInsets.only(bottom: 16),
  child: Container(
    width: double.infinity,
    padding: const EdgeInsets.all(18),
    decoration: BoxDecoration(
      color: const Color(0xFF14251D),
      borderRadius: BorderRadius.circular(18),
      border: Border.all(
        color: const Color(0xFFFFC44D),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(
              Icons.sports_esports,
              color: Color(0xFFFFC44D),
              size: 28,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                'FIFA CORRECT SCORES',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFC44D),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        const Text(
          'FIFA MATCH CENTRE',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          'Match listings, recorded scores, '
          'historical results and score analysis.',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'FIFA score data will appear here '
          'when connected to a data source.',
          style: TextStyle(
            color: Colors.lightGreenAccent,
            fontSize: 12,
          ),
        ),
      ],
    ),
  ),
),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF087C48), Color(0xFF10251A)],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('WELCOME TO',
                    style: TextStyle(
                        color: Colors.white70, letterSpacing: 2)),
                SizedBox(height: 7),
                Text('BRIZZY FOOTBALL',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900)),
                Text('SMART FOOTBALL ANALYSIS',
                    style: TextStyle(
                        color: Colors.white70, fontSize: 11)),
                SizedBox(height: 18),
                Row(
                  children: [
                    Icon(Icons.bolt, color: Colors.yellowAccent),
                    SizedBox(width: 6),
                    Text('Your football analysis centre'),
                  ],
                ),
              ],
            ),
          ),

          sectionTitle('Prediction Sections', 'Explore Brizzy predictions'),

          Row(
            children: [
              categoryCard('GENERAL', 'Free analysis',
                  Icons.public, Colors.lightGreenAccent),
              const SizedBox(width: 10),
              categoryCard('VIP', 'Premium section',
                  Icons.workspace_premium, Colors.amber),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: const Color(0xFF12251B),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Row(
              children: [
                Icon(Icons.sports_esports,
                    color: Colors.lightBlueAccent, size: 30),
                SizedBox(width: 14),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('FIFA PREDICTIONS',
                        style: TextStyle(
                            fontWeight: FontWeight.bold)),
                    Text('Separate FIFA match analysis',
                        style: TextStyle(
                            fontSize: 12, color: Colors.white60)),
                  ],
                ),
              ],
            ),
          ),

          sectionTitle('Prediction Markets',
              'Choose the market you want to analyse'),
          marketSelector(),

          sectionTitle('Upcoming Matches',
              'Illustration only • Not live fixtures'),

          matchCard('Team Alpha', 'Team Beta',
              'Cameroon time • Demo'),
          matchCard('Team Gamma', 'Team Delta',
              'Cameroon time • Demo'),

          const SizedBox(height: 20),
          const Center(
            child: Text(
              'BRIZZY FOOTBALL © 2026',
              style: TextStyle(
                  color: Colors.white38,
                  letterSpacing: 2,
                  fontSize: 11),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget otherPage(String title, IconData icon, String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 65, color: const Color(0xFF00D783)),
          const SizedBox(height: 15),
          Text(title,
              style: const TextStyle(
                  fontSize: 23, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(message,
              style: const TextStyle(color: Colors.white60)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      dashboard(),
      otherPage('Fixtures', Icons.calendar_month,
          'Upcoming match centre'),
      otherPage('Markets', Icons.analytics,
          'Football prediction markets'),
      otherPage('Profile', Icons.person,
          'Brizzy user profile'),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF07140F),
        title: const Row(
          children: [
            Icon(Icons.sports_soccer,
                color: Color(0xFF00D783)),
            SizedBox(width: 9),
            Text('BRIZZY',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2)),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.notifications_none),
          ),
        ],
      ),
      body: pages[selectedPage],
      bottomNavigationBar: NavigationBar(
        backgroundColor: const Color(0xFF102019),
        selectedIndex: selectedPage,
        indicatorColor: const Color(0xFF087C48),
        onDestinationSelected: (index) {
          setState(() => selectedPage = index);
        },
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.home_outlined),
              label: 'Home'),
          NavigationDestination(
              icon: Icon(Icons.calendar_month),
              label: 'Fixtures'),
          NavigationDestination(
              icon: Icon(Icons.analytics_outlined),
              label: 'Markets'),
          NavigationDestination(
              icon: Icon(Icons.person_outline),
              label: 'Profile'),
        ],
      ),
    );
  }
}
