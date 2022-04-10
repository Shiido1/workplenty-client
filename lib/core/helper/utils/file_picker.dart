// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:client/core/helper/configs/instances.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_document_picker/flutter_document_picker.dart';

class WorkplentyFilePicker {
  static Future<List<String?>> returnPickedFiles() async {
    FilePickerResult? _result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc'],
        allowMultiple: true);
    _result!.files.map((e) => logger.d(e.path)).toList();
    return _result.paths;
  }
}
