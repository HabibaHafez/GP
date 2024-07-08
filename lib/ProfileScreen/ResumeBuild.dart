import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ResumeScreen extends StatelessWidget {
  static const String routeName = 'Resume Screen';

  @override
  Widget build(BuildContext context) {
    final PageController _pageController = PageController(initialPage: 0);

    final List<Map<String, String>> tips = [
      {
        'title': 'Keep It to One Page',
        'tip': 'Keep your resume to one page to ensure that hiring managers can quickly read it.',
        'image': 'images/5471397.png'
      },
      {
        'title': 'Highlight Tools',
        'tip': 'Highlight your proficiency with tools like Jira, Hubspot, Asana, etc.',
        'image': 'images/tools.png'
      },
      {
        'title': 'Use Bullet Points',
        'tip': 'Use bullet points and lists, not big blocks of text, to make your resume easier to read.',
        'image': 'images/points.png'
      },
      {
        'title': 'Avoid Overly Design-Heavy Resumes',
        'tip': 'Avoid overly design-heavy resumes that may be difficult to read.',
        'image': 'images/do.png'
      },
      {
        'title': 'Include Contact Information',
        'tip': 'Include your contact information at the top of your resume.',
        'image': 'images/Contact.png'
      },
      {
        'title': 'Link to Portfolios and Profiles',
        'tip': 'Link to relevant portfolios and profiles(LinkedIn and Github) to showcase your work.',
        'image': 'images/web-search-8942.png'
      },
      {
        'title': 'Mention Relevant Education',
        'tip': 'Mention your relevant education, including degrees and certifications.',
        'image': 'images/online-education-7538.png'
      },
      {
        'title': 'Highlight Key Skills',
        'tip': 'Highlight key skills that are relevant to the job you are applying for.',
        'image': 'images/skills.png'
      },
      {
        'title': 'Showcase Personal Projects',
        'tip': 'Showcase interesting personal projects or facts to make your resume stand out.',
        'image': 'images/project.png'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Resume Building Tips',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue[800],
        iconTheme: IconThemeData(color: Colors.white), // This sets the back arrow color to white
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: tips.length + 2, // Add two more pages for the initial and final slides
        itemBuilder: (context, index) {
          if (index == 0) {
            return buildIntroSlide(context);
          } else if (index == tips.length + 1) {
            return buildFinalSlide(context);
          } else {
            return buildTipCard(
              context,
              title: tips[index - 1]['title']!,
              tip: tips[index - 1]['tip']!,
              image: tips[index - 1]['image']!,
            );
          }
        },
      ),
    );
  }

  Widget buildIntroSlide(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('images/logo - Copy.png', height: 150),
              SizedBox(height: 16),
              Text(
                'Tips for building your tech resume',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[800],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTipCard(BuildContext context, {required String title, required String tip, required String image}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(image, height: 150),
              SizedBox(height: 16),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[800],
                ),
              ),
              SizedBox(height: 16),
              Text(
                tip,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFinalSlide(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('images/build.png', height: 150),
              SizedBox(height: 16),
              Text(
                'Use a tool for help',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[800],
                ),
              ),
              SizedBox(height: 16),
              Text(
                'A tool to help you build a great resume by optimizing it for applicant tracking systems.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  const url = 'https://www.jobscan.co/';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                child: Text(
                  'Visit Resume Builder',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[800]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
