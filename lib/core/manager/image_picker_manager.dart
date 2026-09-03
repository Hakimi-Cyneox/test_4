import 'package:image_picker/image_picker.dart';

class ImagePickerManager {
  ImagePickerManager._privateConstructor();

  static final ImagePickerManager instance = ImagePickerManager._privateConstructor();

  final ImagePicker _picker = ImagePicker();

  Future<List<XFile>> pickMultiImage({double? maxWidth, double? maxHeight, int? quality}) async {
    try {
      final List<XFile> pickedFileList = await _picker.pickMultiImage(
        maxWidth: maxWidth,
        maxHeight: maxHeight,
        imageQuality: quality,
      );
      return pickedFileList;
    } catch (e) {
      return [];
    }
  }

  // pick single image from gallery and take picture from camera - rear or front
  Future<XFile?> pickImage(ImageSource source, {double? maxWidth, double? maxHeight, int? quality, CameraDevice preferredCameraDevice = CameraDevice.rear,}) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
        maxWidth: maxWidth,
        maxHeight: maxHeight,
        imageQuality: quality,
        preferredCameraDevice: preferredCameraDevice,
      );
      return pickedFile;
    } catch (e) {
      return null;
    }
  }

  List<XFile?> setImageFileListFromFile(XFile? value) {
    if (value == null) {
      return [];
    } else {
      return <XFile>[value];
    }
  }

}
