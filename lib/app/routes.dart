import 'package:flutter/material.dart';
import 'package:sims/arguments/student_attendance_arguments.dart';
import 'package:sims/arguments/teacher_attendance_arguments.dart';
import 'package:sims/arguments/teacher_classroom_arguments.dart';
import 'package:sims/arguments/teacher_grade_arguments.dart';
import 'package:sims/arguments/teacher_meeting_arguments.dart';
import 'package:sims/enum/classroom_argument_type.dart';
import 'package:sims/state/models/attendance.dart';
import 'package:sims/state/models/classroom.dart';
import 'package:sims/views/student/course/student_course_screen.dart';
import 'package:sims/views/student/student_attendance_screen.dart';
import 'package:sims/views/student/student_grade_screen.dart';
import 'package:sims/views/student/student_schedule_screen.dart';
import 'package:sims/views/teacher/attendance/teacher_attendance_screen.dart';
import 'package:sims/views/teacher/course_list_screen.dart';
import 'package:sims/views/teacher/schedule_list_screen.dart';
import 'package:sims/views/teacher/teacher_classroom_screen.dart';
import 'package:sims/views/teacher/grade/teacher_grade_screen.dart';
import 'package:sims/views/teacher/teacher_consult_screen.dart';
import 'package:sims/views/teacher/teacher_meetings_screen.dart';
import 'package:sims/views/teacher/teacher_profile_screen.dart';
import 'package:sims/views/teacher/teacher_schedule_screen.dart';

// Teacher Routes
const teacherAttendanceRoute = '/teacher/classroom/attendance';
const teacherAttendanceStudentListRoute =
    'teacher/classroom/attendance/students';
const teacherClassroomRoute = '/teacher/classroom';
const teacherGradeRoute = '/teacher/classroom/grade';
const teacherScheduleRoute = '/teacher/schedule';
const teacherMeetingsRoute = '/teacher/meeting';
const teacherCourseRoute = '/teacher/course';
const teacherScheduleToMeetingRoute = '/teacher/schedule-meeting';
const teacherProfileRoute = '/teacher/profile';
const teacherConsultRoute = '/teacher/consult';

// Student reoute
const studentScheduleRoute = '/student/schedule';
const studentAttendanceRoute = '/student/attendance';
const studentCourseRoute = '/student/course';
const studentGradeRoute = '/student/grade';

Route<MaterialPageRoute> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case teacherScheduleRoute:
      return MaterialPageRoute(
        builder: (context) => const TeacherScheduleScreen(),
        settings: settings,
      );

    case teacherClassroomRoute:
      return MaterialPageRoute(
        builder: (context) => TeacherClassroomScreen(
          type: settings.arguments as ClassroomType,
        ),
        settings: settings,
      );

    case teacherMeetingsRoute:
      return MaterialPageRoute(
        builder: (context) => TeacherMeetingsScreen(
          classroomId: settings.arguments as String,
        ),
        settings: settings,
      );

    case teacherCourseRoute:
      return MaterialPageRoute(
        builder: (context) => CourseListScreen(
          classroom: settings.arguments as Classroom,
        ),
        settings: settings,
      );

    case teacherAttendanceRoute:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => TeacherAttendanceScreen(
          arguments: settings.arguments as TeacherAttendanceArguments,
        ),
      );

    case teacherGradeRoute:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => TeacherGradeScreen(
          arguments: settings.arguments as TeacherGradeArguments,
        ),
      );

    case teacherProfileRoute:
      return MaterialPageRoute(
        builder: (context) => const TeacherProfileScreen(),
        settings: settings,
      );

    case teacherConsultRoute:
      return MaterialPageRoute(
        builder: (context) => TeacherConsultScreen(
          classroomId: settings.arguments as String,
        ),
        settings: settings,
      );

    case studentScheduleRoute:
      return MaterialPageRoute(
        builder: (context) => const StudentScheduleScreen(),
        settings: settings,
      );

    case studentCourseRoute:
      return MaterialPageRoute(
        builder: (context) => const StudentCourseScreen(),
        settings: settings,
      );

    case studentAttendanceRoute:
      return MaterialPageRoute(
        builder: (context) => StudentAttendanceScreen(
          arguments: settings.arguments as StudentAttendanceArguments,
        ),
        settings: settings,
      );

    case studentGradeRoute:
      return MaterialPageRoute(
        builder: (context) => const StudentGradeScreen(),
        settings: settings,
      );

    default:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => Scaffold(
          body: Center(
            child: Text('Not Found',
                style: Theme.of(context).textTheme.titleLarge),
          ),
        ),
      );
  }
}
