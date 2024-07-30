import 'package:flutter/material.dart';
import 'package:restapi/models/data_model.dart';
import 'package:restapi/network/network.dart';
import 'package:restapi/repository/auth_repository.dart';

class HomeNotifier extends ChangeNotifier {
  final BuildContext context;

  HomeNotifier({required this.context}) {
    getData();
  }

  List<DataModel> list = [];

  Future getData() async {
    list.clear();
    notifyListeners();

    AuthRepository.getData(NetworkURL.getData()).then((value) {
      if (value['value'] == 1) {
        for (Map<String, dynamic> i in value['data']) {
          list.add(DataModel.fromJson(i));
        }

        notifyListeners();
      } else {
        notifyListeners();
      }
    });
  }

  // tambah data

  TextEditingController nama = TextEditingController();
  TextEditingController deskripsi = TextEditingController();

  final keyForm = GlobalKey<FormState>();

  cek() {
    if (keyForm.currentState!.validate()) {
      simpan();
    }
  }

  simpan() async {
    AuthRepository.addData(
            NetworkURL.addData(), nama.text.trim(), deskripsi.text.trim())
        .then((value) {
      if (value['value'] == 1) {
        final snackBar = SnackBar(content: Text(value['message']));

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        getData();
        notifyListeners();
      } else {
        final snackBar = SnackBar(content: Text(value['message']));

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        notifyListeners();
      }
    });
  }

  // ubah history

  updateHistory(DataModel model) async {
    AuthRepository.updateHistory(NetworkURL.updateHistory(), model.id)
        .then((value) {
      if (value['value'] == 1) {
        final snackBar = SnackBar(content: Text(value['message']));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        getData();
        notifyListeners();
      } else {
        final snackBar = SnackBar(content: Text(value['message']));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        notifyListeners();
      }
    });
  }
}
