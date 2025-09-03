// homepage.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trip_planner/core/utils/screen_util_helper.dart';
import '../../core/extensions/context_extensions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtilHelper.init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Travel Planner", style: context.textTheme.titleLarge),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: ScreenUtilHelper.setPadding(
          left: 16,
          right: 16,
          top: 16,
          bottom: 0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Featured Trips
            Text("Featured Trips", style: context.textTheme.headlineSmall),
            SizedBox(height: ScreenUtilHelper.setHeight(20)),

            SizedBox(
              height: ScreenUtilHelper.setHeight(180),
              child: PageView(
                controller: PageController(viewportFraction: 0.8),
                children: [
                  _tripCard(context, "Paris Adventure",
                      "https://picsum.photos/id/1015/400/200"),
                  _tripCard(context, "Goa Beach Fun",
                      "https://picsum.photos/id/1016/400/200"),
                  _tripCard(context, "Bali Escape",
                      "https://picsum.photos/id/1018/400/200"),
                ],
              ),
            ),
            SizedBox(height: ScreenUtilHelper.setHeight(40)),

            /// Popular Destinations
            Text("Popular Destinations", style: context.textTheme.headlineSmall),
            SizedBox(height: ScreenUtilHelper.setHeight(20)),

            SizedBox(
              height: ScreenUtilHelper.setHeight(190),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _destinationCircle(context, "Paris",
                      "https://picsum.photos/id/1005/200/200"),
                  _destinationCircle(context, "Bali",
                      "https://picsum.photos/id/1011/200/200"),
                  _destinationCircle(context, "Goa",
                      "https://picsum.photos/id/1020/200/200"),
                  _destinationCircle(context, "Dubai",
                      "https://picsum.photos/id/1024/200/200"),
                ],
              ),
            ),
            SizedBox(height: ScreenUtilHelper.setHeight(40)),

            /// Quick Actions
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => context.go("/plan"),
                    child: Text("Plan a Trip", style: context.textTheme.labelLarge),
                  ),
                ),
                SizedBox(width: ScreenUtilHelper.setWidth(10)),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => context.go("/explore"),
                    child: Text("Explore Now", style: context.textTheme.labelLarge),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Trip Card
  Widget _tripCard(BuildContext context, String title, String imgUrl) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(imgUrl, fit: BoxFit.cover),
          Container(
            alignment: Alignment.bottomLeft,
            padding: ScreenUtilHelper.setPadding(
              left: 16,
              right: 16,
              top: 16,
              bottom: 16,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            child: Text(
              title,
              style: context.textTheme.titleMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  /// Destination Circle
  Widget _destinationCircle(BuildContext context, String name, String imgUrl) {
    return Padding(
      padding: EdgeInsets.only(right: ScreenUtilHelper.setWidth(12)),
      child: Column(
        children: [
          CircleAvatar(
            radius: ScreenUtilHelper.setWidth(38),
            backgroundImage: NetworkImage(imgUrl),
          ),
          SizedBox(height: ScreenUtilHelper.setHeight(12)),
          Text(
            name,
            style: context.textTheme.bodyMedium,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
