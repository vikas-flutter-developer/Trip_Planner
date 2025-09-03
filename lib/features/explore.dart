// explore.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/extensions/context_extensions.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Explore"),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.w),
        children: [
          Text(
            "Discover New Adventures",
            style: context.textTheme.headlineMedium, // ✅ using extension
          ),
          SizedBox(height: 30.h),

          // 🔍 Search bar
          TextField(
            decoration: const InputDecoration(
              hintText: "Search destinations...",
              prefixIcon: Icon(Icons.search),
            ),
          ),
          SizedBox(height: 30.h),

          // 🌍 Category chips
          SizedBox(
            height: 40.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                Chip(label: Text("Beaches")),
                SizedBox(width: 10),
                Chip(label: Text("Mountains")),
                SizedBox(width: 10),
                Chip(label: Text("Cities")),
                SizedBox(width: 10),
                Chip(label: Text("Historical")),
              ],
            ),
          ),
          SizedBox(height: 30.h),

          // 🏞 Recommended cards
          Text(
            "Recommended",
            style: context.textTheme.titleLarge, // ✅ using extension
          ),
          SizedBox(height: 25.h),
          SizedBox(
            height: 220.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildCard(
                  context,
                  "Bali",
                  "https://images.unsplash.com/photo-1507525428034-b723cf961d3e",
                ),
                _buildCard(
                  context,
                  "Paris",
                  "https://images.unsplash.com/photo-1502602898657-3e91760cbb34",
                ),
                _buildCard(
                  context,
                  "Goa",
                  "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?ixlib=rb-1.2.1&q=80",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 🔥 Card with NetworkImage
  Widget _buildCard(BuildContext context, String name, String imageUrl) {
    return Container(
      width: 160.w,
      margin: EdgeInsets.only(right: 12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        alignment: Alignment.bottomLeft,
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          gradient: LinearGradient(
            colors: [Colors.black.withOpacity(0.6), Colors.transparent],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Text(
          name,
          style: context.textTheme.titleMedium?.copyWith( // ✅ using extension
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
