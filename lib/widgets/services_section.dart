import 'package:flutter/material.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  final List<Map<String, dynamic>> _services = const [
    {
      'icon': Icons.web,
      'title': 'Backend Development',
      'description':
          'I build robust, scalable backend systems and APIs that power Flutter applications. From RESTful services to real-time communication, I create efficient server-side solutions that ensure optimal performance and seamless data flow.',
      'features': ['Node.js', 'Express.js', 'Firebase', 'MongoDB'],
    },
    {
      'icon': Icons.phone_android,
      'title': 'Cross-Platform App Development',
      'description':
          'Specializing in cross-platform mobile app development, I build native-feeling applications that work seamlessly across iOS and Android devices, ensuring optimal performance and user experience on all platforms.',
      'features': ['Flutter', 'React Native', 'Dart', 'Firebase'],
    },
    {
      'icon': Icons.cloud,
      'title': 'Cloud Solutions',
      'description':
          'I design and implement robust cloud infrastructure solutions that scale with your business needs. From deployment automation to database management, I ensure your applications run smoothly in the cloud environment.',
      'features': ['Google Cloud', 'Docker', 'Firebase'],
    },
    {
      'icon': Icons.storage,
      'title': 'Database Management',
      'description':
          'Designing and implementing efficient database solutions that ensure data integrity, performance, and scalability. I work with both SQL and NoSQL databases to create robust data architectures that support your application needs.',
      'features': ['MongoDB', 'PostgreSQL', 'MySQL', 'Database Design'],
    },
    {
      'icon': Icons.api,
      'title': 'API Development',
      'description':
          'Building secure, efficient, and well-documented APIs that serve as the backbone of modern applications. I develop RESTful services and GraphQL endpoints that enable seamless data exchange and system integration.',
      'features': ['REST APIs', 'GraphQL', 'Microservices', 'Database Design'],
    },
    {
      'icon': Icons.security,
      'title': 'Security & Testing',
      'description':
          'Implementing comprehensive security measures and thorough testing strategies to ensure your applications are secure, reliable, and performant. I follow industry best practices for code quality and application security.',
      'features': [
        'Security Audit',
        'Unit Testing',
        'Integration Testing',
        'CI/CD'
      ],
    },
  ];

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
                'What I Do',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF6C63FF),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
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
                        text: 'Services',
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
              const SizedBox(height: 8),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: isMobile ? double.infinity : 600,
                ),
                child: Text(
                  'Comprehensive digital solutions tailored to your business needs',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: isMobile ? (isSmallScreen ? 16 : 18) : 18,
                    color: Colors.white70,
                    height: 1.6,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Services Grid Container
          Center(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: isMobile ? double.infinity : 1200,
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          isMobile ? 1 : (constraints.maxWidth > 1200 ? 3 : 2),
                      crossAxisSpacing: isMobile ? 16 : 20,
                      mainAxisSpacing: isMobile ? 16 : 20,
                      childAspectRatio: isMobile
                          ? 1.2
                          : (constraints.maxWidth > 1200 ? 0.85 : 0.9),
                    ),
                    itemCount: _services.length,
                    itemBuilder: (context, index) {
                      final service = _services[index];
                      return _buildServiceCard(service, index);
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(Map<String, dynamic> service, int index) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.1),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF6C63FF), Color(0xFF9C88FF)],
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              service['icon'],
              color: Colors.white,
              size: 28,
            ),
          ),

          const SizedBox(height: 16),

          // Title
          Text(
            service['title'],
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 6),

          // Description
          Text(
            service['description'],
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white70,
              height: 1.5,
            ),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),

          const SizedBox(height: 8),

          // Features
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: (service['features'] as List<String>).map((feature) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFF6C63FF).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: const Color(0xFF6C63FF).withValues(alpha: 0.3),
                  ),
                ),
                child: Text(
                  feature,
                  style: const TextStyle(
                    color: Color(0xFF6C63FF),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 8),

          // Learn More Button
          GestureDetector(
            onTap: () {
              // Handle learn more
            },
            child: Row(
              children: [
                const Text(
                  'Learn More',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF6C63FF),
                  ),
                ),
                const SizedBox(width: 6),
                const Icon(
                  Icons.arrow_forward,
                  color: Color(0xFF6C63FF),
                  size: 16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
