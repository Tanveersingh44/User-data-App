import 'package:flutter/material.dart';
import '../models/user.dart';

class DetailScreen extends StatelessWidget {
  final User user;
  const DetailScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final address = user.address;
    final company = user.company;

    String formatAddress(Map<String, dynamic> a) {
      final street = a['street'] ?? '';
      final suite = a['suite'] ?? '';
      final city = a['city'] ?? '';
      final zipcode = a['zipcode'] ?? '';
      return [street, suite, city, zipcode]
          .where((s) => s.toString().isNotEmpty)
          .join(', ');
    }

    return Scaffold(
      backgroundColor: Colors.blue.shade300.withOpacity(0.5),
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300.withOpacity(0.2),
        centerTitle: true,
        title: Text(
          user.name,
          style: TextStyle(
            color: Colors.white.withOpacity(0.9),
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.all(35),
        decoration: BoxDecoration(
          color: Colors.blue.shade300.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 10,
              spreadRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
          border: Border.all(color: Colors.blue, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(17.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      child: Text(
                        user.name.substring(0, 1).toUpperCase(),
                        style: const TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.name,
                            style: const TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            user.email,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            user.phone,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 24),
                const Text(
                  'Website',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Text(
                  user.website,
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Address',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Text(
                  formatAddress(address),
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Company',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Text(
                  company['name'] ?? '',
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
