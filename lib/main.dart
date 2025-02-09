import 'dart:async';

import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyPortfolio());
}

class MyPortfolio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WebPortfolioScreen(),
    );
  }
}

class WebPortfolioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Pradeep's Portfolio",
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 20),
              // Phone Mockup
              Container(
                width: 300,
                height: 600,
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: Colors.white, width: 3),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    ClockWidget(),

                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          shrinkWrap: true,
                          children: [
                            _buildAppIcon(Icons.article, "Resume",
                                'https://drive.google.com/file/d/1Mllg5q7gSdu2MMwknoQBnGFei_I3-edl/view?usp=sharing'),
                            _buildAppIcon(Icons.work, "Projects", '',
                                isProjects: true, context: context),
                            _buildAppIcon(Icons.code, "Tech Stack", '',
                                isTechStack: true, context: context),
                            _buildAppIcon(Icons.star, "Achievements", '',
                                isAchievements: true, context: context),
                            _buildAppIcon(Icons.school, "Education", '',
                                isEducation: true, context: context),
                            _buildAppIcon(Icons.contact_mail, "Contact", '',
                                isContact: true, context: context),
                          ],
                        ),
                      ),
                    ),
                    // Dock Bar
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.home, color: Colors.white, size: 30),
                          Icon(Icons.search, color: Colors.white, size: 30),
                          IconButton(
                            icon: Icon(Icons.settings,
                                color: Colors.white, size: 30),
                            onPressed: () => _showThemeDialog(context),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppIcon(IconData icon, String label, String url,
      {bool isContact = false,
      bool isEducation = false,
      bool isTechStack = false,
      bool isAchievements = false,
      bool isProjects = false,
      BuildContext? context}) {
    return GestureDetector(
      onTap: () {
        if (isContact && context != null) {
          _showContactDialog(context);
        } else if (isEducation && context != null) {
          _showEducationDialog(context);
        } else if (isTechStack && context != null) {
          _showTechStackDialog(context);
        } else if (isAchievements && context != null) {
          _showAchievementsDialog(context);
        } else if (isProjects && context != null) {
          _showProjectsDialog(context);
        } else if (url.isNotEmpty) {
          launchUrl(Uri.parse(url));
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 50, color: Colors.white),
          SizedBox(height: 5),
          Text(label, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  void _showTechStackDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.grey[900],
          title: Row(
            children: [
              Icon(Icons.code, color: Colors.blueAccent),
              SizedBox(width: 10),
              Text(
                "Tech Stack",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBulletPoint("C Programming"),
              _buildBulletPoint("Embedded Systems"),
              _buildBulletPoint("Python"),
              _buildBulletPoint("RTOS (Real-Time Operating Systems)"),
              _buildBulletPoint("Networking"),
              _buildBulletPoint("Data Structures & Algorithms"),
              _buildBulletPoint("HTML, CSS"),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Close", style: TextStyle(color: Colors.blueAccent)),
            ),
          ],
        );
      },
    );
  }

  void _showEducationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.grey[900],
          title: Row(
            children: [
              Icon(Icons.school, color: Colors.blueAccent),
              SizedBox(width: 10),
              Text(
                "Education",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildEducationTile(
                  title: "B.E. in Electronics and Communication",
                  subtitle:
                      "KLE Technological University, Hubballi (2021–2025)",
                  details: "CGPA: 8.43 (up to 6th semester)"),
              Divider(color: Colors.blueAccent),
              _buildEducationTile(
                  title: "Pre-University (PCMS)",
                  subtitle: "Global Independent College, Hubballi (2019–2021)",
                  details: "Percentage: 98.33%"),
              Divider(color: Colors.blueAccent),
              _buildEducationTile(
                  title: "SSLC",
                  subtitle:
                      "Nirmala K. Thakkar English Medium High School (2019)",
                  details: "Percentage: 95.68%"),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                "Close",
                style: TextStyle(color: Colors.blueAccent),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildEducationTile(
      {required String title,
      required String subtitle,
      required String details}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
          Text(
            subtitle,
            style: TextStyle(color: Colors.white70),
          ),
          Text(
            details,
            style: TextStyle(color: Colors.white54),
          ),
        ],
      ),
    );
  }

  void _showProjectsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.grey[900],
          title: Row(
            children: [
              Icon(Icons.work, color: Colors.blueAccent),
              SizedBox(width: 10),
              Text(
                "Projects",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildProjectTile("Instagram Clone", "A social media app clone",
                  "https://github.com/Pradeep1234566/Instagram_clone"),
              Divider(color: Colors.blueAccent),
              _buildProjectTile("TODO App", "Task management application",
                  "https://github.com/Pradeep1234566/todo"),
              Divider(color: Colors.blueAccent),
              _buildProjectTile("Coffee UI", "Stylish coffee shop UI",
                  "https://github.com/Pradeep1234566/Coffee_ui"),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Close", style: TextStyle(color: Colors.blueAccent)),
            ),
          ],
        );
      },
    );
  }

  Widget _buildProjectTile(String title, String description, String url) {
    return ListTile(
      leading: Icon(Icons.code, color: Colors.blueAccent),
      title: Text(
        title,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(description, style: TextStyle(color: Colors.white70)),
      onTap: () => launchUrl(Uri.parse(url)),
    );
  }

  void _showContactDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.grey[900],
          title: Row(
            children: [
              Icon(Icons.contact_mail, color: Colors.blueAccent),
              SizedBox(width: 10),
              Text(
                "Contact Me",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildContactTile(Icons.email, "pradeeplaxmanraopawar@gmail.com",
                  "mailto:pradeeplaxmanraopawar@gmail.com"),
              _buildContactTile(Icons.link, "LinkedIn",
                  "https://linkedin.com/in/pradeep-pawar-64345126a"),
              _buildContactTile(
                  Icons.phone, "+91 701 9572 787", "tel:+917019572787"),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Close", style: TextStyle(color: Colors.blueAccent)),
            ),
          ],
        );
      },
    );
  }

  Widget _buildContactTile(IconData icon, String title, String url) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title, style: TextStyle(color: Colors.white)),
      onTap: () => launchUrl(Uri.parse(url)),
    );
  }

  void _showAchievementsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.grey[900],
          title: Row(
            children: [
              Icon(Icons.star, color: Colors.amber),
              SizedBox(width: 10),
              Text(
                "Achievements",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBulletPoint(
                  "Smart India Hackathon 2023 College-Level Round"),
              _buildBulletPoint("100+ solved problems on LeetCode"),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Close", style: TextStyle(color: Colors.amber)),
            ),
          ],
        );
      },
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(Icons.circle, size: 8, color: Colors.white),
          SizedBox(width: 8),
          Expanded(
            child: Text(text, style: TextStyle(color: Colors.white70)),
          ),
        ],
      ),
    );
  }
}

void _showThemeDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Colors.grey[900],
        title: Row(
          children: [
            Icon(Icons.settings, color: Colors.blueAccent),
            SizedBox(width: 10),
            Text(
              "Theme Settings",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildThemeOption(context, "Light Theme", true),
            Divider(color: Colors.white24),
            _buildThemeOption(context, "Dark Theme", false),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("Close", style: TextStyle(color: Colors.blueAccent)),
          ),
        ],
      );
    },
  );
}

Widget _buildThemeOption(
    BuildContext context, String title, bool isLightTheme) {
  return ListTile(
    leading: Icon(
      isLightTheme ? Icons.light_mode : Icons.dark_mode,
      color: isLightTheme ? Colors.amber : Colors.white,
    ),
    title: Text(title, style: TextStyle(color: Colors.white)),
    onTap: () {
      ThemeData theme = isLightTheme
          ? ThemeData.light().copyWith(scaffoldBackgroundColor: Colors.white)
          : ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black);
      Navigator.of(context).pop();
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(
            "Theme Changed",
            style: TextStyle(color: Colors.blueAccent),
          ),
          content: Text(
            "Applied $title successfully!",
          ),
        ),
      );
    },
  );
}

class ClockWidget extends StatefulWidget {
  @override
  _ClockWidgetState createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> {
  late String _currentTime;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _updateTime();
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) => _updateTime());
  }

  void _updateTime() {
    final now = DateTime.now();
    setState(() {
      _currentTime =
          "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')} ${now.hour < 12 ? 'AM' : 'PM'}";
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _currentTime,
      style: TextStyle(color: Colors.white, fontSize: 18),
    );
  }
}
