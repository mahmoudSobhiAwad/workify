import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBody extends StatelessWidget {
  const ShimmerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      gradient: LinearGradient(colors: [
        Colors.grey[100]!,
        Colors.grey[300]!,
      ]),
      child: Column(
        spacing: 10,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                spacing: 12,
                children: [
                  // Company Logo Placeholder
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey[300],
                        radius: 50,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Company Name Placeholder
                  Container(
                    width: 150,
                    height: 20,
                    color: Colors.grey[300],
                  ),
                  const SizedBox(height: 20),

                  // Work Location Placeholder
                  Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 100,
                        height: 16,
                        color: Colors.grey[300],
                      ),
                      const SizedBox(height: 8),
                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Start and End Time Placeholder
                  Row(
                    spacing: 24,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Holiday Calendar Placeholder
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Edit Button Placeholder
          Container(
            margin: const EdgeInsets.all(16),
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }
}
