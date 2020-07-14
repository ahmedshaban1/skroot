import 'dart:io';

import 'package:image_picker/image_picker.dart';


class ImagePickerHelper  {

  Future<File> chooseImageFromGallery() async {
    return await _getImage(ImageSource.gallery);
  }

  Future<File> takePicture() async {
    return await _getImage(ImageSource.camera);
  }

  Future<File> _getImage(ImageSource imageSource) async {
    return await ImagePicker.pickImage(source: imageSource);
  }

//  Future<UploadImageRequest> getUploadImageRequest(
//      File image, String referenceType) {
//    List<int> imageBytes = image.readAsBytesSync();
//    return decodeImageFromList(imageBytes).then((decodedImage) {
//      return UploadImageRequest(
//          referenceType: referenceType,
//          imagePayload: base64Encode(imageBytes),
//          mimeType: ImageMimeTypes.JPEG_IMAGE.value,
//          resolution: Resolution(
//              width: decodedImage.width, height: decodedImage.height));
//    });
//  }
}
