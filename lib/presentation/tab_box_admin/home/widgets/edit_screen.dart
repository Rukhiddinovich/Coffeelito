import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffeelito/data/firebase_service/firebase_upload.dart';
import 'package:coffeelito/data/models/universal_data.dart';
import 'package:coffeelito/utils/size.dart';
import 'package:coffeelito/utils/ui_utils/global_text_fields.dart';
import 'package:coffeelito/utils/ui_utils/loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  ImagePicker picker = ImagePicker();

  List<dynamic> images = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            20.ph,
            GlobalTextField(
                hintText: "Name",
                textAlign: TextAlign.start,
                controller: TextEditingController(),
                maxLines: 1),
            20.ph,
            GlobalTextField(
                hintText: "Description",
                textAlign: TextAlign.start,
                controller: TextEditingController(),
                maxLines: 1),
            20.ph,
            GlobalTextField(
                hintText: "Price",
                textAlign: TextAlign.start,
                controller: TextEditingController(),
                maxLines: 1),
            20.ph,
            images.isEmpty
                ? ElevatedButton(
                    onPressed: () {
                      showGlobalBottomSheetDialog(context);
                    },
                    child: const Text("Select image"))
                : CachedNetworkImage(imageUrl: images.first),
            ElevatedButton(
                onPressed: () {}, child: const Text("Delete product")),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () {}, child: Text("Edit")),
            )
          ],
        ),
      ),
    );
  }

  void showGlobalBottomSheetDialog(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(24),
          height: 200,
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Column(
            children: [
              ListTile(
                onTap: () async {
                  await getFromGallery(context);
                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                },
                leading: const Icon(
                  Icons.photo,
                  color: Colors.white,
                ),
                title: Text("Select from Gallery",
                    style: TextStyle(color: Colors.white, fontSize: 20.sp)),
              ),
              ListTile(
                onTap: () async {
                  await getFromCamera(context);
                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                },
                leading: const Icon(
                  Icons.photo_camera,
                  color: Colors.white,
                ),
                title: Text("Select from Camera",
                    style: TextStyle(color: Colors.white, fontSize: 20.sp)),
              )
            ],
          ),
        );
      },
    );
  }

  Future<void> getFromGallery(BuildContext context) async {
    showLoading(context: context);
    List<XFile?> xFiles = await picker.pickMultiImage(
      maxHeight: 512,
      maxWidth: 512,
    );
    if (context.mounted) {
      await uploadCoffeeImages(context: context, images: xFiles);
    }
  }

  Future<void> getFromCamera(BuildContext context) async {
    showLoading(context: context);
    List<XFile?> xFile = [
      await picker.pickImage(
        source: ImageSource.camera,
        maxHeight: 512,
        maxWidth: 512,
      )
    ];
    if (context.mounted) {
      await uploadCoffeeImages(
        context: context,
        images: xFile,
      );
    }
  }

  Future<void> uploadCoffeeImages({
    required BuildContext context,
    required List<XFile?> images,
  }) async {
    showLoading(context: context);

    for (var element in images) {
      UniversalData data = await FileUploader.imageUploader(element!);
      if (data.error.isEmpty) {
        images.add(data.data);
      }
    }

    if (context.mounted) {
      hideLoading(dialogContext: context);
      hideLoading(dialogContext: context);
    }
  }
}
