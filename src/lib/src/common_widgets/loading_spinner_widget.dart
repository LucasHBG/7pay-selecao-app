import 'package:flutter/material.dart';

class LoadingSpinnerWidget extends StatelessWidget {
  const LoadingSpinnerWidget({super.key, vertical});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        strokeWidth: 2,
        color: Colors.white,
      ),
    );
  }
}
