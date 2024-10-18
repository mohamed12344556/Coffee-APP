import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildBanner extends StatelessWidget {
  const BuildBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 157,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.brown,
        borderRadius: BorderRadius.circular(15),
        image: const DecorationImage(
          image: AssetImage(
            'assets/images/Banner1.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 68,
            left: 15,
            right: 160,
            child: Container(
              height: 27,
              color: Colors.black.withOpacity(0.7),
            ),
          ),
          Positioned(
            top: 111,
            left: 15,
            right: 207,
            child: Container(
              height: 24,
              color: Colors.black.withOpacity(0.7),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xffED5151),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'Promo',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Buy one get\none FREE',
                  style: GoogleFonts.sora(
                    fontSize: 32,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}