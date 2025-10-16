import 'package:flutter/material.dart';

class AboutSection extends StatefulWidget {
  const AboutSection({super.key});

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
  final List<Map<String, dynamic>> _infoItems = [
    {
      'icon': Icons.person,
      'title': 'Name',
      'value': 'Dejen Achenef',
    },
    {
      'icon': Icons.location_on,
      'title': 'Location',
      'value': 'Addis Ababa, Ethiopia',
    },
    {
      'icon': Icons.email,
      'title': 'Email',
      'value': 'dejenacheneffentedese@gmail.com',
    },
    {
      'icon': Icons.phone,
      'title': 'Phone',
      'value': '+251900604913',
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = screenWidth < 768;
    final isSmallScreen = screenHeight < 600;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isSmallScreen ? 60 : 100,
        horizontal: isMobile ? 16 : 24,
      ),
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
        mainAxisSize: MainAxisSize.min,
        children: [
          // Section Header
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Professional Profile',
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
                        text: 'Full Stack Cross-Platform ',
                        style: TextStyle(
                          fontSize: isMobile ? (isSmallScreen ? 24 : 28) : 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: 'App Developer',
                        style: TextStyle(
                          fontSize: isMobile ? (isSmallScreen ? 24 : 28) : 36,
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
            ],
          ),

          SizedBox(height: isSmallScreen ? 40 : 80),

          // Content Grid
          isMobile ? _buildMobileLayout() : _buildDesktopLayout(),
        ],
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        // Profile Image
        _buildProfileImage(),

        const SizedBox(height: 40),

        // Content
        _buildContent(),
      ],
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Profile Image Column
        Expanded(
          flex: 1,
          child: _buildProfileImage(),
        ),

        const SizedBox(width: 60),

        // Content Column
        Expanded(
          flex: 1,
          child: _buildContent(),
        ),
      ],
    );
  }

  Widget _buildProfileImage() {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    final imageSize = isMobile ? 250.0 : 300.0;

    return Center(
      child: Container(
        width: imageSize,
        height: imageSize,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [Color(0xFF6C63FF), Color(0xFF9C88FF)],
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF6C63FF).withValues(alpha: 0.3),
              blurRadius: 30,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Container(
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: const DecorationImage(
              image: AssetImage('assets/images/dejen.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'Full Stack Cross-Platform ',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              TextSpan(
                text: 'App Developer',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6C63FF),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        // Description
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text:
                    'I am a passionate Full Stack Cross-Platform App Developer specializing in creating seamless digital experiences across multiple platforms. Currently working as a developer on the Renter mobile app, I bring ',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                  height: 1.6,
                ),
              ),
              TextSpan(
                text: '1+ years',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF6C63FF),
                  fontWeight: FontWeight.w600,
                  height: 1.6,
                ),
              ),
              TextSpan(
                text: ' of hands-on experience, I have successfully delivered ',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                  height: 1.6,
                ),
              ),
              TextSpan(
                text: '10+ cross-platform applications',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF6C63FF),
                  fontWeight: FontWeight.w600,
                  height: 1.6,
                ),
              ),
              TextSpan(
                text:
                    ' that work flawlessly on web, iOS, and Android platforms. My expertise in Flutter, React Native, React, and Node.js enables me to build ',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                  height: 1.6,
                ),
              ),
              TextSpan(
                text: 'unified, scalable, and high-performance applications',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF6C63FF),
                  fontWeight: FontWeight.w600,
                  height: 1.6,
                ),
              ),
              TextSpan(
                text:
                    ' that provide consistent user experiences across all devices and platforms.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 40),

        // Info Grid
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isMobile ? 1 : 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: isMobile ? 4 : 3,
          ),
          itemCount: _infoItems.length,
          itemBuilder: (context, index) {
            final item = _infoItems[index];
            return Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.1),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    item['icon'],
                    color: const Color(0xFF6C63FF),
                    size: 18,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          item['title'],
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          item['value'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),

        const SizedBox(height: 40),

        // Download CV Button
        Container(
          width: double.infinity,
          height: 56,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF6C63FF), Color(0xFF9C88FF)],
            ),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF6C63FF).withValues(alpha: 0.3),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(30),
              onTap: () {
                // Handle CV download
              },
              child: const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.download,
                      color: Colors.white,
                      size: 20,
                    ),
                    SizedBox(width: 12),
                    Text(
                      'Download CV',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
