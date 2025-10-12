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
                'What I Do',
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
                      text: 'My ',
                      style: TextStyle(
                        fontSize: isMobile ? 36 : 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: 'Services',
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
                  'Comprehensive digital solutions tailored to your business needs',
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

          const SizedBox(height: 80),

          // Services Grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 1 : (screenWidth > 1200 ? 3 : 2),
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              childAspectRatio: isMobile ? 1.1 : 0.9,
            ),
            itemCount: _services.length,
            itemBuilder: (context, index) {
              final service = _services[index];
              return _buildServiceCard(service, index);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(Map<String, dynamic> service, int index) {
    return Container(
      padding: const EdgeInsets.all(32),
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
      child: Column(
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

          const SizedBox(height: 24),

          // Title
          Text(
            service['title'],
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 16),

          // Description
          Text(
            service['description'],
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white70,
              height: 1.6,
            ),
          ),

          const SizedBox(height: 24),

          // Features
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: (service['features'] as List<String>).map((feature) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFF6C63FF).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color(0xFF6C63FF).withOpacity(0.3),
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

          const Spacer(),

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
                const SizedBox(width: 8),
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
