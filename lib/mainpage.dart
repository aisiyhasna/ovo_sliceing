import 'package:flutter/material.dart';
import 'color.dart';
import 'homepage.dart';
import 'profilepage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;

  // Daftar halaman sesuai urutan menu bawah
  final List<Widget> halaman = [
    const HomePage(),
    const Center(child: Text('Halaman Finance')),
    const Center(child: Text('Halaman Pay (QRIS)')),
    const Center(child: Text('Halaman Inbox')),
    const ProfilePage(),
  ];

  // Item menu bawah biasa
  Widget itemMenu(IconData icon, String label, int i) {
    final bool aktif = index == i;
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            index = i;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: aktif ? ungu : abuAbu),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                color: aktif ? ungu : abuAbu,
                fontWeight: aktif ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Tombol tengah QRIS
  Widget tombolPay() {
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            index = 2;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 46,
              height: 46,
              decoration: const BoxDecoration(
               shape: BoxShape.circle,
                color: ungu, 
              ),
              child: const Center(
                child: Text(
                  'QRIS',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 2),
            Text(
              'Pay',
              style: TextStyle(
                fontSize: 11,
                color: index == 2 ? ungu : abuAbu,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: halaman[index],
      bottomNavigationBar: Container(
        height: 70,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
        ),
        child: Row(
          children: [
            itemMenu(Icons.home, 'Home', 0),
            itemMenu(Icons.payments, 'Finance', 1),
            tombolPay(),
            itemMenu(Icons.notifications, 'Inbox', 3),
            itemMenu(Icons.person, 'Profile', 4),
          ],
        ),
      ),
    );
  }
}
