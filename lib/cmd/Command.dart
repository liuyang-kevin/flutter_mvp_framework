import 'package:cmd_behavioral/cmd/Receiver.dart';

/// 命令接口，抽象"命令"给Invoker统筹
abstract class Command {
  void execute();

  void undo();

  void redo();
}

/// 命令实现
///
/// 重要：不完成工作，只委派receiver干活、委派具体完成人完成工作
class ShowAPageCmd implements Command {
  Receiver receiver;

  ShowAPageCmd(this.receiver);

  @override
  void execute() {
    receiver.opActionUpdateAge(1001);
  }

  @override
  void redo() {}

  @override
  void undo() {
    receiver.rollBackAge();
  }
}

/// 命令实现
class ShowBPageCmd implements Command {
  Receiver receiver;

  ShowBPageCmd(this.receiver);

  @override
  void execute() {
    receiver.opActionUpdateName("name");
  }

  @override
  void redo() {}

  @override
  void undo() {
    receiver.rollBackName();
  }
}
