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
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
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
      backgroundColor: const Color(0xFF0A0A0A),
      body: CustomScrollView(
        controller: _scrollController,
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

          // Hero Section
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

          // Portfolio Section
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
          const SliverToBoxAdapter(
            child: Footer(),
          ),
        ],
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
        color: const Color(0xFF0A0A0A).withOpacity(0.95),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }

  @override
  double get maxExtent => 80;

  @override
  double get minExtent => 80;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
