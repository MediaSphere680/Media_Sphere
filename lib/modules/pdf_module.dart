import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'dart:io';

class PdfModule extends StatefulWidget {
  const PdfModule({super.key});

  @override
  _PdfModuleState createState() => _PdfModuleState();
}

class _PdfModuleState extends State<PdfModule> {
  String? _filePath;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null && result.files.single.path != null) {
      setState(() {
        _filePath = result.files.single.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PDF Viewer Module')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: _pickFile, child: const Text('Open PDF')),
          const SizedBox(height: 20),
          Expanded(
            child:
                _filePath != null
                    ? SfPdfViewer.file(File(_filePath!))
                    : const Center(child: Text('No PDF selected')),
          ),
        ],
      ),
    );
  }
}
