import 'package:flutter/material.dart';

class CustomSnackbar {
  /// Snackbar to show error messages
  static SnackBar buildErrorSnackBar({
    required final String errorString,
    final int errorDuration = 10,
  }) {
    return SnackBar(
      duration: Duration(seconds: errorDuration),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            height: 90,
            decoration: const BoxDecoration(
              color: Color(0xFFC72C41),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Row(
              children: [
                const SizedBox(width: 30),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Oops!",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        errorString,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style:
                            const TextStyle(fontSize: 11, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
            top: 20,
            left: 7,
            child: CircleAvatar(
              backgroundColor: Color(0xFF801336),
              radius: 5,
            ),
          ),
          const Positioned(
            bottom: 30,
            left: 15,
            child: CircleAvatar(
              backgroundColor: Color(0xFF801336),
              radius: 7,
            ),
          ),
          const Positioned(
            bottom: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
              child: CircleAvatar(
                backgroundColor: Color(0xFF801336),
                radius: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
