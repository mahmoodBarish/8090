import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart'; // Import go_router

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            // Image frame height 536px from Figma, scale proportionally
            height: screenHeight * (536 / 812),
            child: Image.asset(
              'assets/images/I142_500_417_719.png',
              fit: BoxFit.cover,
            ),
          ),

          // Bottom Content Container with Gradient, Text, and Button
          Positioned(
            left: 0,
            right: 0,
            // Container starts at y=452, so its height is 812 - 452 = 360px
            height: screenHeight * (360 / 812),
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFF050505).withOpacity(0.0), // Transparent black
                    const Color(0xFF050505), // Opaque black
                  ],
                  // Gradient stops from Figma for smooth transition
                  stops: const [0.0, 0.23670603334903717],
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * (24 / 375)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end, // Align children to the bottom
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Fall in Love with Coffee in Blissful Delight!',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.sora(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w600, // Sora-SemiBold
                        letterSpacing: 0.16,
                        height: 48 / 32, // Line height 48px from Figma
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02), // Responsive spacing
                    Text(
                      'Welcome to our cozy coffee corner, where every cup is a delightful for you.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.sora(
                        color: const Color(0xFFA9A9A9), // Color from Figma
                        fontSize: 14,
                        fontWeight: FontWeight.w400, // Sora-Regular
                        letterSpacing: 0.14,
                        height: 21 / 14, // Line height 21px from Figma
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.05), // Responsive spacing before button
                    SizedBox(
                      width: double.infinity,
                      height: 56, // Fixed button height from Figma
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigate to the home screen using go_router
                          context.go('/home');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFC67C4E), // Button color from Figma
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16), // Corner radius from Figma
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                        ),
                        child: Text(
                          'Get Started',
                          style: GoogleFonts.sora(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600, // Sora-SemiBold
                            height: 24 / 16, // Line height 24px from Figma
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.05), // Bottom padding
                  ],
                ),
              ),
            ),
          ),

          // Custom Status Bar (Figma Iphone Time component)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: screenHeight * (44 / 812), // Height 44px from Figma
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * (24 / 375)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '9:41',
                    style: GoogleFonts.sora(
                      color: Colors.white,
                      fontSize: 15, // Inferred standard iOS status bar time size
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    children: [
                      // Standard Flutter icons for responsiveness
                      const Icon(Icons.signal_cellular_alt, color: Colors.white, size: 18),
                      SizedBox(width: screenWidth * (4 / 375)),
                      const Icon(Icons.wifi, color: Colors.white, size: 18),
                      SizedBox(width: screenWidth * (4 / 375)),
                      const Icon(Icons.battery_full, color: Colors.white, size: 18),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Custom Home Indicator (Figma Iphone Home Indicator component)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: screenHeight * (34 / 812), // Height 34px from Figma
            child: Center(
              child: Container(
                width: screenWidth * (134 / 375), // Width 134px from Figma
                height: screenHeight * (5 / 812), // Height 5px from Figma
                decoration: BoxDecoration(
                  color: const Color(0xFF242424), // Color from Figma
                  borderRadius: BorderRadius.circular(100), // Highly rounded corners
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}