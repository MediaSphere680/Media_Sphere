import 'package:flutter/material.dart';
import '../widgets/parallax_widget.dart';
import '../modules/video_module.dart';
import '../modules/music_module.dart';
import '../modules/docs_module.dart';
import '../modules/pdf_module.dart';
import '../modules/ppt_module.dart';
import '../modules/epub_module.dart';

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
    final double itemSize = MediaQuery.of(context).size.width / 4;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/img.jpg', fit: BoxFit.cover),
          Container(
            color: Colors.black.withOpacity(0.5), // Translucent overlay
          ),
          Center(
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 40,
              runSpacing: 40,
              children:
                  options.map((option) {
                    return MouseRegion(
                      onEnter: (_) {},
                      onExit: (_) {},
                      child: GestureDetector(
                        onTap:
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => option['module'],
                              ),
                            ),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          height: itemSize,
                          width: itemSize,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(
                              0.2,
                            ), // Translucent card
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: MouseRegion(
                            onEnter: (_) {},
                            onExit: (_) {},
                            child: AnimatedScale(
                              scale: 1.1,
                              duration: const Duration(milliseconds: 300),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    option['icon'],
                                    size: 60,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(height: 15),
                                  Text(
                                    option['title'],
                                    style: const TextStyle(
                                      fontSize: 22,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
