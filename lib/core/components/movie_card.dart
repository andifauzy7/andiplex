import 'package:andiplex/core/util/constants.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String? image;
  final String? title;
  final VoidCallback onTap;
  const MovieCard({
    super.key,
    required this.image,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.fromLTRB(4, 8, 4, 8),
        width: 120,
        child: Column(
          children: [
            Image.network(
              Constants.movieApi.endpointImage + (image ?? ''),
              fit: BoxFit.fitHeight,
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              title ?? '',
              maxLines: 2,
            )
          ],
        ),
      ),
    );
  }
}
