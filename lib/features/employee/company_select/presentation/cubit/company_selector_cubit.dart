import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:workify/features/admin/company/data/models/company_model.dart';

part 'company_selector_state.dart';

class CompanySelectorCubit extends Cubit<CompanySelectorState> {
  CompanySelectorCubit() : super(CompanySelectorInitial());
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> loadAllCompanies() async {
    try {
      emit(LoadingGetAllCompainesState());
      
      final result = await _firestore.collection("companies").get();

      List<CompanyModel> data = [];

      for (var item in result.docs) {
        final outPut = await _firestore
            .collection("companies")
            .doc(item.id)
            .collection("info")
            .doc("companyInfo")
            .get();
        if (outPut.data() != null) {
          data.add(CompanyModel.fromJson(outPut.data()!));
        }
      }
      emit(SuccessGetAllCompainesState(compainesList: data));
    } on FirebaseException catch (e) {
      emit(FailureGetAllCompainesState(errMessage: e.toString()));
    }
  }

  void changeSelector(int index) {
    emit(ChangeSelectedCompanyState(value: index));
  }
}
