import 'package:flutter/material.dart';

void main() {
  runApp(const MediaSphereApp());
}

class MediaSphereApp extends StatelessWidget {
  const MediaSphereApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontFamily: 'Futured', color: Colors.black),
          bodyMedium: TextStyle(fontFamily: 'Futured', color: Colors.black),
        ),
      ),
      home: const LandingPage(),
    );
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/img.jpg', fit: BoxFit.cover),
          Center(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SelectionPage(),
                    ),
                  );
                },
                child: const Text(
                  'Media Sphere',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    letterSpacing: 2,
                    fontFamily: 'Futured',
                    shadows: [
                      Shadow(
                        blurRadius: 20,
                        color: Colors.black,
                        offset: Offset(0, 0),
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
}

class SelectionPage extends StatelessWidget {
  const SelectionPage({super.key});

  final List<Map<String, dynamic>> options = const [
    {'title': 'Video', 'icon': Icons.video_library, 'module': VideoModule()},
    {'title': 'Music', 'icon': Icons.music_note, 'module': MusicModule()},
    {'title': 'Docs', 'icon': Icons.insert_drive_file, 'module': DocsModule()},
    {'title': 'PDF', 'icon': Icons.picture_as_pdf, 'module': PdfModule()},
    {'title': 'PowerPoint', 'icon': Icons.slideshow, 'module': PptModule()},
    {'title': 'EPUB', 'icon': Icons.book, 'module': EpubModule()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/img.jpg', fit: BoxFit.cover),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Select Media Type',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontFamily: 'Futured',
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SingleChildScrollView(
                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            childAspectRatio: 1,
                          ),
                      itemCount: options.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => options[index]['module'],
                              ),
                            );
                          },
                          child: ParallaxWidget(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(
                                  0.7,
                                ), // Transparency
                                borderRadius: BorderRadius.circular(
                                  30,
                                ), // Pebble shape
                                border: Border.all(
                                  color: Colors.black45,
                                  width: 2,
                                ),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 15,
                                    spreadRadius: 2,
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    options[index]['icon'],
                                    size: 60,
                                    color: Colors.black,
                                  ),
                                  const SizedBox(height: 15),
                                  Text(
                                    options[index]['title'],
                                    style: const TextStyle(
                                      fontSize: 22,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Futured',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ParallaxWidget extends StatelessWidget {
  final Widget child;

  const ParallaxWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: 0.0, end: 0.05),
      duration: const Duration(seconds: 1),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, value * 100),
          child: child,
        );
      },
      child: child,
    );
  }
}

// Placeholder modules for your team to work on
class VideoModule extends StatelessWidget {
  const VideoModule({super.key});

  @override
  Widget build(BuildContext context) {
    return const ModuleScreen(title: 'Video Player Module');
  }
}

class MusicModule extends StatelessWidget {
  const MusicModule({super.key});

  @override
  Widget build(BuildContext context) {
    return const ModuleScreen(title: 'Music Player Module');
  }
}

class DocsModule extends StatelessWidget {
  const DocsModule({super.key});

  @override
  Widget build(BuildContext context) {
    return const ModuleScreen(title: 'Docs Viewer Module');
  }
}

class PdfModule extends StatelessWidget {
  const PdfModule({super.key});

  @override
  Widget build(BuildContext context) {
    return const ModuleScreen(title: 'PDF Viewer Module');
  }
}

class PptModule extends StatelessWidget {
  const PptModule({super.key});

  @override
  Widget build(BuildContext context) {
    return const ModuleScreen(title: 'PowerPoint Viewer Module');
  }
}

class EpubModule extends StatelessWidget {
  const EpubModule({super.key});

  @override
  Widget build(BuildContext context) {
    return const ModuleScreen(title: 'EPUB Reader Module');
  }
}

// Reusable Module Screen
class ModuleScreen extends StatelessWidget {
  final String title;
  const ModuleScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(title, style: const TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Text(
          '$title Coming Soon!',
          style: const TextStyle(fontSize: 30, color: Colors.white70),
        ),
      ),
    );
  }
}
