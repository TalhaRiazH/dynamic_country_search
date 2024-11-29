import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountryDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> country;

  const CountryDetailsScreen(this.country, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(country['name']['common']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(country['flags']['png'], width: 100),
            const SizedBox(height: 20),
            Text('Name: ${country['name']['common']}',
                style: const TextStyle(fontSize: 18)),
            Text('Region: ${country['region']}',
                style: const TextStyle(fontSize: 18)),
            Text('Population: ${country['population']}',
                style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
