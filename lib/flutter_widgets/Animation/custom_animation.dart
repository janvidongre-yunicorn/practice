import 'package:flutter/material.dart';

class SplashToHome extends StatefulWidget {
  const SplashToHome({super.key});

  @override
  State<SplashToHome> createState() => _SplashToHomeState();
}

class _SplashToHomeState extends State<SplashToHome>
    with TickerProviderStateMixin {
  late AnimationController _logoController;
  late AnimationController _fadeController;

  late Animation<Offset> _moveAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Logo movement + scale controller
    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _moveAnimation = Tween<Offset>(
      begin: Offset.zero, // Center
      end: const Offset(-1.5, -2), // Move towards top-left
    ).animate(CurvedAnimation(
      parent: _logoController,
      curve: Curves.easeInOut,
    ));

    _scaleAnimation = Tween<double>(
      begin: 1.5, // Bigger in splash
      end: 0.6, // Smaller in top-left
    ).animate(CurvedAnimation(
      parent: _logoController,
      curve: Curves.easeInOut,
    ));

    // Fade controller for next screen
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    ));

    // Run animations sequentially
    _logoController.forward().then((_) {
      _fadeController.forward();
    });
  }

  @override
  void dispose() {
    _logoController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background content with fade
          FadeTransition(
            opacity: _fadeAnimation,
            child: _buildHomeContent(),
          ),

          // Splash logo + text
          SlideTransition(
            position: _moveAnimation,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.auto_awesome, size: 60, color: Colors.purple),
                  SizedBox(width: 12),
                  Text(
                    "Yunicorn",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Example Home Content
  Widget _buildHomeContent() {
    return Column(
      children: [
        const SizedBox(height: 80),
        // Carousel simulation
        SizedBox(
          height: 200,
          child: PageView(
            children: [
              _carouselItem("Welcome to Yunicorn 🚀", Colors.blue),
              _carouselItem("Explore Amazing Features 🌟", Colors.green),
              _carouselItem("Let’s Get Started!", Colors.orange),
            ],
          ),
        ),
        const SizedBox(height: 20),
        // Some List
        Expanded(
          child: ListView.builder(
            itemCount: 6,
            itemBuilder: (context, index) {
              return ListTile(
                leading: const Icon(Icons.star, color: Colors.purple),
                title: Text("Feature #${index + 1}"),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _carouselItem(String text, Color color) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
