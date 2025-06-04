import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_style.dart';
import 'package:movies_app/core/utils/color_manager.dart';
import 'package:movies_app/presentation/screens/home/tabs/watchList_tab/widget/watch_widget.dart';
import '../../../../../data/model_FireStore/firestoremodel.dart';
class WatchlistTab extends StatelessWidget {
  const WatchlistTab({super.key});

  @override
  Widget build(BuildContext context) {
    List<FireStoreModel>dataModel;
    return Container(
      padding: REdgeInsets.symmetric(horizontal: 20, ),
      color: ColorsManager.black,
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection(FireStoreModel.CollectionName).snapshots(),
       builder: (context, snapshot)
       {
         if (snapshot.connectionState == ConnectionState.waiting) {
           return const Center(child: CircularProgressIndicator());
         }
         if (snapshot.hasError) {
           return const Center(child: Text("Error loading data"));
         }
         List<QueryDocumentSnapshot>documents=snapshot.data!.docs;
        dataModel= documents.map((e)
         {
           Map<String,dynamic>json=e.data() as Map<String,dynamic>;
           FireStoreModel fireStoreModel =FireStoreModel.readfirestore(json);
           return fireStoreModel;
         }).toList();
          return  Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 52.h,),
              Text('Watch List', style: AppStyle.titles,),
              Expanded(child: ListView.builder(
                itemBuilder:(context, index) {
                  if(dataModel[index].isdone==true)
                  {
                    return WatchWidget(fireStoreModel: dataModel[index],);
                  }
                  return null;
                }, itemCount: dataModel.length,)


              )
            ],
          );

       },
      ),
    );
  }
}
