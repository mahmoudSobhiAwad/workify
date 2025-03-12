import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:workify/features/admin/company/data/models/company_model.dart';
import 'package:workify/shared/models/image_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'company_setup_state.dart';

class CompanySetupCubit extends Cubit<CompanySetupState> {
  CompanySetupCubit({required this.companyId}) : super(CompanySetupInitial());
  final String companyId;
  final ImagePicker picker = ImagePicker();
  Future<void> pickImage(ImageSource source) async {
    picker.pickImage(source: source).then((value) {
      if (value != null) {
        emit(ChangePickedImageState(
            imageTypeModel: ImageTypeModel(
                imagePath: value.path, imageTypeEnum: ImageTypeEnum.file)));
      }
    });
  }

  Future<void> createCompany(CompanyModel companyModel) async {
    emit(LoadingUpdateCompanyStates());
    if (companyModel.companyLogo != null) {
      final result = await uploadImage(companyModel.companyLogo!);
      if (result != null) {
        companyModel.companyLogo = result;
        final FirebaseFirestore firestore = FirebaseFirestore.instance;
        try {
          await firestore
              .collection("companies")
              .doc(companyId)
              .collection("info")
              .doc("companyInfo")
              .set(companyModel.toMap());
          emit(SuccessUpdateCompanyStates());
        } catch (e) {
          emit(FailureUpdateCompanyStates(errMessage: e.toString()));
        }
      } else {
        emit(FailureUpdateCompanyStates(errMessage: "Error in Upload Image"));
      }
    }
  }

  Future<String?> uploadImage(String imagePath) async {
    try {
      String fileName =
          "$companyId/images/logo/${DateTime.now().millisecondsSinceEpoch}.jpg";
      Reference storageRef = FirebaseStorage.instance.ref(fileName);

      UploadTask uploadTask = storageRef.putFile(File(imagePath));
      TaskSnapshot snapshot = await uploadTask;

      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      return null;
    }
  }

  void deletePickedImage() {
    emit(ChangePickedImageState(imageTypeModel: null));
  }

  Future<void> addCompanyInfo() async {}

  void changeCompanyPosition(bool value) {
    emit(ChangeCompanyWorkPositionState(value: !value));
  }

  void changeSelectedDay() {
    emit(ChangeSelectedDayState());
  }

  void changePickedLocation(LatLng latlang) {
    emit(ChangeCompanyLocationState(
        latLng: latlang,
        imageMap: "https://maps.googleapis.com/maps/api/staticmap?"
            "center=${latlang.latitude},${latlang.longitude}&zoom=15&size=600x300&maptype=roadmap"
            "&markers=color:red%7C${latlang.latitude},${latlang.longitude}&key=AIzaSyCW38VzAFMkGxM4lqajPg6jZXaEKr50Kpk"));
  }
}
