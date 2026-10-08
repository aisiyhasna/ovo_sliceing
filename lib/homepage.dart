import 'package:flutter/material.dart';
import 'color.dart';
import 'ovo.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Data menu favorit (badge boleh dikosongkan dengan '')
  final List<Map<String, dynamic>> menu = const [
    {'icon': Icons.savings, 'nama': 'Nabung by\nSuperbank', 'warna': ungu, 'badge': 'BARU'},
    {'icon': Icons.request_quote, 'nama': 'Pinjaman', 'warna': ungu, 'badge': '100JT'},
    {'icon': Icons.credit_card, 'nama': 'Uang\nElektronik', 'warna': Colors.orange, 'badge': 'Rp 1'},
    {'icon': Icons.receipt_long, 'nama': 'Angsuran\nKredit', 'warna': Colors.pink, 'badge': ''},
    {'icon': Icons.phone_android, 'nama': 'Pulsa/Paket\nData', 'warna': biru, 'badge': 'PROMO'},
    {'icon': Icons.bolt, 'nama': 'PLN', 'warna': Colors.amber, 'badge': 'PROMO'},
    {'icon': Icons.water_drop, 'nama': 'Air PDAM', 'warna': Colors.lightBlue, 'badge': ''},
    {'icon': Icons.tv, 'nama': 'Internet &\nTV Kabel', 'warna': Colors.deepOrange, 'badge': ''},
  ];

  // Satu kartu info (ikon kiri, teks, tombol di kanan)
  Widget kartuInfo(String teks, String tombol) {
    return Container(
      margin: const EdgeInsets.only(right: 12, bottom: 6),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 24,
                backgroundColor: unguMuda,
                child: Icon(Icons.verified_user, color: ungu),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  teks,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const Spacer(),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ungu,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24),
              ),
              onPressed: () {},
              child: Text(tombol),
            ),
          ),
        ],
      ),
    );
  }

  // Satu item menu dengan badge merah di atasnya
  Widget itemMenu(Map<String, dynamic> item) {
    final String badge = item['badge'];
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            Container(
              width: 52,
              height: 52,
              margin: const EdgeInsets.only(top: 6),
              decoration: const BoxDecoration(
                color: abuMuda,
                shape: BoxShape.circle,
              ),
              child: Icon(item['icon'], color: item['warna']),
            ),
            if (badge != '')
              Positioned(
                top: 0,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                  decoration: BoxDecoration(
                    color: merah,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    badge,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          item['nama'],
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 11),
        ),
      ],
    );
  }

  Widget tab(String teks, bool aktif) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: aktif ? abuMuda : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        teks,
        style: TextStyle(
          color: aktif ? ungu : abuAbu,
          fontWeight: aktif ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bagian atas berwarna ungu muda
            Container(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [unguMuda, Color(0xFFD9D0F7)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: SafeArea(
                bottom: false,
                child: Column(
                  children: [
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'OVO',
                          style: TextStyle(
                            color: ungu,
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.white54,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.local_offer, color: ungu, size: 18),
                              SizedBox(width: 6),
                              Text(
                                'Promo',
                                style: TextStyle(
                                  color: ungu,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const OvoCard(),
                  ],
                ),
              ),
            ),

            // Kartu info yang bisa digeser ke samping
            Container(
             height: 150,
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: kartuInfo(
              'Yuk, lanjutin verifikasi! Upgrade ke OVO Premier cuma butuh hitungan menit!',
              'Verifikasi',
            ),
          ),

            // Tab kategori
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  tab('Favorit', true),
                  tab('Finansial', false),
                  tab('Hiburan', false),
                  tab('Pilihan Lain', false),
                ],
              ),
            ),
            const SizedBox(height: 8),

            // Grid menu
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: menu.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, i) => itemMenu(menu[i]),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
