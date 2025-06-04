
import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/assets_manager.dart';

class ProviderChild extends ChangeNotifier
{
  bool isDone = false;
  String? Image=AssetsManager.bookMark;
  ChangeIsDone() {
    isDone = !isDone;
    print("The Status is ${isDone}");
    notifyListeners();
  }





  void getBookmarkImage({required bool check,required int index}) {
    print(index);
    Map<num,String>ImageMap=
    {
      index:AssetsManager.bookMark
    };

    if (check)
    {
      ImageMap[index]=AssetsManager.addedBookMark;
      Image=ImageMap[index];
      print("ssssssssssssssssssssssss${Image.toString()}");
      notifyListeners();
    }
    else
      {
        ImageMap[index]=AssetsManager.bookMark;
        Image=ImageMap[index];
        Image=AssetsManager.bookMark;
        notifyListeners();
      }
  }









  // void toggleBookmark(num? id) {
  //   print("sssssssssssssssssssssssss${isDone}");
  //   // تحديث حالة الفيلم
  //   if (bookmarks.containsKey(id)) {
  //     bookmarks[id] = !bookmarks[id]!;
  //   } else {
  //     bookmarks[id] = true;
  //   }
  //   notifyListeners();
  // }
}

// class ProviderChild extends ChangeNotifier {
//   bool isDone = false;
//   String? Iamge = AssetsManager.bookMark;
//
//   ChangeIsDone() {
//     isDone = !isDone;
//     print("The Status is ${isDone}");
//     notifyListeners();
//   }
//
//
//   ChangeImage(num? id) {
//     Map<num?, String>bookMark = {
//       id:
//       isDone ? AssetsManager.addedBookMark : AssetsManager.bookMark
//     };
//
//     Iamge = bookMark[id];
//     notifyListeners();
//   }
// }










  // String  changIamge ({required int index, required int? length})
  // {
  //   var IamgeBookmark=List<String>.generate(length??0, (index)=>AssetsManager.bookMark);
  //   if(isDone)
  //     {
  //       print(isDone);
  //       IamgeBookmark[index]=AssetsManager.addedBookMark;
  //       notifyListeners();
  //     }
  //   else
  //     {
  //       IamgeBookmark[index]=AssetsManager.bookMark;
  //       notifyListeners();
  //
  //     }
  //  return IamgeBookmark[index];
  // }






  // changeImage (num? id)
  // {
  // if(isDone==true)
  //   {
  //     bookedImages[id] =AssetsManager.addedBookMark;
  //     print("Booked");
  //     notifyListeners();
  //
  //   }else{
  //   bookedImages[id]=AssetsManager.bookMark;
  //   print("UnBooked");
  //
  //   notifyListeners();
  //
  //
  // }
  //
  // }
