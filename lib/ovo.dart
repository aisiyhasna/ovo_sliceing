import 'package:flutter/material.dart';
import 'color.dart';

// Kartu OVO Cash (saldo + tombol Top Up, Transfer, Tarik Tunai, History)
class OvoCard extends StatefulWidget {
  const OvoCard({super.key});

  @override
  State<OvoCard> createState() => _OvoCardState();
}

class _OvoCardState extends State<OvoCard> {
  bool saldoTerlihat = false;

  Widget tombol(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 26),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [ungu, unguGelap],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'OVO Cash',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Total Saldo',
            style: TextStyle(color: Colors.white70, fontSize: 12),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    saldoTerlihat = !saldoTerlihat;
                  });
                },
                child: Text(
                  saldoTerlihat ? 'Rp 150.000' : 'Tap untuk lihat',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'OVO Points >',
                  style: TextStyle(
                    color: ungu,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              tombol(Icons.add_circle, 'Top Up'),
              tombol(Icons.upload, 'Transfer'),
              tombol(Icons.download, 'Tarik Tunai'),
              tombol(Icons.list_alt, 'History'),
            ],
          ),
        ],
      ),
    );
  }
}
