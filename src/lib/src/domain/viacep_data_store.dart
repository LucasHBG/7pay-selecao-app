import 'package:mobx/mobx.dart';
import 'package:selecao_app/src/domain/viacep_data_model.dart';

part 'viacep_data_store.g.dart';

class ViacepDataStore = ViacepDataStoreBase with _$ViacepDataStore;

abstract class ViacepDataStoreBase with Store {
  List<ViacepDataModel> viacepDataList = ObservableList<ViacepDataModel>();

  void addItemToList(ViacepDataModel viacepData) {
    runInAction(() => viacepDataList.add(viacepData));
  }

  void removeItemFromList(String cep) {
    runInAction(() => viacepDataList.removeWhere((item) => item.cep == cep));
  }
}
