import 'package:go_router/go_router.dart';
import 'package:task_master/ui/pages/my_home_page.dart';

// GoRouter configuration
// ToDo find better way
final globalRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => MyHomePage(title: 'Flutter Demo Home Page'),
    ),
  ],
);
