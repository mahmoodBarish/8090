import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart'; // Import go_router

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  String _selectedDeliveryType = 'Deliver'; // State for Delivery/Pickup toggle
  int _itemQuantity = 1; // State for item quantity

  // Define custom colors
  static const Color primaryColor = Color(0xFFC67C4E);
  static const Color darkTextColor = Color(0xFF2F2D2C);
  static const Color mediumGrayTextColor = Color(0xFF3D3D3D);
  static const Color lightGrayTextColor = Color(0xFFA9A9A9);
  static const Color dividerColor = Color(0xFFEAEAEA);
  static const Color lighterDividerColor = Color(0xFFF9F2ED);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * 0.1), // Adjusted for responsiveness
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
          leading: Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.04), // Responsive padding
            child: GestureDetector(
              onTap: () {
                context.pop(); // Use context.pop() for back navigation
              },
              child: Container(
                width: screenWidth * 0.11, // Responsive size
                height: screenWidth * 0.11, // Responsive size
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: darkTextColor,
                    size: screenWidth * 0.05, // Responsive icon size
                  ),
                ),
              ),
            ),
          ),
          title: Text(
            'Order',
            style: GoogleFonts.sora(
              color: darkTextColor,
              fontSize: screenWidth * 0.045, // Responsive font size
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          // Figma element 142:326 "Favourite" is marked as visible: false, so it's omitted.
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: constraints.maxWidth * 0.06, // Responsive horizontal padding
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: constraints.maxHeight * 0.02), // Responsive spacing

                  // Deliver / Pick Up Toggle
                  Container(
                    width: double.infinity,
                    height: constraints.maxHeight * 0.06, // Responsive height
                    decoration: BoxDecoration(
                      color: dividerColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedDeliveryType = 'Deliver';
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              decoration: BoxDecoration(
                                color: _selectedDeliveryType == 'Deliver'
                                    ? primaryColor
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  'Deliver',
                                  style: GoogleFonts.sora(
                                    color: _selectedDeliveryType == 'Deliver'
                                        ? Colors.white
                                        : darkTextColor,
                                    fontSize: constraints.maxWidth * 0.04, // Responsive font size
                                    fontWeight: _selectedDeliveryType == 'Deliver'
                                        ? FontWeight.w600
                                        : FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedDeliveryType = 'Pick Up';
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              decoration: BoxDecoration(
                                color: _selectedDeliveryType == 'Pick Up'
                                    ? primaryColor
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  'Pick Up',
                                  style: GoogleFonts.sora(
                                    color: _selectedDeliveryType == 'Pick Up'
                                        ? Colors.white
                                        : darkTextColor,
                                    fontSize: constraints.maxWidth * 0.04, // Responsive font size
                                    fontWeight: _selectedDeliveryType == 'Pick Up'
                                        ? FontWeight.w600
                                        : FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: constraints.maxHeight * 0.03), // Responsive spacing

                  // Delivery Address Section
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Delivery Address',
                        style: GoogleFonts.sora(
                          color: darkTextColor,
                          fontSize: constraints.maxWidth * 0.045, // Responsive font size
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: constraints.maxHeight * 0.02), // Responsive spacing
                      Text(
                        'Jl. Kpg Sutoyo',
                        style: GoogleFonts.sora(
                          color: mediumGrayTextColor,
                          fontSize: constraints.maxWidth * 0.038, // Responsive font size
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: constraints.maxHeight * 0.005), // Responsive spacing
                      Text(
                        'Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai.',
                        style: GoogleFonts.sora(
                          color: lightGrayTextColor,
                          fontSize: constraints.maxWidth * 0.032, // Responsive font size
                          fontWeight: FontWeight.w400,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: constraints.maxHeight * 0.02), // Responsive spacing
                      Row(
                        children: [
                          // Edit Address Button
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: lightGrayTextColor),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(16),
                                onTap: () {
                                  // Handle Edit Address using go_router
                                  context.push('/editAddress');
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: constraints.maxWidth * 0.03, // Responsive padding
                                    vertical: constraints.maxHeight * 0.007, // Responsive padding
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.edit_outlined,
                                        size: constraints.maxWidth * 0.038, // Responsive icon size
                                        color: mediumGrayTextColor,
                                      ),
                                      SizedBox(width: constraints.maxWidth * 0.01), // Responsive spacing
                                      Text(
                                        'Edit Address',
                                        style: GoogleFonts.sora(
                                          color: mediumGrayTextColor,
                                          fontSize: constraints.maxWidth * 0.032, // Responsive font size
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: constraints.maxWidth * 0.02), // Responsive spacing

                          // Add Note Button
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: lightGrayTextColor),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(16),
                                onTap: () {
                                  // Handle Add Note using go_router
                                  context.push('/addNote');
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: constraints.maxWidth * 0.03, // Responsive padding
                                    vertical: constraints.maxHeight * 0.007, // Responsive padding
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.note_alt_outlined,
                                        size: constraints.maxWidth * 0.038, // Responsive icon size
                                        color: mediumGrayTextColor,
                                      ),
                                      SizedBox(width: constraints.maxWidth * 0.01), // Responsive spacing
                                      Text(
                                        'Add Note',
                                        style: GoogleFonts.sora(
                                          color: mediumGrayTextColor,
                                          fontSize: constraints.maxWidth * 0.032, // Responsive font size
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: constraints.maxHeight * 0.03), // Responsive spacing

                  // Divider Line
                  Container(
                    width: double.infinity,
                    height: constraints.maxHeight * 0.005, // Responsive height
                    color: lighterDividerColor,
                  ),
                  SizedBox(height: constraints.maxHeight * 0.03), // Responsive spacing

                  // Checkout Product Item
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/images/I142_286_417_715.png', // Image path from rules
                              width: constraints.maxWidth * 0.14, // Responsive size
                              height: constraints.maxWidth * 0.14, // Responsive size
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: constraints.maxWidth * 0.04), // Responsive spacing
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Caffe Mocha',
                                style: GoogleFonts.sora(
                                  color: darkTextColor,
                                  fontSize: constraints.maxWidth * 0.045, // Responsive font size
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: constraints.maxHeight * 0.005), // Responsive spacing
                              Text(
                                'Deep Foam',
                                style: GoogleFonts.sora(
                                  color: lightGrayTextColor,
                                  fontSize: constraints.maxWidth * 0.032, // Responsive font size
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          // Minus button
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (_itemQuantity > 1) _itemQuantity--;
                              });
                            },
                            child: Container(
                              width: constraints.maxWidth * 0.07, // Responsive size
                              height: constraints.maxWidth * 0.07, // Responsive size
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: dividerColor),
                              ),
                              child: Icon(
                                Icons.remove,
                                size: constraints.maxWidth * 0.04, // Responsive icon size
                                color: lightGrayTextColor,
                              ),
                            ),
                          ),
                          SizedBox(width: constraints.maxWidth * 0.03), // Responsive spacing
                          Text(
                            _itemQuantity.toString(),
                            style: GoogleFonts.sora(
                              color: mediumGrayTextColor,
                              fontSize: constraints.maxWidth * 0.038, // Responsive font size
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: constraints.maxWidth * 0.03), // Responsive spacing
                          // Plus button
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _itemQuantity++;
                              });
                            },
                            child: Container(
                              width: constraints.maxWidth * 0.07, // Responsive size
                              height: constraints.maxWidth * 0.07, // Responsive size
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: dividerColor),
                              ),
                              child: Icon(
                                Icons.add,
                                size: constraints.maxWidth * 0.04, // Responsive icon size
                                color: mediumGrayTextColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: constraints.maxHeight * 0.03), // Responsive spacing

                  // Discount Card
                  Container(
                    width: double.infinity,
                    height: constraints.maxHeight * 0.07, // Responsive height
                    padding: EdgeInsets.symmetric(
                      horizontal: constraints.maxWidth * 0.04, // Responsive padding
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: dividerColor),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: () {
                          // Handle discount tap using go_router
                          context.push('/discount');
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.local_offer_outlined, // Interpreted from Figma
                              color: primaryColor,
                              size: constraints.maxWidth * 0.05, // Responsive icon size
                            ),
                            SizedBox(width: constraints.maxWidth * 0.04), // Responsive spacing
                            Text(
                              '1 Discount is Applies',
                              style: GoogleFonts.sora(
                                color: mediumGrayTextColor,
                                fontSize: constraints.maxWidth * 0.038, // Responsive font size
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Spacer(),
                            Icon(
                              Icons.arrow_forward_ios_rounded, // Interpreted from Figma
                              color: darkTextColor,
                              size: constraints.maxWidth * 0.04, // Responsive icon size
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: constraints.maxHeight * 0.03), // Responsive spacing

                  // Payment Summary Section
                  Text(
                    'Payment Summary',
                    style: GoogleFonts.sora(
                      color: darkTextColor,
                      fontSize: constraints.maxWidth * 0.045, // Responsive font size
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: constraints.maxHeight * 0.02), // Responsive spacing

                  // Price Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Price',
                        style: GoogleFonts.sora(
                          color: mediumGrayTextColor,
                          fontSize: constraints.maxWidth * 0.038, // Responsive font size
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '\$ 4.53',
                        style: GoogleFonts.sora(
                          color: darkTextColor,
                          fontSize: constraints.maxWidth * 0.038, // Responsive font size
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: constraints.maxHeight * 0.01), // Responsive spacing

                  // Delivery Fee Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Delivery Fee',
                        style: GoogleFonts.sora(
                          color: mediumGrayTextColor,
                          fontSize: constraints.maxWidth * 0.038, // Responsive font size
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '\$ 2.0',
                            style: GoogleFonts.sora(
                              color: mediumGrayTextColor,
                              fontSize: constraints.maxWidth * 0.038, // Responsive font size
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          SizedBox(width: constraints.maxWidth * 0.02), // Responsive spacing
                          Text(
                            '\$ 1.0',
                            style: GoogleFonts.sora(
                              color: darkTextColor,
                              fontSize: constraints.maxWidth * 0.038, // Responsive font size
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: constraints.maxHeight * 0.03), // Responsive spacing
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.06, // Responsive horizontal padding
          vertical: screenHeight * 0.02, // Responsive vertical padding
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Payment Method
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.account_balance_wallet_outlined, // Interpreted from Figma
                      color: primaryColor,
                      size: screenWidth * 0.05, // Responsive icon size
                    ),
                    SizedBox(width: screenWidth * 0.04), // Responsive spacing
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cash/Wallet',
                          style: GoogleFonts.sora(
                            color: darkTextColor,
                            fontSize: screenWidth * 0.038, // Responsive font size
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.005), // Responsive spacing
                        Text(
                          '\$ 5.53',
                          style: GoogleFonts.sora(
                            color: primaryColor,
                            fontSize: screenWidth * 0.032, // Responsive font size
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Icon(
                  Icons.keyboard_arrow_down_rounded, // Interpreted from Figma
                  color: darkTextColor,
                  size: screenWidth * 0.05, // Responsive icon size
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02), // Responsive spacing

            // Order Button
            SizedBox(
              width: double.infinity,
              height: screenHeight * 0.07, // Responsive height
              child: ElevatedButton(
                onPressed: () {
                  // Handle order placement using go_router
                  context.push('/orderConfirmation');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: EdgeInsets.zero, // Remove default padding
                ),
                child: Text(
                  'Order',
                  style: GoogleFonts.sora(
                    color: Colors.white,
                    fontSize: screenWidth * 0.045, // Responsive font size
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}