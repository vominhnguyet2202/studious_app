import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

import '../firebase_ref/refrences.dart';

// Reference get firebaseStorage => FirebaseStorage.instance.ref();

class FireBaseStorageService extends GetxService {
  // Load an image from firebase storage
  Future<String?> getImage(String? imgName) async {
    if (imgName == null) {
      return null;
    }
    final storageRef =
        FirebaseStorage.instance.ref().child("question_paper_image");
    final listResult = await storageRef.listAll();
    try {
      var urlRef = firebaseStorage
          .child("question_paper_image")
          .child('/${imgName.toLowerCase()}.png');
      var imgUrl = await urlRef.getDownloadURL();
      return imgUrl;
    } catch (e) {
      return null;
    }
  }
}



// class FireBaseStorageService extends GetxService {
//   Future<String?> getImage(String? imgName) async {
//     if (imgName == null) {
//       return null;
//     }
//     try {
//       var urlRef = firebaseStorage
//           .child("question_paper_image")
//           .child('/${imgName.toLowerCase()}.png');
//       var imgUrl = await urlRef.getDownloadURL();
//       return imgUrl;
//     } catch (e) {
//       return null;
//     }
//   }
// }
