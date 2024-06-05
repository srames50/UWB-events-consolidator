import 'package:flutter/material.dart';
import 'package:frontend/pages/eventedit.dart';
import '../components/drawer.dart';
import './event.dart';
import './eventsearch.dart';

// HomePage represents the main page of the application that has the header, a search button, and a list of featured events.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Eventipedia - UW Bothell',
          style: TextStyle(
            color: Color(0xFF4B2E83),
          ),
        ),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu), // Hamburger icon for the drawer
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              color: const Color(0xFF4B2E83),
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search), // Search Icon
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EventSearchPage()), // Navigate to EventSearchPage
              );
            },
            color: Color(0xFF4B2E83),
          ),
        ],
      ),
      drawer: AppDrawer(), // Drawer with navigation options
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 10),
                // New events
                child: Text(
                  'New This Week: XX/XX/20XX',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            // Featured Events displayed below
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: SizedBox(
                height: 360,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 13),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => EventPage(
                                title: 'Event 1',
                                image:
                                    'https://i.natgeofe.com/n/8a4cd21e-3906-4c9d-8838-b13ef85f4b6e/tpc18-outdoor-gallery-1002418-12000351_01_3x2.jpg',
                              ),
                            ),
                          );
                        },
                        child: Stack(
                          children: [
                            Container(
                              width: 343,
                              height: 360,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://i.natgeofe.com/n/8a4cd21e-3906-4c9d-8838-b13ef85f4b6e/tpc18-outdoor-gallery-1002418-12000351_01_3x2.jpg'),
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.5), // Adjust opacity here
                                    BlendMode.dstATop,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 343,
                              height: 360,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Color(0xFF4B2E83).withOpacity(0.4), // Shade color with opacity
                              ),
                            ),
                            Positioned.fill(
                              child: Center(
                                child: Text(
                                  'Event 1',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 13),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => EventPage(
                                title: 'Event 2',
                                image:
                                    'https://th-thumbnailer.cdn-si-edu.com/_sWVRSTELwK0-Ave6S4mFpxr1D0=/1000x750/filters:no_upscale()/https://tf-cmsv2-smithsonianmag-media.s3.amazonaws.com/filer/25MikeReyfman_Waterfall.jpg',
                              ),
                            ),
                          );
                        },
                        child: Stack(
                          children: [
                            Container(
                              width: 343,
                              height: 360,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://th-thumbnailer.cdn-si-edu.com/_sWVRSTELwK0-Ave6S4mFpxr1D0=/1000x750/filters:no_upscale()/https://tf-cmsv2-smithsonianmag-media.s3.amazonaws.com/filer/25MikeReyfman_Waterfall.jpg'),
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.5), // Adjust opacity here
                                    BlendMode.dstATop,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 343,
                              height: 360,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Color(0xFF4B2E83).withOpacity(0.4), // Shade color with opacity
                              ),
                            ),
                            Positioned.fill(
                              child: Center(
                                child: Text(
                                  'Event 2',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'Other Events:',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 295,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          'Month, Day: Event 1',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          'Month, Day: Event 2',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          'Month, Day: Event 3',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          'Month, Day: Event 4',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          'Month, Day: Event 5',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => EventEdit()), // Navigate to EventEdit
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF4B2E83),
      ),
    );
  }
}
