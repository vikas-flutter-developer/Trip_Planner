import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/theme/theme_cubit.dart';
import '../core/extensions/context_extensions.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(fontSize: 18.sp), // ✅ responsive text
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w), // ✅ responsive padding
        child: Column(
          children: [
            // 👤 Avatar
            CircleAvatar(
              radius: 50.r, // ✅ responsive radius
              backgroundImage: const NetworkImage(
                'https://imgs.search.brave.com/bgat-3iOxlEdqx434LwE-ZhR36x3x7xv90WOcRlxPhc/rs:fit:500:0:1:0/g:ce/aHR0cHM6Ly93d3cu/c2h1dHRlcnN0b2Nr/LmNvbS9ibG9nL3dw/LWNvbnRlbnQvdXBs/b2Fkcy9zaXRlcy81/LzIwMjQvMDYvcHJv/ZmlsZV9waG90b19z/YW1wbGVfMTYuanBn/P3c9NzIw',
              ),
            ),
            SizedBox(height: 12.h), // ✅ responsive spacing

            Text(
              "John Doe",
              style: context.textTheme.headlineSmall?.copyWith(
                fontSize: 20.sp, // ✅ responsive font
              ),
            ),
            Text(
              "Traveler | Explorer",
              style: context.textTheme.bodyMedium?.copyWith(
                fontSize: 14.sp,
              ),
            ),
            SizedBox(height: 20.h),

            // ⚙️ Settings options
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.edit, size: 22.sp),
                    title: Text("Edit Profile", style: TextStyle(fontSize: 15.sp)),
                    trailing: Icon(Icons.chevron_right, size: 20.sp),
                    onTap: () {
                      // TODO: Navigate to Edit Profile
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.history, size: 22.sp),
                    title: Text("Booking History", style: TextStyle(fontSize: 15.sp)),
                    trailing: Icon(Icons.chevron_right, size: 20.sp),
                  ),
                  ListTile(
                    leading: Icon(Icons.dark_mode, size: 22.sp),
                    title: Text("Theme Mode", style: TextStyle(fontSize: 15.sp)),
                    trailing: Switch.adaptive(
                      value: context.theme.brightness == Brightness.dark, // 👈 using extension
                      onChanged: (val) {
                        context.read<ThemeCubit>().toggleTheme();
                      },
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.logout, size: 22.sp),
                    title: Text("Logout", style: TextStyle(fontSize: 15.sp)),
                    trailing: Icon(Icons.chevron_right, size: 20.sp),
                    onTap: () {
                      // TODO: Handle logout
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
