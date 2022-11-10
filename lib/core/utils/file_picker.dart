import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:tech_blog_app/controllers/file_controller.dart';

Future filePicker() async {
  FileController fileController = Get.put(FileController());
  FilePickerResult? result =
      await FilePicker.platform.pickFiles(type: FileType.image);
  fileController.file.value = result!.files.first;
}
