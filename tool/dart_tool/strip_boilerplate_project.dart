import 'dart:io';

/// Clean up the boilerplate code
///
///
/// FVM install is required to run before this script.
///
/// Arguments:
///  1) Keep test directory
///       - values: y,n,yes,no
void main(List<String> args) {
  bool? keepTestDir;
  if (args.isEmpty || (args[0] != 'true' && args[0] != 'false')) {
    do {
      Logger.debug('Keep test directory? (y/n)');
      final result = stdin.readLineSync();
      final valid = result == 'yes' || result == 'y' || result == 'no' || result == 'n';
      if (valid) {
        keepTestDir = result == 'yes' || result == 'y';
      }
    } while (keepTestDir == null);
  }

  if (keepTestDir == null) {
    Logger.error('Keep test directory was not set correctly.');
    return;
  }
  final testDir = Directory('test');
  final libDir = Directory('lib');
  if (!keepTestDir && testDir.existsSync()) {
    testDir.deleteSync(recursive: true);
    Logger.debug('Removed the test directory');
  }
  Logger.debug('Removing Directories');
  removeBoilerplateDirectories(testDir);
  removeBoilerplateDirectories(libDir);
  Logger.debug('Removed Directories');

  Logger.debug('Removing files');
  removeBoilerplateFiles(testDir);
  removeBoilerplateFiles(libDir);
  Logger.debug('Removed files');

  Logger.debug('Removing import references');
  replaceBoilerplateReferences(testDir);
  replaceBoilerplateReferences(libDir);
  _replaceHomeScreenLine();
  _replaceDatabaseTests();
  Logger.debug('Removed import references');
  executeCommand('fvm', ['flutter', 'clean']);
  executeCommand('fvm', ['flutter', 'packages', 'get']);
  executeCommand('fvm', ['flutter', 'packages', 'pub', 'run', 'build_runner', 'build', '--delete-conflicting-outputs']);
}

void executeCommand(String cmd, List<String> params) {
  final fullCommand = '$cmd ${params.join(' ')}';
  try {
    Logger.debug('\nExecuting command:\n$fullCommand');
    final result = Process.runSync(cmd, params);
    if (result.stderr.toString().isNotEmpty) {
      throw Exception(result.stderr.toString());
    }
    Logger.debug('${result.stdout.toString()}');
  } catch (e) {
    Logger.debug('\nFailed to execute command: $fullCommand\n$e');
    rethrow;
  }
}

void removeBoilerplateDirectories(Directory dir) {
  if (!dir.existsSync()) return;
  dir.listSync(recursive: true).where((element) {
    if (element.path.endsWith('.png')) return false;
    if (File(element.path).existsSync()) return false;
    return true;
  }).forEach((element) {
    removeDirectories.forEach((removeDir) {
      if (element.path == removeDir) {
        element.deleteSync(recursive: true);
      }
    });
  });
}

void removeBoilerplateFiles(Directory dir) {
  if (!dir.existsSync()) return;
  dir.listSync(recursive: true).where((element) {
    if (element.path.endsWith('.png')) return false;
    if (Directory(element.path).existsSync()) return false;
    return true;
  }).forEach((element) {
    removeFiles.forEach((removeDir) {
      if (element.path == removeDir) {
        element.deleteSync(recursive: true);
      }
    });
  });
}

void replaceBoilerplateReferences(Directory dir) {
  if (!dir.existsSync()) return;
  dir.listSync(recursive: true).where((element) {
    if (element.path.endsWith('.png')) return false;
    if (Directory(element.path).existsSync()) return false;
    return true;
  }).forEach((element) {
    removeCodeLines.forEach((import) {
      _replaceInFile(element.path, '$import\n', '');
    });
  });
}

void _replaceHomeScreenLine() {
  _replaceInFile(
    'lib/screen/home/home_screen.dart',
    '''          children: const [
            TodoListScreen(),
            DebugScreen(),
          ],''',
    '''          children: [
            Container(),
            const DebugScreen(),
        ],''',
  );
}

void _replaceDatabaseTests() {
  _replaceInFile(
    'test/database/flutter_template_database_test.dart',
    '''  test('FlutterTemplateDatabase should delete all tables', () async {
    final resultTodos1 = await sut.select(sut.dbTodoTable).get();
    expect(resultTodos1.isEmpty, true);

    await sut.into(sut.dbTodoTable).insert(DbTodoTableCompanion.insert(title: 'todo1', completed: true));
    await sut.into(sut.dbTodoTable).insert(DbTodoTableCompanion.insert(title: 'todo2', completed: true));
    await sut.into(sut.dbTodoTable).insert(DbTodoTableCompanion.insert(title: 'todo3', completed: true));

    final resultTodos2 = await sut.select(sut.dbTodoTable).get();
    expect(resultTodos2.isEmpty, false);
    expect(resultTodos2.length, 3);

    await sut.deleteAllData();

    final resultTodos3 = await sut.select(sut.dbTodoTable).get();
    expect(resultTodos3.isEmpty, true);
  });''',
    '''  test('FlutterTemplateDatabase should delete all tables', () async {
    //Check if table is empty
    //Add 3 records
    //Check if the table contains 3 recods
    await sut.deleteAllData();
    //Check if tabl is empty
  });''',
  );
}

void _replaceInFile(String path, String originalString, String newString) {
  final file = File(path);
  if (!file.existsSync()) return;
  final original = file.readAsStringSync();
  final newContent = original.replaceAll(originalString, newString);
  file.writeAsStringSync(newContent);
}

final removeCodeLines = [
  "import 'package:flutter_template/model/database/todo/db_todo_table.dart';",
  "import 'package:flutter_template/model/webservice/todo/todo.dart';",
  "import 'package:flutter_template/viewmodel/todo/todo_add/todo_add_viewmodel.dart';",
  "import 'package:flutter_template/viewmodel/todo/todo_list/todo_list_viewmodel.dart';",
  "import 'package:flutter_template/viewmodel/todo/todo_list/todo_list_viewmodel.dart';",
  "import 'package:flutter_template/database/todo/todo_dao_storage.dart';",
  "import 'package:flutter_template/database/todo/todo_dao_storing.dart';",
  "import 'package:flutter_template/repository/todo/todo_repository.dart';",
  "import 'package:flutter_template/repository/todo/todo_repo.dart';",
  "import 'package:flutter_template/webservice/todo/todo_dummy_service.dart';",
  "import 'package:flutter_template/webservice/todo/todo_webservice.dart';",
  "import 'package:flutter_template/webservice/todo/todo_service.dart';",
  "import 'package:flutter_template/screen/todo/todo_list/todo_list_screen.dart';",
  "import 'package:flutter_template/screen/todo/todo_add/todo_add_screen.dart';",
  '  DbTodoTable,',
  '      case TodoAddScreen.routeName:',
  '        return MaterialPageRoute<void>(builder: (context) => const FlavorBanner(child: TodoAddScreen()), settings: settings);',
  '  void goToAddTodo();',
  '''  @override
  void goToAddTodo() => navigationKey.currentState?.pushNamed(TodoAddScreen.routeName);
''',
  '''  @override
  void goToAddTodo() => widget.mock.goToAddTodo();
''',
  //Test Lines
  '  TodoRepo,',
  '  TodoService,',
  '  TodoAddViewModel,',
  '  TodoListViewModel,',
  r'''  @singleton
  TodoDaoStoring get getTodoDaoStoring => MockTodoDaoStoring();
''',
  r'''  @singleton
  TodoRepo get getTodoRepo => MockTodoRepo();
''',
  r'''  @singleton
  TodoService get getTodoService => MockTodoService();
''',
  r'''  @singleton
  TodoAddViewModel get getTodoAddViewModel => _initVM(MockTodoAddViewModel());
''',
  r'''  @singleton
  TodoListViewModel get getTodoListViewModel => _initVM(MockTodoListViewModel());
''',
  "import '../mocks/database/todo/mock_todo_dao_storing.dart';",
  "import '../todo/todo_list/todo_list_screen_test.dart';",
  '    verifyTodoListViewModel();',
  r'''
void seedTodoListViewModel() {
  final todoListViewModel = GetIt.I<TodoListViewModel>();
  when(todoListViewModel.dataStream).thenAnswer((_) => Stream.value([
        for (var i = 0; i < 100; ++i) Todo(id: i, title: 'title $i', completed: false),
      ]));
  when(todoListViewModel.isLoading).thenReturn(false);
  when(todoListViewModel.errorKey).thenReturn(null);
  // ignore: void_checks
  when(todoListViewModel.onAddClicked()).thenReturn(1);
}

void seedTodoAddViewModel() {
  final todoAddViewModel = GetIt.I<TodoAddViewModel>();
  when(todoAddViewModel.isSaveEnabled).thenReturn(false);
  // ignore: void_checks
  when(todoAddViewModel.onBackClicked()).thenReturn(1);
}''',
  '    seedTodoListViewModel();',
];

final removeDirectories = [
  'lib/database/todo',
  'lib/model/database/todo',
  'lib/model/webservice/todo',
  'lib/repository/todo',
  'lib/screen/todo',
  'lib/viewmodel/todo',
  'lib/webservice/todo',
  'lib/widget/todo',
  //Test Directories
  'test/database/todo',
  'test/model/database/todo',
  'test/model/webservice/todo',
  'test/repository/todo',
  'test/screen/todo',
  'test/viewmodel/todo',
  'test/webservice/todo',
  'test/widget/todo',
  'test/mocks/database/todo',
];

final removeFiles = [
  //Test Directories
  'test/navigator/main_navigator_todo_add_test.dart',
];

class Logger {
  Logger._();

  static void debug(Object value) => print(value); // ignore: avoid_print

  static void info(Object value) => print(value); // ignore: avoid_print
  static void error(Object value) => print(value); // ignore: avoid_print
}
