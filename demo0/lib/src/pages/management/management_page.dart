import 'dart:io';

import 'package:demo0/src/bloc/home/home_bloc.dart';
import 'package:demo0/src/bloc/management/management_bloc.dart';
import 'package:demo0/src/models/product.dart';
import 'package:demo0/src/pages/management/widgets/product_form.dart';
import 'package:demo0/src/services/network_service.dart';
import 'package:demo0/src/widgets/custom_flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app.dart';

class ManagementPage extends StatefulWidget {
  const ManagementPage({Key? key}) : super(key: key);

  @override
  _ManagementPageState createState() => _ManagementPageState();
}

class _ManagementPageState extends State<ManagementPage> {
  final _form = GlobalKey<FormState>();
  var _product = Product(name: "", price: 0, stock: 0);
  var _editMode = false;
  File? _imageFile;

  @override
  Widget build(BuildContext context) {
    final Object? arguments = ModalRoute.of(context)?.settings.arguments;
    if (arguments != null && arguments is Product) {
      _product = arguments;
      _editMode = true;
      logger.d(_product);
    }

    return Scaffold(
      appBar: AppBar(title: Text("Management"), actions: [
        TextButton(
          style: TextButton.styleFrom(
            primary: Colors.white,
          ),
          onPressed: () =>
              BlocProvider.of<ManagementBloc>(context, listen: false).add(
                  ManagementEvent_Submit(
                      product: _product,
                      image: _imageFile,
                      isEditMode: _editMode,
                      form: _form)),
          child: const Text('Submit'),
        ),
      ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: ProductForm(
            _product,
            callBackSetImage: _callBackSetImage,
            formKey: _form,
            deleteProduct: _editMode ? _deleteProduct : null,
          ),
        ),
      ),
    );
  }

  void _deleteProduct() {
    NetworkService().deleteProduct(_product.id!).then((value) {
      Navigator.pop(context);
      CustomFlushbar.showSuccess(context, message: value);
    }).catchError((exception) {
      CustomFlushbar.showError(context, message: 'Delete fail');
    });
  }

  void _callBackSetImage(File? imageFile) {
    _imageFile = imageFile;
  }

}
