import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  final Function(int)? onNavigationTap;

  const Footer({super.key, this.onNavigationTap});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = screenWidth < 768;
    final isSmallScreen = screenHeight < 600;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isSmallScreen ? 40 : 60,
        horizontal: isMobile ? 16 : 24,
      ),
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
          isMobile ? _buildMobileLayout(context) : _buildDesktopLayout(context),

          SizedBox(height: isSmallScreen ? 30 : 40),

          // Divider
          Container(
            height: 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.white.withValues(alpha: 0.2),
                  Colors.transparent,
                ],
              ),
            ),
          ),

          SizedBox(height: isSmallScreen ? 30 : 40),

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

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        // Logo and Description
        _buildLogoSection(),

        const SizedBox(height: 40),

        // Quick Links
        _buildQuickLinks(context),

        const SizedBox(height: 40),

        // Social Links
        _buildSocialLinks(context),

        const SizedBox(height: 40),

        // Contact Info
        _buildContactInfo(),
      ],
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
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
          child: _buildQuickLinks(context),
        ),

        const SizedBox(width: 60),

        // Social Links
        Expanded(
          flex: 1,
          child: _buildSocialLinks(context),
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
          'A dedicated Full Stack Cross-Platform Mobile App Developer with a passion for crafting innovative digital solutions that work seamlessly across all platforms. I specialize in transforming complex ideas into elegant, unified applications that provide consistent user experiences on web, iOS, and Android platforms.',
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
                color: const Color(0xFF6C63FF).withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: const Color(0xFF6C63FF).withValues(alpha: 0.3),
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

  Widget _buildQuickLinks(BuildContext context) {
    final links = [
      {'title': 'Home', 'index': 0},
      {'title': 'About', 'index': 1},
      {'title': 'Services', 'index': 2},
      {'title': 'Skills', 'index': 3},
      {'title': 'Portfolio', 'index': 5},
      {'title': 'Contact', 'index': 6},
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
                  if (onNavigationTap != null) {
                    onNavigationTap!(link['index'] as int);
                  }
                },
                child: Text(
                  link['title'] as String,
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

  Widget _buildSocialLinks(BuildContext context) {
    final socialLinks = const [
      {
        'name': 'GitHub',
        'icon': Icons.code,
        'color': Color(0xFF333333),
        'url': 'https://github.com/dejen-achenef',
      },
      {
        'name': 'LinkedIn',
        'icon': Icons.work,
        'color': Color(0xFF0077B5),
        'url': 'https://linkedin.com/in/dejen-achenef',
      },
      {
        'name': 'Twitter',
        'icon': Icons.alternate_email,
        'color': Color(0xFF1DA1F2),
        'url': 'https://twitter.com/dejen_achenef',
      },
      {
        'name': 'Email',
        'icon': Icons.email,
        'color': Color(0xFFEA4335),
        'url': 'mailto:dejenacheneffentedese@gmail.com',
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
              child: GestureDetector(
                onTap: () => _launchUrl(context, social['url'] as String),
                child: Row(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color:
                            (social['color'] as Color).withValues(alpha: 0.1),
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

  Future<void> _launchUrl(BuildContext context, String url) async {
    try {
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        // Show error message if URL can't be launched
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Could not launch $url'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    } catch (e) {
      // Show error message if there's an exception
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Error launching URL'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}
