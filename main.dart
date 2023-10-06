import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/detail': (context) => DetailMatchScreen(),
      },
    );
  }
}

//PEMBUATAN KELAS HOMESCREEN
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info Bola'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: BolaInfoScreen(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

//UNTUK TAMPILAN ISI PADA HOME SCREEN
class BolaInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hi Obin!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              hintText: 'Cari pertandingan...',
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (value) {},
          ),
          SizedBox(height: 16),
          Text(
            'Match yang Sedang Berlangsung',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          JadwalPertandingan(
            tanggal: '06-10-2023',
            timA: 'Manchester City',
            skor: '1 - 0',
            timB: 'Liverpool',
            liga: 'Premier League',
            pencetakGol: 'Obin',
            logoTimA: 'assets/Mancy.png',
            logoTimB: 'assets/liv.png',
          ),
          SizedBox(height: 16),
          Text(
            'Match yang Sudah Selesai',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          MatchSudahSelesai(
            matchInfo: MatchInfo(
              tanggal: '04-10-2023',
              timA: 'Barcelona',
              skor: '3 - 0',
              timB: 'Real Madrid',
              liga: 'La Liga',
              pencetakGol: 'Lionel Messi',
              status: 'Selesai',
              totalShotsA: 15,
              totalShotsOnTargetA: 8,
              possessionA: 60,
              totalShotsB: 10,
              totalShotsOnTargetB: 5,
              possessionB: 40,
              topPlayerA: 'Lionel Messi',
              topPlayerB: 'Karim Benzema',
            ),
            onTap: () {
              Navigator.pushNamed(context, '/detail',
                  arguments: MatchInfo(
                    tanggal: '04-10-2023',
                    timA: 'Barcelona',
                    skor: '3 - 0',
                    timB: 'Real Madrid',
                    liga: 'La Liga',
                    pencetakGol: 'Lionel Messi',
                    status: 'Selesai',
                    totalShotsA: 15,
                    totalShotsOnTargetA: 8,
                    possessionA: 60,
                    totalShotsB: 10,
                    totalShotsOnTargetB: 5,
                    possessionB: 40,
                    topPlayerA: 'Lionel Messi',
                    topPlayerB: 'Karim Benzema',
                  ));
            },
          ),
        ],
      ),
    );
  }
}

//DETAIL SCREEN KETIKA MENGKLIK MATCH YANG SUDAH SELESAI
class DetailMatchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MatchInfo match =
        ModalRoute.of(context)!.settings.arguments as MatchInfo;

    if (match.status == 'Selesai') {
      return Scaffold(
        appBar: AppBar(
          title: Text('Detail Match'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${match.timA} vs ${match.timB}',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'Score: ${match.skor}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'Top Player: ${match.pencetakGol}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              Text(
                'Total Shots: ${match.totalShotsA + match.totalShotsB}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              Text(
                'Shots on Target: ${match.totalShotsOnTargetA + match.totalShotsOnTargetB}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              Text(
                'Possession: ${match.possessionA}% - ${match.possessionB}%',
                style: TextStyle(fontSize: 18),
              ),
              // Informasi tambahan
              SizedBox(height: 16),
              Text(
                'Top Player Tim A: ${match.topPlayerA}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              Text(
                'Total Shots Tim A: ${match.totalShotsA}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              Text(
                'Shots on Target Tim A: ${match.totalShotsOnTargetA}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              Text(
                'Possession Tim A: ${match.possessionA}%',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              Text(
                'Top Player Tim B: ${match.topPlayerB}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              Text(
                'Total Shots Tim B: ${match.totalShotsB}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              Text(
                'Shots on Target Tim B: ${match.totalShotsOnTargetB}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              Text(
                'Possession Tim B: ${match.possessionB}%',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('Detail Match'),
        ),
        body: Center(
          child: Text(
              'Detail match hanya dapat dilihat untuk pertandingan yang sudah selesai.'),
        ),
      );
    }
  }
}

//JADWAL PERTANDINGAN
class JadwalPertandingan extends StatelessWidget {
  final String tanggal;
  final String timA;
  final String skor;
  final String timB;
  final String liga;
  final String pencetakGol;
  final String logoTimA;
  final String logoTimB;

  JadwalPertandingan({
    required this.tanggal,
    required this.timA,
    required this.skor,
    required this.timB,
    required this.liga,
    required this.pencetakGol,
    required this.logoTimA,
    required this.logoTimB,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/Mancy.png',
              width: 40,
              height: 40,
            ),
            Text(
              '$timA',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '$skor',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                SizedBox(height: 8),
                Text(
                  'Liga: $liga',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'Tanggal: $tanggal',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'Pencetak Gol: $pencetakGol',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Text(
              '$timB',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Image.asset(
              'assets/liv.png', // Ubah sesuai path logo Tim B
              width: 40,
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}

class MatchSudahSelesai extends StatelessWidget {
  final MatchInfo matchInfo;
  final VoidCallback onTap;

  MatchSudahSelesai({
    required this.matchInfo,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2.0,
        margin: EdgeInsets.symmetric(vertical: 8.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/barca.png', // Ubah sesuai path logo Tim A
                width: 40,
                height: 40,
              ),
              Text(
                '${matchInfo.timA}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${matchInfo.skor}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Liga: ${matchInfo.liga}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Tanggal: ${matchInfo.tanggal}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Pencetak Gol: ${matchInfo.pencetakGol}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Text(
                '${matchInfo.timB}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Image.asset(
                'assets/rema.png',
                width: 40,
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//UNTUK MENAMPILKAN INFO PADA BAGIAN DETAIL MATCH
class MatchInfo {
  final String tanggal;
  final String timA;
  final String skor;
  final String timB;
  final String liga;
  final String pencetakGol;
  final String status;
  final int totalShotsA;
  final int totalShotsOnTargetA;
  final int possessionA;
  final int totalShotsB;
  final int totalShotsOnTargetB;
  final int possessionB;
  final String topPlayerA;
  final String topPlayerB;

  MatchInfo({
    required this.tanggal,
    required this.timA,
    required this.skor,
    required this.timB,
    required this.liga,
    required this.pencetakGol,
    required this.status,
    required this.totalShotsA,
    required this.totalShotsOnTargetA,
    required this.possessionA,
    required this.totalShotsB,
    required this.totalShotsOnTargetB,
    required this.possessionB,
    required this.topPlayerA,
    required this.topPlayerB,
  });
}

class MatchItem extends StatelessWidget {
  final String tanggal;
  final String timA;
  final String skor;
  final String timB;
  final String liga;
  final String pencetakGol;
  final String status;

  MatchItem({
    required this.tanggal,
    required this.timA,
    required this.skor,
    required this.timB,
    required this.liga,
    required this.pencetakGol,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$timA',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '$skor',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                SizedBox(height: 8),
                Text(
                  'Liga: $liga',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'Tanggal: $tanggal',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'Pencetak Gol: $pencetakGol',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'Status: $status',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Text(
              '$timB',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

  }
}
