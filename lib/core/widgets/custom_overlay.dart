import 'package:aic_lll/core/themes/design_system.dart';
import 'package:aic_lll/main.dart';
import 'package:flutter/material.dart';

class CustomOverlay {
  final String message;
  final bool isSuccess;

  CustomOverlay.error(String message)
      : this(message: message, isSuccess: false);

  CustomOverlay.success(String message)
      : this(message: message, isSuccess: true);

  CustomOverlay({
    required this.message,
    required this.isSuccess,
  }) {
    final overlay = navigatorKey.currentState?.overlay;

    if (overlay == null) {
      debugPrint("Overlay não está disponível no momento.");
      return;
    }

    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).padding.top + 16,
        left: 0,
        right: 0,
        child: Material(
          color: Colors.transparent,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            constraints: const BoxConstraints(maxWidth: 300),
            decoration: BoxDecoration(
              color: isSuccess
                  ? DesignSystemColors.primaryBlue
                  : const Color.fromARGB(255, 177, 27, 16),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  color: Colors.white,
                  isSuccess ? Icons.check : Icons.error_outline,
                  size: 34,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    message,
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: overlayEntry.remove,
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    // Insere o OverlayEntry e remove após 3 segundos
    overlay.insert(overlayEntry);
    Future.delayed(const Duration(seconds: 3), () {
      if (overlayEntry.mounted) {
        overlayEntry.remove();
      }
    });
  }
}
