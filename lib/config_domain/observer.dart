import 'package:bloc/bloc.dart';
import 'package:todo_app/config_domain/utils/logging.dart';

class TodoAppObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    DebugLogger debugLogger = DebugLogger();
    debugLogger.log('${bloc.runtimeType} $change');
  }
}
