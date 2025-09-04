import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart'; // Import go_router

class HighFidelityDetailItemScreen extends StatefulWidget {
  const HighFidelityDetailItemScreen({super.key});

  @override
  State<HighFidelityDetailItemScreen> createState() =>
      _HighFidelityDetailItemScreenState();
}

class _HighFidelityDetailItemScreenState
    extends State<HighFidelityDetailItemScreen> {
  String _selectedSize = 'M';
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    // Define common padding values for responsiveness
    final double horizontalPadding = screenWidth * 0.064; // (24/375)
    final double verticalSpacing = screenHeight * 0.02; // Roughly 16px

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * 0.15), // Height for status bar + header
        child: Padding(
          padding: EdgeInsets.only(
            top: mediaQuery.padding.top + screenHeight * 0.01,
            left: horizontalPadding,
            right: horizontalPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildStatusBar(screenWidth),
              SizedBox(height: screenHeight * 0.012),
              _buildHeader(screenWidth),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.02),
            _buildProductImage(screenWidth, screenHeight),
            SizedBox(height: verticalSpacing * 2), // Figma shows 16px below image, then a text block, then another text block, implies more space
            _buildProductDetails(screenWidth, screenHeight),
            SizedBox(height: verticalSpacing),
            Divider(color: const Color(0xFFE3E3E3), thickness: 1),
            SizedBox(height: verticalSpacing),
            _buildDescription(screenWidth),
            SizedBox(height: verticalSpacing * 2), // More space before size selection
            _buildSizeSelection(screenWidth),
            SizedBox(height: screenHeight * 0.15), // Space for the fixed bottom bar
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomActionbar(screenWidth),
    );
  }

  Widget _buildStatusBar(double screenWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '9:41',
          style: GoogleFonts.sora(
            color: const Color(0xFF242424),
            fontSize: screenWidth * 0.032, // Adjust font size responsively
            fontWeight: FontWeight.w600,
          ),
        ),
        Row(
          children: [
            Icon(Icons.signal_cellular_alt_rounded,
                size: screenWidth * 0.045, color: const Color(0xFF242424)),
            SizedBox(width: screenWidth * 0.01),
            Icon(Icons.wifi_rounded,
                size: screenWidth * 0.045, color: const Color(0xFF242424)),
            SizedBox(width: screenWidth * 0.01),
            Icon(Icons.battery_full_rounded,
                size: screenWidth * 0.045, color: const Color(0xFF242424)),
          ],
        ),
      ],
    );
  }

  Widget _buildHeader(double screenWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            // Use context.pop() for back navigation
            context.pop();
          },
          child: Container(
            width: screenWidth * 0.117, // 44/375
            height: screenWidth * 0.117, // 44/375
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.transparent,
            ),
            child: Icon(
              Icons.arrow_back_ios_rounded,
              color: const Color(0xFF242424),
              size: screenWidth * 0.05,
            ),
          ),
        ),
        Text(
          'Detail',
          style: GoogleFonts.sora(
            color: const Color(0xFF242424),
            fontSize: screenWidth * 0.043, // 16px for 375w
            fontWeight: FontWeight.w600,
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _isFavorite = !_isFavorite;
            });
          },
          child: Container(
            width: screenWidth * 0.117, // 44/375
            height: screenWidth * 0.117, // 44/375
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.transparent,
            ),
            child: Icon(
              _isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
              color: const Color(0xFF242424),
              size: screenWidth * 0.064,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProductImage(double screenWidth, double screenHeight) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        'assets/images/I142_377_417_715.png', // Main product image
        width: screenWidth - (screenWidth * 0.064 * 2), // Fill horizontal padding
        height: screenHeight * 0.25, // 202px for 812h
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildProductDetails(double screenWidth, double screenHeight) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Caffe Mocha',
              style: GoogleFonts.sora(
                color: const Color(0xFF242424),
                fontSize: screenWidth * 0.053, // 20px for 375w
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: screenHeight * 0.005), // 4px
            Text(
              'Ice/Hot',
              style: GoogleFonts.sora(
                color: const Color(0xFF909090),
                fontSize: screenWidth * 0.032, // 12px for 375w
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: screenHeight * 0.02), // 16px
            Row(
              children: [
                Icon(Icons.star_rounded,
                    color: const Color(0xFFFABE21),
                    size: screenWidth * 0.053), // 20px
                SizedBox(width: screenWidth * 0.01), // 4px
                Text(
                  '4.8',
                  style: GoogleFonts.sora(
                    color: const Color(0xFF2A2A2A),
                    fontSize: screenWidth * 0.043, // 16px
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: screenWidth * 0.01),
                Text(
                  '(230)',
                  style: GoogleFonts.sora(
                    color: const Color(0xFF909090),
                    fontSize: screenWidth * 0.032, // 12px
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            _buildSuperiorityIcon(
                'assets/images/I142_371_418_950.png', screenWidth), // Bike icon
            SizedBox(width: screenWidth * 0.032), // 12px
            _buildSuperiorityIcon(
                'assets/images/I142_373_418_971.png', screenWidth), // Bean icon
            SizedBox(width: screenWidth * 0.032), // 12px
            _buildSuperiorityIcon(
                'assets/images/I142_375_418_967.png', screenWidth), // Milk icon
          ],
        )
      ],
    );
  }

  Widget _buildSuperiorityIcon(String assetPath, double screenWidth) {
    return Container(
      width: screenWidth * 0.117, // 44px
      height: screenWidth * 0.117, // 44px
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0x59EDEDED), // R:237, G:237, B:237, A:0.35
      ),
      child: Center(
        child: Image.asset(
          assetPath,
          width: screenWidth * 0.053, // 20px
          height: screenWidth * 0.053, // 20px
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _buildDescription(double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: GoogleFonts.sora(
            color: const Color(0xFF242424),
            fontSize: screenWidth * 0.043, // 16px
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: screenWidth * 0.021), // 8px
        RichText(
          text: TextSpan(
            style: GoogleFonts.sora(
              color: const Color(0xFFA1A1A1), // R:161, G:161, B:161, A:1
              fontSize: screenWidth * 0.037, // 14px
              fontWeight: FontWeight.w300,
              height: 1.5,
            ),
            children: <TextSpan>[
              const TextSpan(
                text:
                    'A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo.. ',
              ),
              TextSpan(
                text: 'Read More',
                style: GoogleFonts.sora(
                  color: const Color(0xFFC67C4E), // Primary accent color
                  fontSize: screenWidth * 0.037, // 14px
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSizeSelection(double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Size',
          style: GoogleFonts.sora(
            color: const Color(0xFF242424),
            fontSize: screenWidth * 0.043, // 16px
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: screenWidth * 0.042), // 16px
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: ['S', 'M', 'L'].map((size) {
            bool isSelected = _selectedSize == size;
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedSize = size;
                });
              },
              child: Container(
                width: screenWidth * 0.256, // 96px
                height: screenWidth * 0.109, // 41px
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFFF9F2ED) : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected
                        ? const Color(0xFFC67C4E)
                        : const Color(0xFFE3E3E3),
                    width: 1,
                  ),
                ),
                child: Center(
                  child: Text(
                    size,
                    style: GoogleFonts.sora(
                      color: isSelected
                          ? const Color(0xFFC67C4E)
                          : const Color(0xFF242424),
                      fontSize: screenWidth * 0.037, // 14px
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildBottomActionbar(double screenWidth) {
    return Container(
      width: double.infinity,
      height: screenWidth * 0.315, // 118px
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.064), // 24px
        child: Column(
          children: [
            SizedBox(height: screenWidth * 0.042), // 16px
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Price',
                      style: GoogleFonts.sora(
                        color: const Color(0xFF909090),
                        fontSize: screenWidth * 0.037, // 14px
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: screenWidth * 0.01), // 4px
                    Text(
                      '\$ 4.53',
                      style: GoogleFonts.sora(
                        color: const Color(0xFFC67C4E), // Primary accent color
                        fontSize: screenWidth * 0.048, // 18px
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to checkout or add to cart using go_router
                    context.push('/cart'); // Assuming a /cart route
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFC67C4E), // Primary accent color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.053, // 20px
                      vertical: screenWidth * 0.042, // 16px
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Buy Now',
                    style: GoogleFonts.sora(
                      color: Colors.white,
                      fontSize: screenWidth * 0.043, // 16px
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenWidth * 0.053), // 20px for bottom padding, accounting for safe area below
          ],
        ),
      ),
    );
  }
}