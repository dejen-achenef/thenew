import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioSection extends StatefulWidget {
  const PortfolioSection({super.key});

  @override
  State<PortfolioSection> createState() => _PortfolioSectionState();
}

class _PortfolioSectionState extends State<PortfolioSection> {
  String _selectedCategory = 'All';

  final List<String> _categories = [
    'All',
    'Web Apps',
    'Mobile Apps',
    'Full Stack',
  ];

  final List<Map<String, dynamic>> _projects = const [
    {
      'title': 'DTech Marketplace',
      'category': 'Mobile Apps',
      'description':
          'A comprehensive technology marketplace mobile application featuring secure payment processing, advanced user management, and an intuitive admin dashboard. Built with Flutter to deliver exceptional shopping experiences and robust backend functionality for tech products and services.',
      'technologies': ['Flutter', 'Dart', 'Firebase', 'Stripe'],
      'codeUrl': 'https://github.com/dejen-achenef/dtech-marketplace-flutter',
      'liveUrl': 'https://dtech-marketplace-flutter.netlify.app',
    },
    {
      'title': 'Task Management App',
      'category': 'Mobile Apps',
      'description':
          'A powerful cross-platform productivity application enabling seamless task organization and team collaboration. Features real-time synchronization, intuitive user interface, and comprehensive project management capabilities.',
      'technologies': ['Flutter', 'Firebase', 'Dart'],
      'codeUrl': 'https://github.com/dejen-achenef/task-manager-flutter',
      'liveUrl': 'https://taskmanager-demo.netlify.app',
    },
    {
      'title': 'Social Media Dashboard',
      'category': 'Full Stack',
      'description':
          'An advanced social media management platform providing comprehensive analytics, content scheduling, and multi-platform integration. Built with Flutter frontend and Node.js backend to streamline social media operations and maximize engagement across all channels.',
      'technologies': ['Flutter', 'Node.js', 'PostgreSQL', 'Redis'],
      'codeUrl': 'https://github.com/dejen-achenef/social-dashboard-flutter',
      'liveUrl': 'https://social-dashboard-flutter.netlify.app',
    },
    {
      'title': 'Portfolio App',
      'category': 'Mobile Apps',
      'description':
          'A stunning, modern portfolio mobile application showcasing professional work with smooth animations and responsive design. Built with Flutter, featuring interactive elements, dark theme optimization, and seamless user experience across all devices.',
      'technologies': ['Flutter', 'Dart', 'Firebase'],
      'codeUrl': 'https://github.com/dejen-achenef/portfolio-flutter',
      'liveUrl': 'https://dejen-portfolio-flutter.netlify.app',
    },
    {
      'title': 'Food Delivery App',
      'category': 'Mobile Apps',
      'description':
          'A feature-rich food delivery application with real-time order tracking, secure payment processing, and seamless user experience. Includes restaurant discovery, menu browsing, and efficient delivery management system.',
      'technologies': ['Flutter', 'Firebase', 'Google Maps'],
      'codeUrl': 'https://github.com/dejen-achenef/food-delivery-app',
      'liveUrl': 'https://fooddelivery-demo.netlify.app',
    },
    {
      'title': 'Learning Management System',
      'category': 'Full Stack',
      'description':
          'A comprehensive educational platform featuring course management, interactive video streaming, and automated assessment tools. Built with Flutter frontend and Node.js backend to enhance online learning experiences with intuitive interfaces and powerful backend systems.',
      'technologies': ['Flutter', 'Node.js', 'MongoDB', 'Firebase'],
      'codeUrl': 'https://github.com/dejen-achenef/lms-flutter',
      'liveUrl': 'https://lms-flutter.netlify.app',
    },
    {
      'title': 'E-Commerce Web Platform',
      'category': 'Web Apps',
      'description':
          'A modern, responsive e-commerce web application built with React and Node.js. Features include product catalog, shopping cart, user authentication, payment processing, and admin dashboard for managing products and orders.',
      'technologies': ['React', 'Node.js', 'MongoDB', 'Stripe'],
      'codeUrl': 'https://github.com/dejen-achenef/ecommerce-web',
      'liveUrl': 'https://ecommerce-web-demo.netlify.app',
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
    final isMobile = screenWidth < 768;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF0A0A0A),
            Color(0xFF1A1A2E),
            Color(0xFF0A0A0A),
          ],
        ),
      ),
      child: Column(
        children: [
          // Section Header
          Column(
            children: [
              const Text(
                'My Work',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF6C63FF),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Featured ',
                      style: TextStyle(
                        fontSize: isMobile ? 36 : 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: 'Projects',
                      style: TextStyle(
                        fontSize: isMobile ? 36 : 48,
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
              const SizedBox(height: 16),
              SizedBox(
                width: isMobile ? double.infinity : 600,
                child: const Text(
                  'A showcase of my recent projects and creative solutions',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                    height: 1.6,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 60),

          // Category Filter
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _categories.map((category) {
                final isSelected = _selectedCategory == category;
                return Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedCategory = category;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        gradient: isSelected
                            ? const LinearGradient(
                                colors: [Color(0xFF6C63FF), Color(0xFF9C88FF)],
                              )
                            : null,
                        color:
                            isSelected ? null : Colors.white.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: isSelected
                              ? Colors.transparent
                              : Colors.white.withOpacity(0.1),
                        ),
                      ),
                      child: Text(
                        category,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.white70,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          const SizedBox(height: 60),

          // Projects List
          isMobile 
            ? _buildMobileProjectsList()
            : _buildDesktopProjectsGrid(),

          const SizedBox(height: 60),

          // View More Button
          Container(
            width: 200,
            height: 56,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFF6C63FF), width: 2),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () {
                  // Handle view more
                },
                child: const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'View More',
                        style: TextStyle(
                          color: Color(0xFF6C63FF),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.arrow_forward,
                        color: Color(0xFF6C63FF),
                        size: 18,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileProjectsList() {
    return Column(
      children: _filteredProjects.asMap().entries.map((entry) {
        final index = entry.key;
        final project = entry.value;
        return Padding(
          padding: EdgeInsets.only(bottom: index < _filteredProjects.length - 1 ? 20 : 0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.white.withOpacity(0.1),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: _buildMobileProjectCard(project),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildDesktopProjectsGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuery.of(context).size.width > 1200 ? 3 : 2,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
        childAspectRatio: 0.9,
      ),
      itemCount: _filteredProjects.length,
      itemBuilder: (context, index) {
        final project = _filteredProjects[index];
        return Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.white.withOpacity(0.1),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: _buildDesktopProjectCard(project),
        );
      },
    );
  }


  Widget _buildMobileProjectCard(Map<String, dynamic> project) {
    return IntrinsicHeight(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
        // Project Image Placeholder
        Container(
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            gradient: LinearGradient(
              colors: [
                const Color(0xFF6C63FF).withOpacity(0.3),
                const Color(0xFF9C88FF).withOpacity(0.3),
              ],
            ),
          ),
          child: const Center(
            child: Icon(
              Icons.image,
              size: 30,
              color: Colors.white70,
            ),
          ),
        ),

        // Project Details
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
              // Category Badge
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF6C63FF).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: const Color(0xFF6C63FF).withOpacity(0.3),
                  ),
                ),
                child: Text(
                  project['category'],
                  style: const TextStyle(
                    color: Color(0xFF6C63FF),
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              const SizedBox(height: 6),

              // Project Title
              Text(
                project['title'],
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),

              const SizedBox(height: 3),

              // Project Description
              Text(
                project['description'],
                style: const TextStyle(
                  fontSize: 11,
                  color: Colors.white70,
                  height: 1.1,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

              const SizedBox(height: 6),

              // Technologies
              Wrap(
                spacing: 4,
                runSpacing: 4,
                children: (project['technologies'] as List<String>)
                    .take(2)
                    .map((tech) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      tech,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 9,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 6),

              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: _buildActionButton(
                      text: 'Code',
                      icon: Icons.code,
                      onTap: () => _launchUrl(project['codeUrl']),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildActionButton(
                      text: 'Live',
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
    );
  }

  Widget _buildDesktopProjectCard(Map<String, dynamic> project) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Project Image Placeholder
        Expanded(
          flex: 3,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF6C63FF).withOpacity(0.3),
                  const Color(0xFF9C88FF).withOpacity(0.3),
                ],
              ),
            ),
            child: const Center(
              child: Icon(
                Icons.image,
                size: 60,
                color: Colors.white70,
              ),
            ),
          ),
        ),

        // Project Details
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Category Badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF6C63FF).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color(0xFF6C63FF).withOpacity(0.3),
                    ),
                  ),
                  child: Text(
                    project['category'],
                    style: const TextStyle(
                      color: Color(0xFF6C63FF),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // Project Title
                Text(
                  project['title'],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 8),

                // Project Description
                Text(
                  project['description'],
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                    height: 1.4,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 16),

                // Technologies
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: (project['technologies'] as List<String>)
                      .take(3)
                      .map((tech) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        tech,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }).toList(),
                ),

                const SizedBox(height: 16),

                // Action Buttons
                Row(
                  children: [
                    Expanded(
                      child: _buildActionButton(
                        text: 'Code',
                        icon: Icons.code,
                        onTap: () => _launchUrl(project['codeUrl']),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildActionButton(
                        text: 'Live',
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
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required String text,
    required IconData icon,
    required VoidCallback onTap,
    bool isPrimary = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 36,
        decoration: BoxDecoration(
          gradient: isPrimary
              ? const LinearGradient(
                  colors: [Color(0xFF6C63FF), Color(0xFF9C88FF)],
                )
              : null,
          color: isPrimary ? null : Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
          border: isPrimary
              ? null
              : Border.all(
                  color: Colors.white.withOpacity(0.2),
                ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: isPrimary ? Colors.white : const Color(0xFF6C63FF),
                size: 16,
              ),
              const SizedBox(width: 6),
              Text(
                text,
                style: TextStyle(
                  color: isPrimary ? Colors.white : const Color(0xFF6C63FF),
                  fontSize: 12,
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
    try {
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        // Show error message if URL can't be launched
        if (mounted) {
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
