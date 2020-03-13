import 'Command.dart';
/// 这里总览命令集合
///
/// “触发者 （Invoker）”——类负责对请求进行初始化
///
/// 重要：职责是执行命令对象，命令不要在这里创建。
class Invoker {
  /// 命令对象可以继续扩展写法
  ///
  /// 可以map，list，或者多个平铺对象
  Command commandAPage;
  Command commandBPage;

  /// 持有多个命令对象[实际的情况也可能是一个命令对象的集合来保存命令对象]
  void setCommandA(Command command1) {
    this.commandAPage = command1;
  }

  void setCommandB(Command command2) {
    this.commandBPage = command2;
  }

  /// 执行正常命令，执行回滚命令
  ///
  /// 命令可以增量操作，识别操作便会走default
  void invoke({String cmd:""}) {
    //可以根据具体情况选择执行某些命令
    switch(cmd){
      case "commandAPage":
        commandAPage.execute();
        break;
      case "commandBPage":
        commandBPage.execute();
        break;
      default:
        print("no App CMD Found");
    }
  }
}
