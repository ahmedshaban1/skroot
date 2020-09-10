import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:skroot/navigator/named-navigator_impl.dart';

import 'loading_dialog.dart';

class ImagesPreviewPage extends StatelessWidget {
  final List<dynamic> images;

  const ImagesPreviewPage({Key key, this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var selectedIndex = 0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              NamedNavigatorImpl().pop();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(
            Icons.arrow_downward,
            color: Colors.white,
          ),
          onPressed: () async {
            try {
              showLoadingDialog(context);
              // Saved with this method.
              var imageId =
                  await ImageDownloader.downloadImage(images[selectedIndex]);
              Navigator.of(context).pop();
              Fluttertoast.showToast(
                  msg: "تم تحميل الصورة بنجاح",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
              if (imageId == null) {
                return;
              }

              // Below is a method of obtaining saved image information.
//              var fileName = await ImageDownloader.findName(imageId);
//              var path = await ImageDownloader.findPath(imageId);
//              var size = await ImageDownloader.findByteSize(imageId);
//              var mimeType = await ImageDownloader.findMimeType(imageId);
            } catch (error) {
              print(error);
            }
          }),
      body: Container(
          child: PhotoViewGallery.builder(
        scrollPhysics: const BouncingScrollPhysics(),
        builder: (BuildContext context, int index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: NetworkImage(images[index]),
            initialScale: PhotoViewComputedScale.contained,
          );
        },
        enableRotation: true,
        itemCount: images.length,
        loadingBuilder: (context, event) => Center(
          child: Container(
            width: 20.0,
            height: 20.0,
            child: CircularProgressIndicator(
              value: event == null
                  ? 0
                  : event.cumulativeBytesLoaded / event.expectedTotalBytes,
            ),
          ),
        ),
        onPageChanged: (index) {
          selectedIndex = index;
        },
      )),
    );
  }
}
