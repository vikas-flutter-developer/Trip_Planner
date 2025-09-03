import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trip_planner/features/explore.dart';
import 'package:trip_planner/features/homepage.dart';
import 'package:trip_planner/features/plantrip.dart';

import '../../features/profile.dart';
import '../../features/trip.dart';


class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/home',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return Scaffold(
            body: child,
            bottomNavigationBar: NavigationBar(
              selectedIndex:_getIndex(state.uri.toString()),
              onDestinationSelected: (index) {
                switch (index) {
                  case 0:
                    context.go('/home');
                    break;
                  case 1:
                    context.go('/explore');
                    break;
                  case 2:
                    context.go('/trips');
                    break;
                  case 3:
                    context.go('/profile');
                    break;
                }
              },
              destinations: const [
                NavigationDestination(icon: Icon(Icons.home), label: "Home"),
                NavigationDestination(icon: Icon(Icons.explore), label: "Explore"),
                NavigationDestination(icon: Icon(Icons.card_travel), label: "Trips"),
                NavigationDestination(icon: Icon(Icons.person), label: "Profile"),

              ],
            ),
          );
        },
        routes: [
          GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
          GoRoute(path: '/explore', builder: (context, state) => const ExplorePage()),
          GoRoute(path: '/trips', builder: (context, state) => const TripsPage()),
          GoRoute(path: '/profile', builder: (context, state) => const ProfilePage()),
          GoRoute(path: '/plan', builder: (context, state) => const PlanPage()),
        ],
      ),
    ],
  );

  static int _getIndex( String location) {
    if (location.startsWith('/explore')) return 1;
    if (location.startsWith('/trips')) return 2;
    if (location.startsWith('/profile')) return 3;
    return 0;
  }
}

