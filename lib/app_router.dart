import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'services/api_service.dart';
import 'screens/album_list_screen.dart';
import 'screens/album_detail_screen.dart';

class AppRouter {
  final ApiService apiService;

  AppRouter(this.apiService);

  late final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const AlbumListScreen(),
      ),
      GoRoute(
        path: '/album/:id',
        builder: (context, state) {
          final albumId = int.parse(state.pathParameters['id']!);
          final albumTitle = state.extra as String;
          return AlbumDetailScreen(albumId: albumId, albumTitle: albumTitle, apiService: apiService);
        },
      ),
    ],
  );
}
