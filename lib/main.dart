import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_router.dart';
import 'blocs/album_bloc.dart';
import 'blocs/album_event.dart';
import 'services/api_service.dart';

void main() {
  final apiService = ApiService();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AlbumBloc(apiService)..add(FetchAlbums()), // ✅ Call event on AlbumBloc
        ),
      ],
      child: MyApp(apiService: apiService),
    ),
  );
}

class MyApp extends StatelessWidget {
  final ApiService apiService;

  const MyApp({Key? key, required this.apiService}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter(apiService).router,
      theme: ThemeData(useMaterial3: true),
    );
  }
}
