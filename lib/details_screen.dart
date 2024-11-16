import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final dynamic movie;
  DetailsScreen({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          movie['name'] ?? 'Details',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                movie['image']?['original'] ?? '',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            Text(
              movie['name'] ?? 'No Title',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.star, color: Colors.yellow, size: 20),
                SizedBox(width: 4),
                Text(
                  movie['rating']?['average']?.toString() ?? 'N/A',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 12),
            Text(
              'Summary:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Text(
              movie['summary']?.replaceAll(RegExp(r'<[^>]*>'), '') ?? 'No summary available.',
              style: TextStyle(fontSize: 16, color: Colors.grey[400]),
            ),
            SizedBox(height: 16),
            movie['genres'] != null && movie['genres'].isNotEmpty
                ? Wrap(
                    spacing: 8,
                    children: movie['genres'].map<Widget>((genre) {
                      return Chip(
                        label: Text(
                          genre,
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.redAccent,
                      );
                    }).toList(),
                  )
                : Container(),
            SizedBox(height: 16),
            if (movie['language'] != null)
              Text(
                'Language: ${movie['language']}',
                style: TextStyle(fontSize: 16, color: Colors.grey[300]),
              ),
          ],
        ),
      ),
    );
  }
}
