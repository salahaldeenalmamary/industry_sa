import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../routes/app_pages.dart';
import '../../providers.dart';



class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  bool _isNavigated = false;

 

  @override
  Widget build(BuildContext context) {
    final appConfigFuture = ref.watch(appConfigFutureProvider);

    return Scaffold(
      body: Center(
        child: appConfigFuture.when(
          loading: () => const CircularProgressIndicator(),
          error: (error, _) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Error: $error',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.red, fontSize: 16),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.refresh(appConfigFutureProvider),
                child: const Text('Retry'),
              ),
            ],
          ),
          data: (_) {
            if (!_isNavigated) {
              // Only navigate once
              _isNavigated = true;
              // Delay navigation to give the splash screen time to be visible
              Future.delayed(const Duration(seconds: 2), () {
                if (context.mounted) {
                  Navigator.of(context).pushReplacementNamed(RoutePaths.main);
                }
              });
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
