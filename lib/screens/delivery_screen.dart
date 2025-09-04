import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart'; // Import go_router

class DeliveryScreen extends StatefulWidget {
  const DeliveryScreen({super.key});

  @override
  State<DeliveryScreen> createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  // Define colors based on Figma JSON values
  final Color primaryDarkColor = const Color.fromRGBO(36, 36, 36, 1);
  final Color mediumGreyColor = const Color.fromRGBO(162, 162, 162, 1);
  final Color lightGreyColor = const Color.fromRGBO(227, 227, 227, 1);
  final Color veryLightGreyColor = const Color.fromRGBO(237, 237, 237, 1);
  final Color accentOrangeColor = const Color.fromRGBO(198, 124, 78, 1);
  final Color accentGreenColor = const Color.fromRGBO(54, 192, 126, 1);
  final Color whiteColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Maps (background image) - 142:198
          Positioned.fill(
            child: Image.asset(
              'assets/images/142_198.png',
              fit: BoxFit.cover,
            ),
          ),

          // Top section: Status bar and Delivery Info header
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.0426), // 16px on 375px screen
                child: Column(
                  children: [
                    SizedBox(height: screenHeight * 0.012), // Spacing for status bar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Back Button - 142:234
                        GestureDetector(
                          onTap: () {
                            context.pop(); // Use context.pop() for back navigation
                          },
                          child: Container(
                            width: screenWidth * 0.117, // 44px
                            height: screenWidth * 0.117, // 44px
                            decoration: BoxDecoration(
                              color: veryLightGreyColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              color: primaryDarkColor,
                              size: screenWidth * 0.04, // 15px-16px
                            ),
                          ),
                        ),
                        // Screen Title (Inferred from screen name "High-Fidelity ( Delivery )")
                        Text(
                          'Delivery',
                          style: GoogleFonts.sora(
                            fontSize: 16,
                            fontWeight: FontWeight.w600, // SemiBold
                            color: primaryDarkColor,
                          ),
                        ),
                        // GPS Icon Button - 142:237
                        Container(
                          width: screenWidth * 0.117, // 44px
                          height: screenWidth * 0.117, // 44px
                          decoration: BoxDecoration(
                            color: veryLightGreyColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            Icons.gps_fixed, // Closest match for "gps"
                            color: primaryDarkColor,
                            size: screenWidth * 0.05, // 20px
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Driver Location (on map) - 142:231
          Positioned(
            right: screenWidth * 0.037, // Adjusted right based on Figma bbox (1628+375-1861 = 142)
            top: screenHeight * 0.383, // 311px on 812px screen
            child: Container(
              padding: EdgeInsets.all(screenWidth * 0.021), // 8px
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.25),
                    spreadRadius: 0,
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Image.asset(
                'assets/images/I142_232_418_950.png', // Custom bike icon
                width: screenWidth * 0.064, // 24px
                height: screenWidth * 0.064, // 24px
                fit: BoxFit.contain,
              ),
            ),
          ),

          // Delivery Location marker - 142:224
          Positioned(
            left: screenWidth * 0.18, // Adjusted left for visual placement
            top: screenHeight * 0.259, // 211px on 812px screen
            child: Icon(
              Icons.location_on, // Closest match for "Location"
              color: accentOrangeColor,
              size: screenWidth * 0.08, // 30px
            ),
          ),

          // Detail Driver (bottom sheet) - 142:199
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: screenWidth,
              height: screenHeight * 0.396, // 322px on 812px screen
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.053), // 20px
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: screenHeight * 0.0197), // 16px
                    // Indicator - 142:223
                    Container(
                      width: screenWidth * 0.12, // 45px
                      height: screenHeight * 0.006, // 5px
                      decoration: BoxDecoration(
                        color: lightGreyColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.0197), // 16px
                    // 10 minutes left & Delivery to Jl. Kpg Sutoyo - 142:215
                    Column(
                      children: [
                        Text(
                          '10 minutes left',
                          style: GoogleFonts.sora(
                            fontSize: 16,
                            fontWeight: FontWeight.w600, // SemiBold
                            color: primaryDarkColor,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.0024), // 2px
                        Text.rich(
                          TextSpan(
                            text: 'Delivery to ',
                            style: GoogleFonts.sora(
                              fontSize: 12,
                              fontWeight: FontWeight.w400, // Regular
                              color: mediumGreyColor,
                              height: 1.5, // To match 18px line height for 12px font size
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Jl. Kpg Sutoyo',
                                style: GoogleFonts.sora(
                                  fontWeight: FontWeight.w600, // SemiBold
                                  color: primaryDarkColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.0246), // 20px gap
                    // Progress Bar - 142:218
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildProgressBarSegment(accentGreenColor, screenWidth), // 142:219
                        SizedBox(width: screenWidth * 0.026), // 10px
                        _buildProgressBarSegment(accentGreenColor, screenWidth), // 142:220
                        SizedBox(width: screenWidth * 0.026), // 10px
                        _buildProgressBarSegment(accentGreenColor, screenWidth), // 142:221
                        SizedBox(width: screenWidth * 0.026), // 10px
                        _buildProgressBarSegment(lightGreyColor, screenWidth), // 142:222
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.0345), // 28px gap
                    // Delivery Status and Text - 142:209
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.0098, // 8px
                          horizontal: screenWidth * 0.0426 // 16px
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: lightGreyColor, width: 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          // Deliver Icon Container - 142:210
                          Container(
                            width: screenWidth * 0.149, // 56px
                            height: screenWidth * 0.149, // 56px
                            decoration: BoxDecoration(
                              border: Border.all(color: lightGreyColor, width: 1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Image.asset(
                                'assets/images/I142_211_418_950.png', // Custom motorbike icon
                                width: screenWidth * 0.073, // 27.5px
                                height: screenWidth * 0.073, // 27.5px
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.0426), // 16px
                          // Text - 142:212
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Delivered your order',
                                  style: GoogleFonts.sora(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600, // SemiBold
                                    color: primaryDarkColor,
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.0049), // 4px
                                Text(
                                  'We will deliver your goods to you in\nthe shortes possible time.',
                                  style: GoogleFonts.sora(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300, // Light
                                    color: mediumGreyColor,
                                    height: 1.5, // To match 18px line height for 12px font size
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.0246), // 20px gap
                    // Driver Profile & Call - 142:200
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Driver Profile - 142:201
                        Row(
                          children: [
                            // Driver Image - 142:203
                            Container(
                              width: screenWidth * 0.149, // 56px
                              height: screenWidth * 0.149, // 56px
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                image: const DecorationImage(
                                  image: AssetImage('assets/images/142_203.png'), // Driver profile image
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: screenWidth * 0.0426), // 16px
                            // Driver Name and Role - 142:204
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Brooklyn Simmons',
                                  style: GoogleFonts.sora(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600, // SemiBold
                                    color: primaryDarkColor,
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.0049), // 4px
                                Text(
                                  'Personal Courier',
                                  style: GoogleFonts.sora(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400, // Regular
                                    color: mediumGreyColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        // Call Button - 142:207
                        GestureDetector(
                          onTap: () {
                            // Placeholder for call functionality
                            debugPrint('Calling Brooklyn Simmons...');
                          },
                          child: Container(
                            width: screenWidth * 0.117, // 44px
                            height: screenWidth * 0.117, // 44px
                            decoration: BoxDecoration(
                              border: Border.all(color: lightGreyColor, width: 1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              Icons.call_outlined, // Closest match for "Calling"
                              color: primaryDarkColor,
                              size: screenWidth * 0.05, // 20px
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Home Indicator - 142:249
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: screenHeight * 0.0418, // 34px on 812px screen
              alignment: Alignment.topCenter,
              child: Container(
                width: screenWidth * 0.357, // 134px on 375px screen
                height: 5,
                decoration: BoxDecoration(
                  color: primaryDarkColor,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget for progress bar segments
  Widget _buildProgressBarSegment(Color color, double screenWidth) {
    return Container(
      width: screenWidth * 0.19, // 71.25px on 375px screen
      height: 4,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}