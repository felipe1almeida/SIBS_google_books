import 'package:flutter/material.dart';

class LoadingProgress extends StatelessWidget {
  final bool _isLoading;

  const LoadingProgress({super.key, required bool isLoading}) : _isLoading = isLoading;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _isLoading,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
