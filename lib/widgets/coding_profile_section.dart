import 'package:flutter/material.dart';

class CodingProfileSection extends StatelessWidget {
  const CodingProfileSection({super.key});

  final List<Map<String, dynamic>> _platforms = const [
    {
      'name': 'LeetCode',
      'icon': Icons.code,
      'color': Color(0xFFFFA116),
      'problems': 150,
      'rating': 1650,
    },
    {
      'name': 'CodeChef',
      'icon': Icons.emoji_events,
      'color': Color(0xFF7B241C),
      'problems': 100,
      'rating': 3,
    },
    {
      'name': 'GitHub',
      'icon': Icons.fork_right,
      'color': Color(0xFF333333),
      'problems': 50,
      'rating': 4,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
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
                'Competitive Programming',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF6C63FF),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 12),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Coding ',
                      style: TextStyle(
                        fontSize: isMobile ? 36 : 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: 'Profiles',
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
              const SizedBox(height: 12),
              SizedBox(
                width: isMobile ? double.infinity : 600,
                child: const Text(
                  'My journey in competitive programming and software development has been driven by a passion for solving complex problems and continuously improving my coding skills. Through various platforms and challenges, I have honed my algorithmic thinking and problem-solving abilities, which directly enhance my ability to build efficient and optimized applications.',
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

          const SizedBox(height: 30),

          // Platforms Grid Container
          Center(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: isMobile ? double.infinity : 1200,
              ),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isMobile ? 1 : (screenWidth > 1200 ? 3 : 2),
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio:
                      isMobile ? 1.1 : (screenWidth > 1200 ? 0.9 : 1.0),
                ),
                itemCount: _platforms.length,
                itemBuilder: (context, index) {
                  final platform = _platforms[index];
                  return _buildPlatformCard(context, platform, index);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlatformCard(
      BuildContext context, Map<String, dynamic> platform, int index) {
    return Container(
      padding: const EdgeInsets.all(20),
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
          // Platform Header
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: platform['color'].withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  platform['icon'],
                  color: platform['color'],
                  size: 20,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      platform['name'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'Competitive Platform',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Statistics
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  'Problems',
                  '${platform['problems']}',
                  Icons.assignment_turned_in,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  'Rating',
                  '${platform['rating']}',
                  Icons.star,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Visit Profile Button
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Coming Soon!'),
                  duration: Duration(seconds: 2),
                  backgroundColor: Color(0xFF6C63FF),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              height: 36,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    platform['color'],
                    platform['color'].withOpacity(0.8),
                  ],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Visit Profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(
                      Icons.open_in_new,
                      color: Colors.white,
                      size: 22,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String label, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.1),
        ),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: const Color(0xFF6C63FF),
            size: 18,
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            label,
            style: const TextStyle(
              fontSize: 10,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}
