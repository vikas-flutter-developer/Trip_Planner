import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/extensions/context_extensions.dart';

class TripsPage extends StatelessWidget {
  const TripsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme; // 👈 cleaner access
    final trips = [
      {"title": "Paris Getaway", "date": "12 Mar 2025", "status": "Upcoming"},
      {"title": "Bali Retreat", "date": "22 Apr 2025", "status": "Planned"},
      {"title": "Goa Weekend", "date": "5 May 2025", "status": "Completed"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("My Trips", style: theme.textTheme.titleLarge),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.w),
        itemCount: trips.length,
        itemBuilder: (context, index) {
          final trip = trips[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
            margin: EdgeInsets.only(bottom: 12.h),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              leading: CircleAvatar(
                backgroundColor: theme.colorScheme.primary,
                child: Icon(Icons.flight, color: theme.colorScheme.onPrimary),
              ),
              title: Text(
                trip["title"]!,
                style: theme.textTheme.titleMedium?.copyWith(fontSize: 16.sp),
              ),
              subtitle: Text(
                "Date: ${trip["date"]}",
                style: theme.textTheme.bodyMedium?.copyWith(fontSize: 14.sp),
              ),
              trailing: Chip(
                label: Text(
                  trip["status"]!,
                  style: TextStyle(
                    color: theme.colorScheme.onPrimary,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                backgroundColor: theme.colorScheme.primary,
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go("/plan"),
        child: Icon(Icons.add, size: 24.sp),
      ),
    );
  }
}
