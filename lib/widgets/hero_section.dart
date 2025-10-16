import 'package:flutter/material.dart';

class HeroSection extends StatefulWidget {
  final Function(int)? onNavigationTap;

  const HeroSection({super.key, this.onNavigationTap});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with TickerProviderStateMixin {
  late AnimationController _typingController;
  late AnimationController _cursorController;
  String _currentText = '';
  int _currentIndex = 0;
  bool _isDeleting = false;

  final List<String> _titles = [
    "Full Stack Cross-Platform App Developer",
    "Flutter App Developer",
    "React Native Developer",
    "Cross-Platform Specialist",
    "Mobile & Web Developer",
    "App Development Expert"
  ];

  @override
  void initState() {
    super.initState();
    _typingController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    _cursorController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..repeat(reverse: true);

    _startTyping();
  }

  void _startTyping() {
    Future.delayed(const Duration(milliseconds: 100), () {
      _typeText();
    });
  }

  void _typeText() {
    if (!mounted) return;

    final currentTitle = _titles[_currentIndex];

    if (_isDeleting) {
      if (_currentText.isNotEmpty) {
        setState(() {
          _currentText = currentTitle.substring(0, _currentText.length - 1);
        });
        Future.delayed(const Duration(milliseconds: 50), _typeText);
      } else {
        setState(() {
          _isDeleting = false;
          _currentIndex = (_currentIndex + 1) % _titles.length;
        });
        Future.delayed(const Duration(milliseconds: 500), _typeText);
      }
    } else {
      if (_currentText.length < currentTitle.length) {
        setState(() {
          _currentText = currentTitle.substring(0, _currentText.length + 1);
        });
        Future.delayed(const Duration(milliseconds: 100), _typeText);
      } else {
        Future.delayed(const Duration(milliseconds: 1500), () {
          if (mounted) {
            setState(() {
              _isDeleting = true;
            });
            _typeText();
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    final isSmallScreen = screenHeight < 600;

    return Container(
      constraints: BoxConstraints(
        minHeight: screenHeight - 1,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF0A0A0A),
            Color(0xFF1A1A2E),
            Color(0xFF16213E),
          ],
        ),
      ),
      child: Stack(
        children: [
          // Animated background particles effect
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.center,
                  radius: 1.0,
                  colors: [
                    const Color(0xFF6C63FF).withValues(alpha: 0.1),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // Main content
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  left: isMobile ? 16 : 24,
                  right: isMobile ? 16 : 24,
                  top: isSmallScreen ? 201 : 241,
                  bottom: isSmallScreen ? 40 : 80,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Greeting
                    const Text(
                      "Hello, I'm",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white70,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Name
                    Flexible(
                      child: RichText(
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Dejen ",
                              style: TextStyle(
                                fontSize:
                                    isMobile ? (isSmallScreen ? 36 : 42) : 64,
                                fontWeight: FontWeight.bold,
                                foreground: Paint()
                                  ..shader = const LinearGradient(
                                    colors: [
                                      Color(0xFF6C63FF),
                                      Color(0xFF9C88FF)
                                    ],
                                  ).createShader(
                                    const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
                                  ),
                              ),
                            ),
                            TextSpan(
                              text: "Achenef",
                              style: TextStyle(
                                fontSize:
                                    isMobile ? (isSmallScreen ? 36 : 42) : 64,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Typewriter effect
                    SizedBox(
                      height: isSmallScreen ? 50 : 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              _currentText,
                              textAlign: TextAlign.center,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize:
                                    isMobile ? (isSmallScreen ? 16 : 18) : 24,
                                color: const Color(0xFF6C63FF),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          AnimatedBuilder(
                            animation: _cursorController,
                            builder: (context, child) {
                              return Opacity(
                                opacity: _cursorController.value,
                                child: Container(
                                  width: 2,
                                  height: isSmallScreen ? 24 : 30,
                                  color: const Color(0xFF6C63FF),
                                  margin: const EdgeInsets.only(left: 4),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Description
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: isMobile ? double.infinity : 600,
                      ),
                      child: RichText(
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.visible,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  "Passionate about crafting exceptional digital solutions that bridge the gap between ",
                              style: TextStyle(
                                fontSize:
                                    isMobile ? (isSmallScreen ? 14 : 15) : 16,
                                color: Colors.white70,
                                height: 1.6,
                              ),
                            ),
                            TextSpan(
                              text: "cutting-edge technology",
                              style: TextStyle(
                                fontSize:
                                    isMobile ? (isSmallScreen ? 14 : 15) : 16,
                                color: Color(0xFF6C63FF),
                                fontWeight: FontWeight.w600,
                                height: 1.6,
                              ),
                            ),
                            TextSpan(
                              text: " and ",
                              style: TextStyle(
                                fontSize:
                                    isMobile ? (isSmallScreen ? 14 : 15) : 16,
                                color: Colors.white70,
                                height: 1.6,
                              ),
                            ),
                            TextSpan(
                              text: "user-centric design",
                              style: TextStyle(
                                fontSize:
                                    isMobile ? (isSmallScreen ? 14 : 15) : 16,
                                color: Color(0xFF6C63FF),
                                fontWeight: FontWeight.w600,
                                height: 1.6,
                              ),
                            ),
                            TextSpan(
                              text:
                                  ". I specialize in building scalable applications that deliver ",
                              style: TextStyle(
                                fontSize:
                                    isMobile ? (isSmallScreen ? 14 : 15) : 16,
                                color: Colors.white70,
                                height: 1.6,
                              ),
                            ),
                            TextSpan(
                              text: "outstanding user experiences",
                              style: TextStyle(
                                fontSize:
                                    isMobile ? (isSmallScreen ? 14 : 15) : 16,
                                color: Color(0xFF6C63FF),
                                fontWeight: FontWeight.w600,
                                height: 1.6,
                              ),
                            ),
                            TextSpan(
                              text:
                                  " while solving real-world problems through innovative development approaches.",
                              style: TextStyle(
                                fontSize:
                                    isMobile ? (isSmallScreen ? 14 : 15) : 16,
                                color: Colors.white70,
                                height: 1.6,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 48),

                    // CTA Buttons
                    isMobile
                        ? Column(
                            children: [
                              _buildButton(
                                text: "Get In Touch",
                                icon: Icons.email,
                                isPrimary: true,
                                onTap: () {
                                  // Navigate to contact section (index 6)
                                  widget.onNavigationTap?.call(6);
                                },
                              ),
                              const SizedBox(height: 16),
                              _buildButton(
                                text: "View My Work",
                                icon: Icons.folder,
                                isPrimary: false,
                                onTap: () {
                                  // Navigate to portfolio section (index 5)
                                  widget.onNavigationTap?.call(5);
                                },
                              ),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildButton(
                                text: "Get In Touch",
                                icon: Icons.email,
                                isPrimary: true,
                                onTap: () {
                                  // Navigate to contact section (index 6)
                                  widget.onNavigationTap?.call(6);
                                },
                              ),
                              const SizedBox(width: 24),
                              _buildButton(
                                text: "View My Work",
                                icon: Icons.folder,
                                isPrimary: false,
                                onTap: () {
                                  // Navigate to portfolio section (index 5)
                                  widget.onNavigationTap?.call(5);
                                },
                              ),
                            ],
                          ),

                    SizedBox(height: isSmallScreen ? 40 : 80),

                    // Scroll indicator
                    Column(
                      children: [
                        Container(
                          width: 2,
                          height: isSmallScreen ? 30 : 40,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                const Color(0xFF6C63FF),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Scroll Down",
                          style: TextStyle(
                            color: Colors.white30,
                            fontSize: isSmallScreen ? 10 : 12,
                          ),
                        ),
                      ],
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

  Widget _buildButton({
    required String text,
    required IconData icon,
    required bool isPrimary,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          gradient: isPrimary
              ? const LinearGradient(
                  colors: [Color(0xFF6C63FF), Color(0xFF9C88FF)],
                )
              : null,
          border: isPrimary
              ? null
              : Border.all(color: const Color(0xFF6C63FF), width: 2),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: TextStyle(
                color: isPrimary ? Colors.white : const Color(0xFF6C63FF),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              icon,
              color: isPrimary ? Colors.white : const Color(0xFF6C63FF),
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _typingController.dispose();
    _cursorController.dispose();
    super.dispose();
  }
}
