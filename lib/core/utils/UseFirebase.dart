import 'package:cloud_firestore/cloud_firestore.dart';
import '../../data/model_FireStore/firestoremodel.dart';

class UseFirebase
{
 Map<String,dynamic>data;
 UseFirebase({required this.data});

  void ToSendData (id)
  {
    CollectionReference moviesCollection=FirebaseFirestore.instance.collection(FireStoreModel.CollectionName);
    DocumentReference doc=moviesCollection.doc(id);
    doc.set(data).then((_){
    }).onError((error, stackTrace) {
     }).timeout(
     const Duration(microseconds: 500) ,
      onTimeout: ()
        {
          print("Data is : "+data.toString());
          return;
        }
    );

  }

}