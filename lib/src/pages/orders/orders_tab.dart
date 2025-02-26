import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greengrocer/src/config/app_data.dart' as add_data;
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/pages/orders/components/orders_tile.dart';

class OrdersTab extends StatelessWidget {
  const OrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text.rich(
          TextSpan(
            style: const TextStyle(
              fontSize: 30,
            ),
            children: [
              TextSpan(
                text: 'Ped',
                style: GoogleFonts.satisfy(
                  color: CustomColors.customContrastColorNomeApp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: 'idos',
                style: GoogleFonts.satisfy(
                  color: CustomColors.customContrastColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(16),
        physics: BouncingScrollPhysics(),
        separatorBuilder: (_, index) => SizedBox(height: 10),
        itemBuilder: (_, index) => OrdersTile(order: add_data.orders[index]),
        itemCount: add_data.orders.length,
      ),
    );
  }
}
