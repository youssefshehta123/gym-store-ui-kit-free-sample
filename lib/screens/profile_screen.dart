import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme_notifier.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardColor = Theme.of(context).cardColor;
    final textColor = Theme.of(context).colorScheme.onSurface;
    final bgColor = Theme.of(context).scaffoldBackgroundColor;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text(
          "My Profile",
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              color: cardColor,
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xFF00E676).withValues(alpha: 0.15),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 60,
                      color: Color(0xFF00E676),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Youssef Shehta",
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "youssef@example.com",
                    style: GoogleFonts.poppins(color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: isDark ? 0.3 : 0.04),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStat("Orders", "12"),
                  Container(
                    width: 1,
                    height: 40,
                    color: isDark ? Colors.grey.shade700 : Colors.grey.shade200,
                  ),
                  _buildStat("Wishlist", "8"),
                  Container(
                    width: 1,
                    height: 40,
                    color: isDark ? Colors.grey.shade700 : Colors.grey.shade200,
                  ),
                  _buildStat("Coupons", "3"),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: isDark ? 0.3 : 0.04),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildMenuItem(
                    context,
                    Icons.shopping_bag_outlined,
                    "My Orders",
                  ),
                  _buildDivider(context),
                  _buildMenuItem(
                    context,
                    Icons.location_on_outlined,
                    "Shipping Address",
                  ),
                  _buildDivider(context),
                  _buildMenuItem(
                    context,
                    Icons.payment_outlined,
                    "Payment Methods",
                  ),
                  _buildDivider(context),
                  _buildMenuItem(
                    context,
                    Icons.notifications_outlined,
                    "Notifications",
                  ),
                  _buildDivider(context),
                  _buildMenuItem(context, Icons.settings_outlined, "Settings"),
                  _buildDivider(context),
                  _buildMenuItem(context, Icons.help_outline, "Help & Support"),
                  _buildDivider(context),
                  SwitchListTile(
                    secondary: Icon(Icons.dark_mode_outlined, color: textColor),
                    title: Text(
                      "Dark Mode",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: textColor,
                      ),
                    ),
                    value: themeNotifier.value == ThemeMode.dark,
                    activeThumbColor: const Color(
                      0xFF00E676,
                    ), // <--- التعديل هنا
                    onChanged: (value) {
                      themeNotifier.value = value
                          ? ThemeMode.dark
                          : ThemeMode.light;
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.logout, color: Colors.red),
                label: Text(
                  "Logout",
                  style: GoogleFonts.poppins(
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  side: const BorderSide(color: Colors.red),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildStat(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF00E676),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.poppins(color: Colors.grey, fontSize: 13),
        ),
      ],
    );
  }

  Widget _buildMenuItem(BuildContext context, IconData icon, String title) {
    final textColor = Theme.of(context).colorScheme.onSurface;
    return ListTile(
      leading: Icon(icon, color: textColor),
      title: Text(
        title,
        style: GoogleFonts.poppins(fontSize: 14, color: textColor),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.grey,
      ),
      onTap: () {},
    );
  }

  Widget _buildDivider(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Divider(
      height: 1,
      color: isDark ? Colors.grey.shade800 : Colors.grey.shade200,
    );
  }
}
