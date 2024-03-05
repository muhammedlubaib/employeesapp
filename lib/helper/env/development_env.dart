
import 'package:employeesapp/helper/env/env.dart';

class DevelopmentEnv extends Env {
  DevelopmentEnv() : super(domainUrl: 'https://gslstudent.lilacinfotech.com');
  @override
  String toString() {
    return 'Development';
  }
}
