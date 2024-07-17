import 'package:flutter/material.dart';
import 'package:mvvm_example/core/extensions/extension_mediaquery.dart';
import 'package:mvvm_example/core/extensions/extension_design_system.dart';
import 'package:mvvm_example/core/injections/setup_injection.dart';
import 'package:mvvm_example/core/themes/app_colors.dart';
import 'package:mvvm_example/core/themes/app_text_styles.dart';
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
        backgroundColor: context.designSystem!.backgroundColor,
           appBar: AppBar(
            title: const Text('EXAMPLE'),
            centerTitle: context.designSystem!.defaultAppBarTheme!.centerTitle,
            titleTextStyle: context.designSystem!.defaultAppBarTheme!.titleTextStyle!,
            backgroundColor: context.designSystem!.defaultAppBarTheme!.backgroundColor,
          ),
           body: ValueListenableBuilder(
            valueListenable: viewModel.state, 
            builder: (context, state, _) {
              switch (state.runtimeType) {
                case const (LoadingPhoto):
                  return Center(child: CircularProgressIndicator(color: AppColors.green));
                case const (ErrorPhoto):
                 final error = state as ErrorPhoto;
                 
                 return Center(child: Text(error.exception.toString(), style: AppTextStyles.montserratW700s18.copyWith(color: AppColors.red)));

                case const (SuccessPhoto):
                  final sucess = state as SuccessPhoto;
                  final photos = sucess.photos;

                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: RefreshIndicator(
                      onRefresh: () async => viewModel.getPhotos(),
                      child: ListView.builder(
                        itemCount: photos.length,
                        itemBuilder: (context, index) {
                          final photo = photos[index];
                          return SizedBox(
                            height: 400,
                            child: Card(
                              color: AppColors.orangeLight,
                              clipBehavior: Clip.antiAlias,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(photo.title, style: AppTextStyles.montserratW700s18),
                                    const SizedBox(height: 20),
                                    Image.network(photo.url, height: 200, width: context.screenWidth),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                
                default:
                  return const SizedBox.shrink();
              }
            },
          ),
       );
  }
}