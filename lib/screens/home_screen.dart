import 'package:flutter/material.dart';
import 'package:mvvm_example/core/injections/setup_injection.dart';
import 'package:mvvm_example/viewmodels/photo_screen_viewmodel.dart';
import 'package:mvvm_example/viewmodels/photo_state.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({ super.key });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final viewModel = getIt<PhotoScreenViewmodel>();

  @override
  void initState() {
    viewModel.getPhotos();
    super.initState();
  }

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('EXAMPLE'),),
           body: ValueListenableBuilder(
            valueListenable: viewModel.state, 
            builder: (context, state, _) {
              switch (state.runtimeType) {
                case const (LoadingPhoto):
                  return const Center(child: CircularProgressIndicator(color: Colors.black));
                case const (ErrorPhoto):
                 final error = state as ErrorPhoto;
                 
                 return Center(child: Text(error.exception.toString()));

                case const (SuccessPhoto):
                  final sucess = state as SuccessPhoto;
                  final photos = sucess.photos;
                  return Text(photos.first.title);
                
                default:
                  return const SizedBox.shrink();
              }
            },
          ),
       );
  }
}