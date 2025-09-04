import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart'; // Import go_router

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // For bottom navigation bar
  int _selectedCategoryIndex = 0; // For horizontal category scroll

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Helper for responsive padding
    double responsivePaddingHorizontal = screenWidth * 0.064; // ~24/375
    double responsivePaddingVertical = screenHeight * 0.02;

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9), // Background color derived from the screenshot
      body: Stack(
        children: [
          // Top Background Gradient
          Container(
            height: screenHeight * 0.345, // 280 / 812
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFF0C0F14), // ~142:464 gradient start
                  Color(0xFF313131), // ~142:464 gradient end
                ],
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: responsivePaddingHorizontal),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * 0.02), // Initial spacing below status bar
                  // Header: Location & Profile
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Location',
                            style: GoogleFonts.sora(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFFA9A9A9),
                              letterSpacing: 0.12,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.005),
                          Row(
                            children: [
                              Text(
                                'Bilzen, Tanjungbalai',
                                style: GoogleFonts.sora(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFFD3D3D3),
                                ),
                              ),
                              SizedBox(width: screenWidth * 0.01),
                              Icon(
                                Icons.keyboard_arrow_down,
                                color: const Color(0xFFD3D3D3),
                                size: screenWidth * 0.035, // Responsive icon size
                              ),
                            ],
                          ),
                        ],
                      ),
                      // Profile Picture
                      GestureDetector(
                        onTap: () {
                          // Navigate to profile screen using go_router
                          context.push('/profile');
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            'assets/images/142_198.png', // Assuming 142:198 is the profile picture asset
                            width: screenWidth * 0.11, // 44/375
                            height: screenWidth * 0.11,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  // Search Bar
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: screenHeight * 0.064, // 52/812
                          decoration: BoxDecoration(
                            color: const Color(0xFF2A2A2A),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                          child: Row(
                            children: [
                              Icon(
                                Icons.search,
                                color: const Color(0xFFA9A9A9),
                                size: screenWidth * 0.05,
                              ),
                              SizedBox(width: screenWidth * 0.02),
                              Expanded(
                                child: TextField(
                                  style: GoogleFonts.sora(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFFA9A9A9),
                                  ),
                                  decoration: InputDecoration(
                                    hintText: 'Search coffee',
                                    hintStyle: GoogleFonts.sora(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFFA9A9A9),
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.04),
                      GestureDetector(
                        onTap: () {
                          // Handle filter action
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Filter tapped!')),
                          );
                        },
                        child: Container(
                          width: screenWidth * 0.138, // 52/375
                          height: screenHeight * 0.064, // 52/812
                          decoration: BoxDecoration(
                            color: const Color(0xFFC67C4E),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            Icons.filter_list, // Closest standard icon to the filter icon
                            color: Colors.white,
                            size: screenWidth * 0.05,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.03),

                  // Banner
                  Container(
                    width: screenWidth - (responsivePaddingHorizontal * 2), // Full width minus padding
                    height: screenHeight * 0.172, // 140/812
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/142_467.png'), // Banner image
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: screenHeight * 0.016, // 13/812
                          left: screenWidth * 0.04, // 15/375
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xFFED4949),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'Promo',
                              style: GoogleFonts.sora(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: screenHeight * 0.06, // 49/812
                          left: screenWidth * 0.04,
                          child: Text(
                            'Buy one get one FREE',
                            style: GoogleFonts.sora(
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: responsivePaddingVertical * 2), // Spacing between banner and categories

                  // Categories
                  SizedBox(
                    height: screenHeight * 0.035, // 29/812 for category button height
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildCategoryButton(context, 0, 'All Coffee'),
                        _buildCategoryButton(context, 1, 'Machiato'),
                        _buildCategoryButton(context, 2, 'Latte'),
                        _buildCategoryButton(context, 3, 'Americano'),
                        // Add more categories if needed
                      ],
                    ),
                  ),
                  SizedBox(height: responsivePaddingVertical * 2),

                  // Products Grid
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: screenWidth * 0.04, // 16/375
                      mainAxisSpacing: screenHeight * 0.02, // 16/812
                      childAspectRatio: (screenWidth * 0.416) / (screenHeight * 0.293), // 156/375 / 238/812 = 0.416 / 0.293
                    ),
                    itemCount: 4, // Assuming 4 products based on JSON (2 visible, 2 scrolled)
                    itemBuilder: (context, index) {
                      // Example product data (replace with actual data model)
                      final List<Map<String, dynamic>> products = [
                        {
                          'image': 'assets/images/I142_401_417_715.png',
                          'name': 'Caffe Mocha',
                          'description': 'Deep Foam',
                          'price': '4.53',
                          'rating': '4.8',
                        },
                        {
                          'image': 'assets/images/I142_417_417_717.png',
                          'name': 'Flat White',
                          'description': 'Espresso',
                          'price': '3.53',
                          'rating': '4.8',
                        },
                        {
                          'image': 'assets/images/I142_449_417_716.png',
                          'name': 'Mocha Fusi',
                          'description': 'Ice/Hot',
                          'price': '7.53',
                          'rating': '4.8',
                        },
                        {
                          'image': 'assets/images/I142_433_417_718.png',
                          'name': 'Caffe Panna',
                          'description': 'Ice/Hot',
                          'price': '5.53',
                          'rating': '4.8',
                        },
                      ];
                      final product = products[index];
                      return _buildProductCard(
                        context,
                        product['image']!,
                        product['name']!,
                        product['description']!,
                        product['price']!,
                        product['rating']!,
                      );
                    },
                  ),
                  SizedBox(height: screenHeight * 0.15), // Ensure content doesn't get hidden behind bottom nav
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context, screenWidth),
    );
  }

  Widget _buildCategoryButton(BuildContext context, int index, String title) {
    bool isSelected = _selectedCategoryIndex == index;
    return Padding(
      padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.042), // 16/375
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedCategoryIndex = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFC67C4E) : const Color(0xFFEDEFEC).withOpacity(0.35),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            title,
            style: GoogleFonts.sora(
              fontSize: 14,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              color: isSelected ? Colors.white : const Color(0xFF313131),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProductCard(
    BuildContext context,
    String imagePath,
    String name,
    String description,
    String price,
    String rating,
  ) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        // Navigate to product detail screen using go_router
        context.push('/productDetail', extra: name); // Pass product name as extra
      },
      child: Container(
        width: screenWidth * 0.416, // 156/375
        height: screenHeight * 0.293, // 238/812
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      imagePath,
                      width: double.infinity,
                      height: screenHeight * 0.157, // 128/812
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.02, // 8/375
                        vertical: screenHeight * 0.01, // 8/812
                      ),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color(0xFF0C0F14), // ~142:402 gradient start
                            Color(0xFF313131), // ~142:402 gradient end
                          ],
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(12),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(24),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star_rounded,
                            color: const Color(0xFFFBBE21),
                            size: screenWidth * 0.032, // 12/375
                          ),
                          SizedBox(width: screenWidth * 0.01),
                          Text(
                            rating,
                            style: GoogleFonts.sora(
                              fontSize: 8,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                name,
                style: GoogleFonts.sora(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF242424),
                ),
              ),
              SizedBox(height: screenHeight * 0.005),
              Text(
                description,
                style: GoogleFonts.sora(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFFA9A9A9),
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$ $price',
                    style: GoogleFonts.sora(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF242424), // Using dark text for price as per Figma fills
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Add item to cart action
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('$name added to cart!')),
                      );
                    },
                    child: Container(
                      width: screenWidth * 0.085, // 32/375
                      height: screenWidth * 0.085,
                      decoration: BoxDecoration(
                        color: const Color(0xFFC67C4E),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: screenWidth * 0.042, // 16/375
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context, double screenWidth) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.122, // 99/812
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 0,
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildBottomNavItem(context, Icons.home, 0, '/home'),
          _buildBottomNavItem(context, Icons.favorite_border, 1, '/favorites'),
          _buildBottomNavItem(context, Icons.shopping_bag_outlined, 2, '/cart'),
          _buildBottomNavItem(context, Icons.notifications_none, 3, '/notifications'),
        ],
      ),
    );
  }

  Widget _buildBottomNavItem(BuildContext context, IconData icon, int index, String routeName) {
    bool isSelected = _selectedIndex == index;
    Color iconColor = isSelected ? const Color(0xFFC67C4E) : const Color(0xFFA9A9A9);
    double iconSize = MediaQuery.of(context).size.width * 0.06; // 24/375

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        // Use context.go for bottom navigation items which represent top-level destinations
        context.go(routeName);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: iconColor,
            size: iconSize,
          ),
          if (isSelected)
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.007), // 6/812
              height: 5,
              width: MediaQuery.of(context).size.width * 0.026, // 10/375
              decoration: BoxDecoration(
                color: const Color(0xFFC67C4E),
                borderRadius: BorderRadius.circular(18),
              ),
            ),
        ],
      ),
    );
  }
}