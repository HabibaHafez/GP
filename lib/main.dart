// // ignore_for_file: use_key_in_widget_constructors
//
// import 'package:flutter/material.dart';
// import 'package:techmate/Chats/Track_Chat.dart';
// import 'package:techmate/HomeScreens/home.dart';
// import 'package:techmate/IntershipsScreen/intershipScreen.dart';
// import 'package:techmate/MentorScreen/mentors.dart';
// import 'package:techmate/ProfileScreen/profile.dart';
// import 'package:techmate/Registeration/login/login.dart';
// import 'package:techmate/Registeration/signup/HR/hr_signup.dart';
// import 'package:techmate/Registeration/signup/Mentor/mentor_signup.dart';
// import 'package:techmate/Registeration/signup/student/skills_choosen.dart';
// import 'package:techmate/Registeration/signup/student/studen_signup.dart';
// import 'package:techmate/Registeration/signup/user/ContinuedSignup.dart';
// import 'package:techmate/courses/CourseDetalisScreen.dart';
// import 'package:techmate/courses/MainCourseScreen.dart';
// import 'package:techmate/courses/CategoryDetailsScreen.dart';
// import 'package:techmate/services/courses/CourseCategoryApiService.dart';
// import 'package:techmate/welcom/welcome_screen.dart';
//
//
// void  main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(routes: {
//       login_screen.routeName: ((BuildContext context) => login_screen()),
//       welcome_screen.routeName: ((BuildContext context) => welcome_screen()),
//       StudentSignup.routeName: ((BuildContext context) => StudentSignup()),
//       mentor_signup.routeName: ((BuildContext context) => mentor_signup()),
//       hr_signup.routeName: ((BuildContext context) => hr_signup()),
//       HomeScreen.routeName: ((BuildContext context) => HomeScreen()),
//       ContinuedSignup.routeName: ((BuildContext context) => ContinuedSignup(firstName: '', email: '', lastName: '', nationalId: '',)),
//       ChooseAreaOfInterest.routeName: ((BuildContext context) => ChooseAreaOfInterest(firstName: '', lastName: '', email: '', nationalId: '',)),
//       ProfileScreen.routeName: ((BuildContext context) => ProfileScreen()),
//       InternshipsScreen.routeName: ((BuildContext context) =>
//           InternshipsScreen()),
//       MentorsScreen.routeName: ((BuildContext context) => MentorsScreen()),
//       CoursesScreen.routeName: ((BuildContext context) => CoursesScreen()),
//       CourseCategoryScreen.routeName: ((BuildContext context) =>
//           CourseCategoryScreen()),
//       WritingMessageScreen.routeName: ((BuildContext context) =>
//           WritingMessageScreen()),
//     //   CourseDetailsScreen.routeName: ((BuildContext context) =>
//     // CourseDetailsScreen(course: ,)),
//
//     }, initialRoute: welcome_screen.routeName);
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:techmate/Chats/Track_Chat.dart';
// import 'package:techmate/HomeScreens/home.dart';
// import 'package:techmate/IntershipsScreen/intershipScreen.dart';
// import 'package:techmate/MentorScreen/mentors.dart';
// import 'package:techmate/ProfileScreen/profile.dart';
// import 'package:techmate/Registeration/login/login.dart';
// import 'package:techmate/Registeration/signup/HR/hr_signup.dart';
// import 'package:techmate/Registeration/signup/Mentor/mentor_signup.dart';
// import 'package:techmate/Registeration/signup/student/skills_choosen.dart';
// import 'package:techmate/Registeration/signup/student/studen_signup.dart';
// import 'package:techmate/Registeration/signup/user/ContinuedSignup.dart';
// import 'package:techmate/courses/CourseDetalisScreen.dart';
// import 'package:techmate/courses/MainCourseScreen.dart';
// import 'package:techmate/courses/CategoryDetailsScreen.dart';
// import 'package:techmate/services/courses/CourseCategoryApiService.dart';
// import 'package:techmate/welcom/welcome_screen.dart';
//
// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       routes: {
//         login_screen.routeName: (context) => login_screen(),
//         welcome_screen.routeName: (context) => welcome_screen(),
//         StudentSignup.routeName: (context) => StudentSignup(),
//         mentor_signup.routeName: (context) => mentor_signup(),
//         hr_signup.routeName: (context) => hr_signup(),
//         HomeScreen.routeName: (context) => HomeScreen(),
//         ContinuedSignup.routeName: (context) => ContinuedSignup(
//           firstName: '', email: '', lastName: '', nationalId: '',
//         ),
//         ChooseAreaOfInterest.routeName: (context) => ChooseAreaOfInterest(
//           firstName: '', lastName: '', email: '', nationalId: '',
//         ),
//         ProfileScreen.routeName: (context) => ProfileScreen(),
//         InternshipsScreen.routeName: (context) => InternshipsScreen(),
//         MentorsScreen.routeName: (context) => MentorsScreen(),
//         CoursesScreen.routeName: (context) => CoursesScreen(),
//         CourseCategoryScreen.routeName: (context) => CourseCategoryScreen(),
//         WritingMessageScreen.routeName: (context) => WritingMessageScreen(),
//         // CourseDetailsScreen.routeName: (context) => CourseDetailsScreen(course: ), // Uncomment and modify as needed
//       },
//       initialRoute: welcome_screen.routeName,
//     );
//   }
// }

//
// import 'package:flutter/material.dart';
// import 'package:techmate/Chats/Track_Chat.dart';
// import 'package:techmate/HomeScreens/home.dart';
// import 'package:techmate/IntershipsScreen/intershipScreen.dart';
// import 'package:techmate/MentorScreen/mentors.dart';
// import 'package:techmate/ProfileScreen/profile.dart';
// import 'package:techmate/Registeration/login/login.dart';
// import 'package:techmate/Registeration/signup/HR/hr_signup.dart';
// import 'package:techmate/Registeration/signup/Mentor/mentor_signup.dart';
// import 'package:techmate/Registeration/signup/student/skills_choosen.dart';
// import 'package:techmate/Registeration/signup/student/studen_signup.dart';
// import 'package:techmate/Registeration/signup/user/ContinuedSignup.dart';
// import 'package:techmate/courses/CourseDetalisScreen.dart';
// import 'package:techmate/courses/MainCourseScreen.dart';
// import 'package:techmate/courses/CategoryDetailsScreen.dart';
// import 'package:techmate/services/courses/CourseCategoryApiService.dart';
// import 'package:techmate/welcom/welcome_screen.dart';
//
// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       routes: {
//         login_screen.routeName: (context) => login_screen(),
//         welcome_screen.routeName: (context) => welcome_screen(),
//         StudentSignup.routeName: (context) => StudentSignup(),
//         mentor_signup.routeName: (context) => mentor_signup(),
//         hr_signup.routeName: (context) => hr_signup(),
//         HomeScreen.routeName: (context) => HomeScreen(),
//         ContinuedSignup.routeName: (context) => ContinuedSignup(
//           firstName: '', email: '', lastName: '', nationalId: '',
//         ),
//         ChooseAreaOfInterest.routeName: (context) => ChooseAreaOfInterest(
//           firstName: '', lastName: '', email: '', nationalId: '',
//         ),
//         ProfileScreen.routeName: (context) => ProfileScreen(),
//         InternshipsScreen.routeName: (context) => InternshipsScreen(),
//         MentorsScreen.routeName: (context) => MentorsScreen(),
//         CoursesScreen.routeName: (context) => CoursesScreen(),
//         // Remove this line
//         // CourseCategoryScreen.routeName: (context) => CourseCategoryScreen(),
//         WritingMessageScreen.routeName: (context) => WritingMessageScreen(),
//         // CourseDetailsScreen.routeName: (context) => CourseDetailsScreen(course: ), // Uncomment and modify as needed
//       },
//       onGenerateRoute: (settings) {
//         if (settings.name == CourseCategoryScreen.routeName) {
//           final args = settings.arguments as String;
//           return MaterialPageRoute(
//             builder: (context) {
//               return CourseCategoryScreen(categoryName: args);
//             },
//           );
//         }
//         // Handle other routes here if needed
//         return null;
//       },
//       initialRoute: welcome_screen.routeName,
//     );
//   }
// }
//
//
// import 'package:flutter/material.dart';
// import 'package:techmate/Chats/Track_Chat.dart';
// import 'package:techmate/HomeScreens/home.dart';
// import 'package:techmate/IntershipsScreen/intershipScreen.dart';
// import 'package:techmate/MentorScreen/mentors.dart';
// import 'package:techmate/ProfileScreen/profile.dart';
// import 'package:techmate/Registeration/login/login.dart';
// import 'package:techmate/Registeration/signup/HR/hr_signup.dart';
// import 'package:techmate/Registeration/signup/Mentor/mentor_signup.dart';
// import 'package:techmate/Registeration/signup/student/skills_choosen.dart';
// import 'package:techmate/Registeration/signup/student/studen_signup.dart';
// import 'package:techmate/Registeration/signup/user/ContinuedSignup.dart';
// import 'package:techmate/courses/CourseDetalisScreen.dart';
// import 'package:techmate/courses/MainCourseScreen.dart';
// import 'package:techmate/courses/CategoryDetailsScreen.dart';
// import 'package:techmate/services/courses/CourseCategoryApiService.dart';
// import 'package:techmate/welcom/welcome_screen.dart';
//
// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       routes: {
//         login_screen.routeName: (context) => login_screen(),
//         welcome_screen.routeName: (context) => welcome_screen(),
//         StudentSignup.routeName: (context) => StudentSignup(),
//         mentor_signup.routeName: (context) => mentor_signup(),
//         hr_signup.routeName: (context) => hr_signup(),
//         HomeScreen.routeName: (context) => HomeScreen(),
//         ContinuedSignup.routeName: (context) => ContinuedSignup(
//           firstName: '', email: '', lastName: '', nationalId: '',
//         ),
//         ChooseAreaOfInterest.routeName: (context) => ChooseAreaOfInterest(
//           firstName: '', lastName: '', email: '', nationalId: '',
//         ),
//         ProfileScreen.routeName: (context) => ProfileScreen(),
//         InternshipsScreen.routeName: (context) => InternshipsScreen(),
//         MentorsScreen.routeName: (context) => MentorsScreen(),
//         CoursesScreen.routeName: (context) => CoursesScreen(),
//         WritingMessageScreen.routeName: (context) => WritingMessageScreen(),
//       },
//       onGenerateRoute: (settings) {
//         if (settings.name == CourseCategoryScreen.routeName) {
//           final args = settings.arguments as String;
//           return MaterialPageRoute(
//             builder: (context) {
//               return CourseCategoryScreen(categoryName: args);
//             },
//           );
//         }
//         if (settings.name == CourseDetailsScreen.routeName) {
//           final args = settings.arguments as Map<String, dynamic>;
//           return MaterialPageRoute(
//             builder: (context) {
//               return CourseDetailsScreen(
//                 courseTitle: args['courseTitle']!,
//                 provider: args['provider']!,
//                 level: args['level']!,
//                 duration: args['duration']!,
//                 courseDescription: args['courseDescription']!,
//                 price: args['price']!,
//                 playUrl: args['playUrl']!,
//                 courseId: args['courseId']!,
//               );
//             },
//           );
//         }
//         return null;
//       },
//       initialRoute: welcome_screen.routeName,
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:techmate/StudentUser/Chats/Track_Chat.dart';
// import 'package:techmate/StudentUser/HomeScreens/home.dart';
// import 'package:techmate/StudentUser/IntershipsScreen/intershipScreen.dart';
// import 'package:techmate/StudentUser/MentorScreen/mentors.dart';
// import 'package:techmate/ProfileScreen/profile.dart';
// import 'package:techmate/Registeration/login/login.dart';
// import 'package:techmate/Registeration/signup/HR/hr_signup.dart';
// import 'package:techmate/Registeration/signup/Mentor/mentor_signup.dart';
// import 'package:techmate/Registeration/signup/student/skills_choosen.dart';
// import 'package:techmate/Registeration/signup/student/studen_signup.dart';
// import 'package:techmate/Registeration/signup/user/ContinuedSignup.dart';
// import 'package:techmate/StudentUser/courses/CourseDetalisScreen.dart';
// import 'package:techmate/StudentUser/courses/MainCourseScreen.dart';
// import 'package:techmate/StudentUser/courses/CategoryDetailsScreen.dart';
// import 'package:techmate/services/courses/CourseCategoryApiService.dart';
// import 'package:techmate/welcom/welcome_screen.dart';
// import 'package:techmate/RecruiterUser/Home/recruiterHome.dart';
// import 'package:flutter/material.dart';
// import 'package:techmate/ProfileScreen/editprofile.dart';
// import 'package:techmate/RecruiterUser/Home/recruiterHome.dart';
// import 'package:techmate/StudentUser/Chats/Track_Chat.dart';
// import 'package:techmate/StudentUser/HomeScreens/home.dart';
// import 'package:techmate/StudentUser/IntershipsScreen/intershipScreen.dart';
// import 'package:techmate/StudentUser/MentorScreen/mentors.dart';
// import 'package:techmate/ProfileScreen/profile.dart';
// import 'package:techmate/Registeration/login/login.dart';
// import 'package:techmate/Registeration/signup/HR/hr_signup.dart';
// import 'package:techmate/Registeration/signup/Mentor/mentor_signup.dart';
// import 'package:techmate/Registeration/signup/student/skills_choosen.dart';
// import 'package:techmate/Registeration/signup/student/studen_signup.dart';
// import 'package:techmate/Registeration/signup/user/ContinuedSignup.dart';
// import 'package:techmate/StudentUser/courses/CourseDetalisScreen.dart';
// import 'package:techmate/StudentUser/courses/MainCourseScreen.dart';
// import 'package:techmate/StudentUser/courses/CategoryDetailsScreen.dart';
// import 'package:techmate/services/courses/CourseCategoryApiService.dart';
// import 'package:techmate/welcom/welcome_screen.dart';
// import 'package:techmate/providers/BookingProvider.dart';
// import 'package:techmate/providers/message_provider.dart';
//
//
//
// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (context) => MessageProvider()),
//         ChangeNotifierProvider(create: (context) => BookingProvider()),
//       ],
//       child:  MyApp(),
//     ),
//   );
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       routes: {
//         login_screen.routeName: (context) => login_screen(),
//         welcome_screen.routeName: (context) => welcome_screen(),
//         StudentSignup.routeName: (context) => StudentSignup(),
//         mentor_signup.routeName: (context) => mentor_signup(),
//         hr_signup.routeName: (context) => hr_signup(),
//         HomeScreen.routeName: (context) => HomeScreen(),
//         ContinuedSignup.routeName: (( context) => ContinuedSignup(
//           firstName: '',
//           email: '',
//           lastName: '',
//           nationalId: '',
//         )),
//         ChooseAreaOfInterest.routeName: (( context) =>
//             ChooseAreaOfInterest(
//               firstName: '',
//               lastName: '',
//               email: '',
//               nationalId: '',
//             )),
//         ProfileScreen.routeName: (context) => ProfileScreen(),
//         InternshipsScreen.routeName: (context) => InternshipsScreen(),
//         MentorsScreen.routeName: (context) => MentorsScreen(),
//         CoursesScreen.routeName: (context) => CoursesScreen(),
//         RecruiterInternshipsScreen.routeName: (context) =>
//             RecruiterInternshipsScreen(),
//         EditProfileScreen.routeName: (context) => EditProfileScreen(),
//       },
//       onGenerateRoute: (settings) {
//         if (settings.name == CourseCategoryScreen.routeName) {
//           final args = settings.arguments as String;
//           return MaterialPageRoute(
//             builder: (context) {
//               return CourseCategoryScreen(categoryName: args);
//             },
//           );
//         }
//         if (settings.name == CourseDetailsScreen.routeName) {
//           final args = settings.arguments as Map<String, dynamic>;
//           return MaterialPageRoute(
//             builder: (context) {
//               return CourseDetailsScreen(
//                 courseTitle: args['courseTitle']!,
//                 provider: args['provider']!,
//                 level: args['level']!,
//                 duration: args['duration']!,
//                 courseDescription: args['courseDescription']!,
//                 price: args['price']!,
//                 playUrl: args['playUrl']!,
//                 courseId: args['courseId']!,
//               );
//             },
//           );
//         }
//         if (settings.name == WritingMessageScreen.routeName) {
//           final args = settings.arguments as WritingMessageScreenArguments;
//           return MaterialPageRoute(
//             builder: (context) {
//               return WritingMessageScreen(trackName: args.trackName);
//             },
//           );
//         }
//         return null;
//       },
//       initialRoute: welcome_screen.routeName,
//     );
//   }
// }
//
// class WritingMessageScreenArguments {
//   final String trackName;
//
//   WritingMessageScreenArguments(this.trackName);
// }






import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techmate/StudentUser/Chats/Track_Chat.dart';
import 'package:techmate/StudentUser/HomeScreens/home.dart';
import 'package:techmate/StudentUser/IntershipsScreen/intershipScreen.dart';
import 'package:techmate/StudentUser/MentorScreen/mentors.dart';
import 'package:techmate/ProfileScreen/profile.dart';
import 'package:techmate/Registeration/login/login.dart';
import 'package:techmate/Registeration/signup/HR/hr_signup.dart';
import 'package:techmate/Registeration/signup/Mentor/mentor_signup.dart';

import 'package:techmate/Registeration/signup/student/studen_signup.dart';
import 'package:techmate/Registeration/signup/user/ContinuedSignup.dart';
import 'package:techmate/StudentUser/courses/CourseDetalisScreen.dart';
import 'package:techmate/StudentUser/courses/MainCourseScreen.dart';
import 'package:techmate/StudentUser/courses/CategoryDetailsScreen.dart';
import 'package:techmate/services/courses/CourseCategoryApiService.dart';
import 'package:techmate/welcom/welcome_screen.dart';
import 'package:techmate/RecruiterUser/Home/recruiterHome.dart';
import 'package:flutter/material.dart';
import 'package:techmate/ProfileScreen/editprofile.dart';
import 'package:techmate/RecruiterUser/Home/recruiterHome.dart';
import 'package:techmate/StudentUser/Chats/Track_Chat.dart';
import 'package:techmate/StudentUser/HomeScreens/home.dart';
import 'package:techmate/StudentUser/IntershipsScreen/intershipScreen.dart';
import 'package:techmate/StudentUser/MentorScreen/mentors.dart';
import 'package:techmate/ProfileScreen/profile.dart';
import 'package:techmate/Registeration/login/login.dart';
import 'package:techmate/Registeration/signup/HR/hr_signup.dart';
import 'package:techmate/Registeration/signup/Mentor/mentor_signup.dart';
import 'package:techmate/Registeration/signup/student/studen_signup.dart';
import 'package:techmate/Registeration/signup/user/ContinuedSignup.dart';
import 'package:techmate/StudentUser/courses/CourseDetalisScreen.dart';
import 'package:techmate/StudentUser/courses/MainCourseScreen.dart';
import 'package:techmate/StudentUser/courses/CategoryDetailsScreen.dart';
import 'package:techmate/services/courses/CourseCategoryApiService.dart';
import 'package:techmate/welcom/welcome_screen.dart';
import 'package:techmate/providers/BookingProvider.dart';
import 'package:techmate/providers/message_provider.dart';
import 'package:techmate/MentorUser/MentorHome.dart';
import 'package:techmate/AdminUser/AdminHome.dart';
import 'package:techmate/MentorUser/mentorprofile.dart';
import 'package:techmate/MentorUser/editmentorprofile.dart';
import 'package:techmate/Registeration/signup/student/AreaOfInterestScreen.dart';
import 'package:techmate/MentorUser/ChatScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MessageProvider()),
        ChangeNotifierProvider(create: (context) => BookingProvider()),
      ],
      child:  MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        login_screen.routeName: (context) => login_screen(),
        welcome_screen.routeName: (context) => welcome_screen(),
        StudentSignup.routeName: (context) => StudentSignup(),
        mentor_signup.routeName: (context) => mentor_signup(),
        hr_signup.routeName: (context) => hr_signup(),
        HomeScreen.routeName: (context) => HomeScreen(),
        ContinuedSignup.routeName: (( context) => ContinuedSignup(
          firstName: '',
          email: '',
          lastName: '',
          nationalId: '',
        )),
        ChooseAreaOfInterest.routeName: (( context) =>
            ChooseAreaOfInterest(
              firstName: '',
              lastName: '',
              email: '',
              nationalId: '',
            )),
        ProfileScreen.routeName: (context) => ProfileScreen(),
        InternshipsScreen.routeName: (context) => InternshipsScreen(),
        MentorsScreen.routeName: (context) => MentorsScreen(),
        MentorProfileScreen.routeName: (context) => MentorProfileScreen(),
        AdminHomeScreen.routeName: (context) => AdminHomeScreen(),
        CoursesScreen.routeName: (context) => CoursesScreen(),
        RecruiterInternshipsScreen.routeName: (context) =>
            RecruiterInternshipsScreen(),
        MentorHome.routeName: (context) => MentorHome(),
        EditProfileScreen.routeName: (context) => EditProfileScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == CourseCategoryScreen.routeName) {
          final args = settings.arguments as String;
          return MaterialPageRoute(
            builder: (context) {
              return CourseCategoryScreen(categoryName: args);
            },
          );
        }
        if (settings.name == CourseDetailsScreen.routeName) {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) {
              return CourseDetailsScreen(
                courseTitle: args['courseTitle']!,
                provider: args['provider']!,
                level: args['level']!,
                duration: args['duration']!,
                courseDescription: args['courseDescription']!,
                price: args['price']!,
                playUrl: args['playUrl']!,
                courseId: args['courseId']!,
              );
            },
          );
        }
        if (settings.name == WritingMessageScreen.routeName) {
          final args = settings.arguments as WritingMessageScreenArguments;
          return MaterialPageRoute(
            builder: (context) {
              return WritingMessageScreen(trackName: args.trackName);
            },
          );
        }
        return null;
      },
      initialRoute: welcome_screen.routeName,
    );
  }
}

class WritingMessageScreenArguments {
  final String trackName;

  WritingMessageScreenArguments(this.trackName);
}