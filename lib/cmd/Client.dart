import 'package:cmd_behavioral/cmd/Command.dart';

import 'Invoker.dart';
import 'Receiver.dart';

/// 命令对象和接受者对象的组装类[客户角色].
/// 理解:
/// 这只是命令模式中的一个客户角色，而不是我们常规意义上说的客户端
///
/// 职责：
/// 配置命令对象给invoker，使用invoker，在合适的时机执行
///
/// Receiver业务执行人，Cmd是具体调度人，
/// 其逻辑是Cmd可以控制多个业务执行人，合力完成一个命令。
/// code:
///   Client client = Client();
///   client.assembleAction();
class Client {
  /// 组装操作
  void assembleAction() {
    //创建一个命令接收者
    Receiver r = Receiver.initOne(); //创建一个命令的具体实现对象，并指定命令接收者
    Command command1 = ShowAPageCmd(r);
    Command command2 = ShowBPageCmd(r);

    Invoker invoker = Invoker(); //创建一个命令调用者
    invoker.setCommandA(command1); //为调用者指定命令对象1
    invoker.setCommandB(command2); //为调用者指定命令对象2
    invoker.invoke(cmd:"commandAPage"); //发起调用命令请求
    invoker.invoke(cmd:"commandBPage"); //发起调用命令请求
  }
}

