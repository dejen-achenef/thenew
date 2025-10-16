import 'package:flutter/material.dart';

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection>
    with TickerProviderStateMixin {
  late List<AnimationController> _skillControllers;
  late List<AnimationController> _floatingControllers;

  final List<Map<String, dynamic>> _skills = const [
    {
      'name': 'Flutter',
      'level': 0.9,
      'icon': Icons.phone_android,
      'gradient': [Color(0xFF6C63FF), Color(0xFF9C88FF)],
    },
    {
      'name': 'Dart',
      'level': 0.85,
      'icon': Icons.code,
      'gradient': [Color(0xFF0175C2), Color(0xFF00BCD4)],
    },
    {
      'name': 'Swift',
      'level': 0.8,
      'icon': Icons.phone_iphone,
      'gradient': [Color(0xFFFA7343), Color(0xFFFF6B9D)],
    },
    {
      'name': 'JavaScript',
      'level': 0.85,
      'icon': Icons.code,
      'gradient': [Color(0xFFF7DF1E), Color(0xFFFF9800)],
    },
    {
      'name': 'Node.js',
      'level': 0.8,
      'icon': Icons.code,
      'gradient': [Color(0xFF339933), Color(0xFF4CAF50)],
    },
    {
      'name': 'Docker',
      'level': 0.75,
      'icon': Icons.dock,
      'gradient': [Color(0xFF2496ED), Color(0xFF00BCD4)],
    },
    {
      'name': 'GitHub',
      'level': 0.9,
      'icon': Icons.fork_right,
      'gradient': [Color(0xFF333333), Color(0xFF666666)],
    },
    {
      'name': 'Firebase',
      'level': 0.8,
      'icon': Icons.cloud,
      'gradient': [Color(0xFFFFCA28), Color(0xFFFF9800)],
    },
    {
      'name': 'MongoDB',
      'level': 0.7,
      'icon': Icons.storage,
      'gradient': [Color(0xFF47A248), Color(0xFF4CAF50)],
    },
    {
      'name': 'PostgreSQL',
      'level': 0.75,
      'icon': Icons.storage,
      'gradient': [Color(0xFF336791), Color(0xFF2196F3)],
    },
    {
      'name': 'REST APIs',
      'level': 0.85,
      'icon': Icons.api,
      'gradient': [Color(0xFF6C63FF), Color(0xFF9C88FF)],
    },
    {
      'name': 'Express',
      'level': 0.75,
      'icon': Icons.api,
      'gradient': [Color(0xFF000000), Color(0xFF424242)],
    },
  ];

  @override
  void initState() {
    super.initState();
    _skillControllers = List.generate(
      _skills.length,
      (index) => AnimationController(
        duration: const Duration(milliseconds: 1500),
        vsync: this,
      ),
    );

    _floatingControllers = List.generate(
      _skills.length,
      (index) => AnimationController(
        duration: Duration(milliseconds: 2000 + (index * 200)),
        vsync: this,
      ),
    );

    // Start floating animations
    for (var controller in _floatingControllers) {
      controller.repeat(reverse: true);
    }
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
                'Technical Expertise',
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
                        text: 'Skills',
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
                  'I work with a diverse range of cutting-edge technologies and modern development tools to build exceptional digital experiences. From frontend frameworks to backend services, I leverage the best tools available to create scalable, performant, and user-friendly applications that meet the highest industry standards.',
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

          SizedBox(height: isSmallScreen ? 40 : 80),

          // Skills Grid Container
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
                          isMobile ? 2 : (constraints.maxWidth > 1200 ? 5 : 4),
                      crossAxisSpacing: isMobile ? 12 : 16,
                      mainAxisSpacing: isMobile ? 12 : 16,
                      childAspectRatio: 1,
                    ),
                    itemCount: _skills.length,
                    itemBuilder: (context, index) {
                      final skill = _skills[index];
                      return _buildSkillCard(skill, index);
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

  Widget _buildSkillCard(Map<String, dynamic> skill, int index) {
    final gradient = skill['gradient'] as List<Color>;

    return AnimatedBuilder(
      animation: Listenable.merge(
          [_skillControllers[index], _floatingControllers[index]]),
      builder: (context, child) {
        final floatingOffset = (_floatingControllers[index].value - 0.5) * 8;

        return Transform.translate(
          offset: Offset(0, floatingOffset),
          child: MouseRegion(
            onEnter: (_) => _skillControllers[index].forward(),
            onExit: (_) => _skillControllers[index].reverse(),
            child: AnimatedScale(
              scale: _skillControllers[index].value * 0.05 + 1.0,
              duration: const Duration(milliseconds: 200),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      gradient[0].withValues(alpha: 0.15),
                      gradient[1].withValues(alpha: 0.1),
                      gradient[0].withValues(alpha: 0.05),
                    ],
                    stops: const [0.0, 0.5, 1.0],
                  ),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: gradient[0].withValues(alpha: 0.3),
                    width: 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: gradient[0].withValues(alpha: 0.2),
                      blurRadius: 20 + (_skillControllers[index].value * 10),
                      spreadRadius: 2 + (_skillControllers[index].value * 3),
                      offset:
                          Offset(0, 8 + (_skillControllers[index].value * 4)),
                    ),
                    BoxShadow(
                      color: gradient[1].withValues(alpha: 0.15),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Skill Icon with Enhanced Design
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            gradient[0].withValues(alpha: 0.3),
                            gradient[1].withValues(alpha: 0.2),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: gradient[0].withValues(alpha: 0.4),
                          width: 1.5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: gradient[0].withValues(alpha: 0.3),
                            blurRadius:
                                15 + (_skillControllers[index].value * 5),
                            offset: Offset(
                                0, 6 + (_skillControllers[index].value * 2)),
                          ),
                        ],
                      ),
                      child: Icon(
                        skill['icon'],
                        color: gradient[0],
                        size: 28,
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Skill Name
                    Text(
                      skill['name'],
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 0.5,
                        shadows: [
                          Shadow(
                            color: gradient[0].withValues(alpha: 0.3),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: 16),

                    // Progress Bar with Enhanced Design
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 8),
                        Container(
                          height: 6,
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: FractionallySizedBox(
                            alignment: Alignment.centerLeft,
                            widthFactor:
                                skill['level'] * _skillControllers[index].value,
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    gradient[0],
                                    gradient[1],
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(3),
                                boxShadow: [
                                  BoxShadow(
                                    color: gradient[0].withValues(alpha: 0.6),
                                    blurRadius: 6,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    for (var controller in _skillControllers) {
      controller.dispose();
    }
    for (var controller in _floatingControllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
