import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'fade_in_widget.dart';

class PortfolioSection extends StatefulWidget {
  const PortfolioSection({super.key});

  @override
  State<PortfolioSection> createState() => _PortfolioSectionState();
}

class _PortfolioSectionState extends State<PortfolioSection> {
  String _selectedCategory = 'All';

  final List<String> _categories = const [
    'All',
    'Web Apps',
    'Mobile Apps',
    'Full Stack',
  ];

  final List<Map<String, dynamic>> _projects = const [
    {
      'title': 'DTech Marketplace',
      'category': 'Web Apps',
      'description':
          'A comprehensive technology marketplace web application featuring secure payment processing, advanced user management, and an intuitive admin dashboard. Built with Flutter Web to deliver exceptional shopping experiences and robust backend functionality for tech products and services.',
      'technologies': ['Flutter', 'Firebase', 'MongoDB'],
      'codeUrl': 'https://github.com/dejen-achenef/DTech_Marketplace',
      'liveUrl':
          'https://d-tech-marketplace-8olq-jjvwo26j3-dejens-projects-ae0a9fba.vercel.app',
      'image': 'assets/images/dtech_marketplace.png',
    },
    {
      'title': 'Wonder Tutor',
      'category': 'Mobile Apps',
      'description':
          'A comprehensive mobile learning platform connecting students with expert tutors. Features video calls, interactive whiteboard, progress tracking, and personalized learning paths for enhanced educational experiences. Coming soon to Play Store.',
      'technologies': ['Flutter', 'Firebase', 'Express.js', 'MongoDB'],
      'codeUrl': 'Coming Soon',
      'liveUrl': 'Coming Soon to Play Store',
      'image': 'assets/images/tutor.png',
    },
    {
      'title': 'Personal Dashboard',
      'category': 'Web Apps',
      'description':
          'A comprehensive personal productivity dashboard featuring real-time analytics, task management, and data visualization. Built with Flutter Web and JavaScript to provide users with insights into their daily activities and productivity metrics.',
      'technologies': ['Flutter', 'JavaScript', 'Firebase'],
      'codeUrl': 'https://github.com/dejen-achenef/simple_dashboard',
      'liveUrl':
          'https://simple-dashboard-v6zi-bmqzx9mb4-dejens-projects-ae0a9fba.vercel.app/',
      'image': 'assets/images/dashbord.png',
    },
    {
      'title': 'Nike E-Commerce',
      'category': 'Web Apps',
      'description':
          'A modern, responsive e-commerce web application for Nike products featuring advanced product catalog, seamless shopping cart, secure payment processing, and user authentication. Built with Flutter Web for optimal performance and user experience.',
      'technologies': ['Flutter', 'Firebase', 'MongoDB'],
      'codeUrl': 'https://github.com/dejen-achenef/another_ecommerce',
      'liveUrl': 'https://another-ecommerce-9kod.vercel.app/',
      'image': 'assets/images/nike_ecommerce.png',
    },
    {
      'title': 'Chat Application',
      'category': 'Mobile Apps',
      'description':
          'A real-time messaging application with advanced features including group chats, file sharing, voice messages, and end-to-end encryption. Built with Flutter and Firebase for seamless communication across all devices with modern UI/UX design. Currently in development.',
      'technologies': ['Flutter', 'Firebase', 'WebRTC'],
      'codeUrl': 'Coming Soon',
      'liveUrl': 'Coming Soon',
      'image': 'assets/images/dtech_marketplace.png',
    },
    {
      'title': 'Renter Mobile App',
      'category': 'Mobile Apps',
      'description':
          'A comprehensive property rental mobile application connecting landlords and tenants. Features include property listings, virtual tours, secure payments, maintenance requests, and real-time communication for seamless rental experiences. Currently in development.',
      'technologies': ['Flutter', 'Firebase', 'Google Maps', 'Stripe'],
      'codeUrl': 'Coming Soon',
      'liveUrl': 'Coming Soon',
      'image': 'assets/images/dtech_marketplace.png',
    },
  ];

  List<Map<String, dynamic>> get _filteredProjects {
    if (_selectedCategory == 'All') {
      return _projects;
    }
    return _projects
        .where((project) => project['category'] == _selectedCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = screenWidth < 768;
    final isSmallScreen = screenHeight < 600;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isSmallScreen ? 30 : 40,
        horizontal: isMobile ? 16 : 24,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF0F0F23),
            Color(0xFF1A1A2E),
            Color(0xFF16213E),
          ],
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Section Header
          FadeInWidget(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Featured Projects',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF6C63FF),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 16),
                Flexible(
                  child: RichText(
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.visible,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'My ',
                          style: TextStyle(
                            fontSize: isMobile ? (isSmallScreen ? 28 : 32) : 48,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        TextSpan(
                          text: 'Projects',
                          style: TextStyle(
                            fontSize: isMobile ? (isSmallScreen ? 28 : 32) : 48,
                            fontWeight: FontWeight.bold,
                            foreground: Paint()
                              ..shader = const LinearGradient(
                                colors: [Color(0xFF6C63FF), Color(0xFF9C88FF)],
                              ).createShader(
                                const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
                              ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: isMobile ? double.infinity : 600,
                  ),
                  child: Text(
                    'Explore my collection of projects that showcase my skills in mobile app development, web applications, and full-stack solutions. Each project represents a unique challenge solved with innovative approaches and modern technologies.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: isMobile ? (isSmallScreen ? 16 : 18) : 20,
                      color: Colors.white70,
                      height: 1.6,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // Category Filter
          if (!isMobile)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.1),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: _categories.map((category) {
                  final isSelected = _selectedCategory == category;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedCategory = category;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFF6C63FF)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        category,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.white70,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

          const SizedBox(height: 30),

          // Projects Grid Container
          FadeInWidget(
            delay: const Duration(milliseconds: 200),
            child: Center(
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: isMobile ? double.infinity : 1200,
                ),
                child: isMobile
                    ? _buildMobileProjectsList()
                    : _buildDesktopProjectsGrid(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileProjectsList() {
    return Column(
      children: _filteredProjects.map((project) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: _buildProjectCard(project, true),
        );
      }).toList(),
    );
  }

  Widget _buildDesktopProjectsGrid() {
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      children: _filteredProjects.map((project) {
        return SizedBox(
          width: (1200 - 20) / 2,
          child: _buildProjectCard(project, false),
        );
      }).toList(),
    );
  }

  Widget _buildProjectCard(Map<String, dynamic> project, bool isMobile) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 600),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, 30 * (1 - value)),
          child: Opacity(
            opacity: value,
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF1A1A2E),
                      Color(0xFF16213E),
                    ],
                  ),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.1),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: const Color(0xFF6C63FF).withValues(alpha: 0.1),
                      blurRadius: 30,
                      offset: const Offset(0, 0),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white.withValues(alpha: 0.05),
                        Colors.white.withValues(alpha: 0.02),
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Project Image
                      Container(
                        height: 260,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                          ),
                          child: project['image'] != null
                              ? Image.asset(
                                  project['image'],
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                )
                              : Container(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xFF6C63FF),
                                        Color(0xFF9C88FF),
                                      ],
                                    ),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.image,
                                      size: 80,
                                      color: Colors.white70,
                                    ),
                                  ),
                                ),
                        ),
                      ),

                      // Project Content
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Category Tag
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: const Color(0xFF6C63FF)
                                    .withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                project['category'],
                                style: const TextStyle(
                                  color: Color(0xFF6C63FF),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),

                            // Project Title
                            Text(
                              project['title'],
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                height: 1.2,
                              ),
                            ),
                            const SizedBox(height: 12),

                            // Project Description
                            Text(
                              project['description'],
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.white70,
                                height: 1.5,
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 20),

                            // Technology Chips
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children:
                                  (project['technologies'] as List<String>)
                                      .take(3)
                                      .map((tech) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color:
                                          Colors.white.withValues(alpha: 0.2),
                                    ),
                                  ),
                                  child: Text(
                                    tech,
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                            const SizedBox(height: 24),

                            // Action Buttons
                            Row(
                              children: [
                                Expanded(
                                  child: _buildActionButton(
                                    text: '</> Code',
                                    icon: Icons.code,
                                    onTap: () => _launchUrl(project['codeUrl']),
                                    isOutlined: true,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: _buildActionButton(
                                    text: '🔗 Live',
                                    icon: Icons.open_in_new,
                                    onTap: () => _launchUrl(project['liveUrl']),
                                    isPrimary: true,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildActionButton({
    required String text,
    required IconData icon,
    required VoidCallback onTap,
    bool isPrimary = false,
    bool isOutlined = false,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          height: 44,
          decoration: BoxDecoration(
            gradient: isPrimary
                ? const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF6C63FF), Color(0xFF9C88FF)],
                  )
                : null,
            color: isPrimary
                ? null
                : isOutlined
                    ? Colors.transparent
                    : Colors.white.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(22),
            border: isPrimary
                ? null
                : Border.all(
                    color: isOutlined
                        ? Colors.white.withValues(alpha: 0.3)
                        : Colors.white.withValues(alpha: 0.2),
                    width: 1.5,
                  ),
            boxShadow: isPrimary
                ? [
                    BoxShadow(
                      color: const Color(0xFF6C63FF).withValues(alpha: 0.4),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ]
                : [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 16,
                color: isPrimary
                    ? Colors.white
                    : isOutlined
                        ? Colors.white
                        : Colors.white70,
              ),
              const SizedBox(width: 8),
              Text(
                text,
                style: TextStyle(
                  color: isPrimary
                      ? Colors.white
                      : isOutlined
                          ? Colors.white
                          : Colors.white70,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    if (url == 'Coming Soon' || url == 'Coming Soon to Play Store') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('This project is coming soon!'),
          backgroundColor: Color(0xFF6C63FF),
        ),
      );
      return;
    }

    try {
      final Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Could not launch URL'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
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
