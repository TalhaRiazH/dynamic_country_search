import 'package:dynamic_country_search/statemanagment/CountryProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'country_detail_screen.dart';

class CountrySearchScreen extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  CountrySearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CountryProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Country Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search for a country...',
                prefixIcon: Icon(Icons.search, color: Colors.grey[700]),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                Future.delayed(const Duration(milliseconds: 300), () {
                  provider.searchCountries(value.trim());
                });
              },
            ),

            const SizedBox(height: 20),
            if (provider.isLoading)
              const CircularProgressIndicator()
            else if (provider.errorMessage.isNotEmpty)
              Text(provider.errorMessage, style: const TextStyle(color: Colors.red))
            else if (provider.countries.isEmpty)
              const Text('No countries found.')
            else
              Expanded(
                child: ListView.builder(
                  itemCount: provider.countries.length,
                  itemBuilder: (context, index) {
                    final country = provider.countries[index];
                    return ListTile(
                      leading: Image.network(
                        country['flags']['png'],
                        width: 50,
                      ),
                      title: Text(country['name']['common']),
                      subtitle: Text(country['region']),
                      onTap: () {
                        // Navigate to details
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => CountryDetailsScreen(country),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}

