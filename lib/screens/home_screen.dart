import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/hero_section.dart';
import '../widgets/about_section.dart';
import '../widgets/services_section.dart';
import '../widgets/skills_section.dart';
import '../widgets/coding_profile_section.dart';
import '../widgets/portfolio_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/footer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final List<GlobalKey> _sectionKeys = [
    GlobalKey(), // Home/Hero
    GlobalKey(), // About
    GlobalKey(), // Services
    GlobalKey(), // Skills
    GlobalKey(), // Coding Profiles
    GlobalKey(), // Projects
    GlobalKey(), // Contact
    GlobalKey(), // Footer
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    // Handle scroll-based navigation updates
    // Implementation can be added later for scroll-based navigation
  }

  void _scrollToSection(int index) {
    if (index < _sectionKeys.length) {
      final context = _sectionKeys[index].currentContext;
      if (context != null) {
        Scrollable.ensureVisible(
          context,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0A0A0A),
              Color(0xFF1A1A2E),
              Color(0xFF16213E),
              Color(0xFF0A0A0A),
            ],
            stops: [0.0, 0.3, 0.7, 1.0],
          ),
        ),
        child: CustomScrollView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          slivers: [
            // Header
            SliverPersistentHeader(
              pinned: true,
              delegate: HeaderDelegate(
                child: Header(
                  onNavigationTap: _scrollToSection,
                ),
              ),
            ),

            // Hero Section (Home)
            SliverToBoxAdapter(
              key: _sectionKeys[0],
              child: HeroSection(
                onNavigationTap: _scrollToSection,
              ),
            ),

            // About Section
            SliverToBoxAdapter(
              key: _sectionKeys[1],
              child: const AboutSection(),
            ),

            // Services Section
            SliverToBoxAdapter(
              key: _sectionKeys[2],
              child: const ServicesSection(),
            ),

            // Skills Section
            SliverToBoxAdapter(
              key: _sectionKeys[3],
              child: const SkillsSection(),
            ),

            // Coding Profile Section
            SliverToBoxAdapter(
              key: _sectionKeys[4],
              child: const CodingProfileSection(),
            ),

            // Projects Section
            SliverToBoxAdapter(
              key: _sectionKeys[5],
              child: const PortfolioSection(),
            ),

            // Contact Section
            SliverToBoxAdapter(
              key: _sectionKeys[6],
              child: const ContactSection(),
            ),

            // Footer
            SliverToBoxAdapter(
              key: _sectionKeys[7],
              child: Footer(
                onNavigationTap: _scrollToSection,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class HeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  HeaderDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF0A0A0A).withValues(alpha: 0.9),
        border: Border(
          bottom: BorderSide(
            color: Colors.white.withValues(alpha: 0.1),
            width: 1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }

  @override
  double get maxExtent => 78;

  @override
  double get minExtent => 78;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
