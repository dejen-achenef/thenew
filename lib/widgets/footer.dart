import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF0A0A0A),
            Color(0xFF1A1A2E),
          ],
        ),
      ),
      child: Column(
        children: [
          // Main Footer Content
          isMobile ? _buildMobileLayout() : _buildDesktopLayout(),

          const SizedBox(height: 40),

          // Divider
          Container(
            height: 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.white.withOpacity(0.2),
                  Colors.transparent,
                ],
              ),
            ),
          ),

          const SizedBox(height: 40),

          // Bottom Footer
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '© 2024 Dejen Achenef. All rights reserved.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),
              if (!isMobile)
                const Text(
                  'Made with ❤️ using Flutter',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        // Logo and Description
        _buildLogoSection(),

        const SizedBox(height: 40),

        // Quick Links
        _buildQuickLinks(),

        const SizedBox(height: 40),

        // Social Links
        _buildSocialLinks(),

        const SizedBox(height: 40),

        // Contact Info
        _buildContactInfo(),
      ],
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Logo and Description
        Expanded(
          flex: 2,
          child: _buildLogoSection(),
        ),

        const SizedBox(width: 60),

        // Quick Links
        Expanded(
          flex: 1,
          child: _buildQuickLinks(),
        ),

        const SizedBox(width: 60),

        // Social Links
        Expanded(
          flex: 1,
          child: _buildSocialLinks(),
        ),

        const SizedBox(width: 60),

        // Contact Info
        Expanded(
          flex: 1,
          child: _buildContactInfo(),
        ),
      ],
    );
  }

  Widget _buildLogoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Logo
        Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF6C63FF), Color(0xFF9C88FF)],
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Text(
                  'D',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              'ejen Achenef',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        // Description
        const Text(
          'A dedicated Full Stack Cross-Platform App Developer with a passion for crafting innovative digital solutions that work seamlessly across all platforms. I specialize in transforming complex ideas into elegant, unified applications that provide consistent user experiences on web, iOS, and Android platforms.',
          style: TextStyle(
            fontSize: 14,
            color: Colors.white70,
            height: 1.6,
          ),
        ),

        const SizedBox(height: 24),

        // Tech Stack
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children:
              ['Flutter', 'Dart', 'Node.js', 'Firebase', 'MongoDB'].map((tech) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFF6C63FF).withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: const Color(0xFF6C63FF).withOpacity(0.3),
                ),
              ),
              child: Text(
                tech,
                style: const TextStyle(
                  color: Color(0xFF6C63FF),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildQuickLinks() {
    final links = [
      {'title': 'Home', 'url': '#hero'},
      {'title': 'About', 'url': '#about'},
      {'title': 'Services', 'url': '#services'},
      {'title': 'Skills', 'url': '#skills'},
      {'title': 'Portfolio', 'url': '#portfolio'},
      {'title': 'Contact', 'url': '#contact'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Quick Links',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 20),
        Column(
          children: links.map((link) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: GestureDetector(
                onTap: () {
                  // Handle navigation
                },
                child: Text(
                  link['title']!,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildSocialLinks() {
    final socialLinks = const [
      {
        'name': 'GitHub',
        'icon': Icons.code,
        'color': Color(0xFF333333),
      },
      {
        'name': 'LinkedIn',
        'icon': Icons.work,
        'color': Color(0xFF0077B5),
      },
      {
        'name': 'Twitter',
        'icon': Icons.alternate_email,
        'color': Color(0xFF1DA1F2),
      },
      {
        'name': 'Email',
        'icon': Icons.email,
        'color': Color(0xFFEA4335),
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Follow Me',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 20),
        Column(
          children: socialLinks.map((social) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: (social['color'] as Color).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      social['icon'] as IconData,
                      color: social['color'] as Color,
                      size: 16,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    social['name'] as String,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Get In Touch',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 20),

        // Email
        _buildContactItem(
          icon: Icons.email,
          text: 'dejenacheneffentedese@gmail.com',
        ),

        const SizedBox(height: 12),

        // Phone
        _buildContactItem(
          icon: Icons.phone,
          text: '+251900604913',
        ),

        const SizedBox(height: 12),

        // Location
        _buildContactItem(
          icon: Icons.location_on,
          text: 'Addis Ababa, Ethiopia',
        ),
      ],
    );
  }

  Widget _buildContactItem({
    required IconData icon,
    required String text,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          color: const Color(0xFF6C63FF),
          size: 16,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white70,
            ),
          ),
        ),
      ],
    );
  }
}
