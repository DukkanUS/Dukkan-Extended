// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'zh';

  static String m0(limit) => "免费版只有 ${limit}x 图片搜索。";

  static String m1(limit) => "最多 ${limit} 条消息只能在免费版本中显示。";

  static String m2(date) => "订阅到期日期 ${date}";

  static String m3(number) =>
      "生成（${number} ${Intl.plural(number, one: 'time', other: 'times')}）";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("关于"),
        "apply": MessageLookupByLibrary.simpleMessage("应用"),
        "artist": MessageLookupByLibrary.simpleMessage("艺术家"),
        "cancel": MessageLookupByLibrary.simpleMessage("取消"),
        "chat": MessageLookupByLibrary.simpleMessage("聊"),
        "chatDetail": MessageLookupByLibrary.simpleMessage("聊天详情"),
        "chatGPT": MessageLookupByLibrary.simpleMessage("聊天 GPT"),
        "chatWithBot": MessageLookupByLibrary.simpleMessage("与机器人聊天"),
        "chooseArtist": MessageLookupByLibrary.simpleMessage("为您的图像选择艺术家"),
        "chooseDetail": MessageLookupByLibrary.simpleMessage("选择图像的细节"),
        "chooseMedium": MessageLookupByLibrary.simpleMessage("为您的图像选择介质"),
        "chooseMood": MessageLookupByLibrary.simpleMessage("为您的图像选择心情"),
        "chooseUseCase": MessageLookupByLibrary.simpleMessage("选择用例"),
        "choseStyle": MessageLookupByLibrary.simpleMessage("为您的图片选择风格"),
        "clear": MessageLookupByLibrary.simpleMessage("明确"),
        "clearConfirm": MessageLookupByLibrary.simpleMessage("您确定要清除内容吗？"),
        "clearContent": MessageLookupByLibrary.simpleMessage("清除内容"),
        "clearConversation": MessageLookupByLibrary.simpleMessage("清晰的对话"),
        "confirm": MessageLookupByLibrary.simpleMessage("确认"),
        "confirmDelete":
            MessageLookupByLibrary.simpleMessage("请确认您是否希望继续删除该项目。您无法撤消此操作。"),
        "confirmDeleteItem":
            MessageLookupByLibrary.simpleMessage("您确定要删除此项目吗？"),
        "confirmRemoveKey": MessageLookupByLibrary.simpleMessage("您确定要删除密钥吗？"),
        "copiedToClipboard": MessageLookupByLibrary.simpleMessage("将内容复制到剪贴板"),
        "copy": MessageLookupByLibrary.simpleMessage("复制"),
        "createChatFailed": MessageLookupByLibrary.simpleMessage("创建聊天失败"),
        "delete": MessageLookupByLibrary.simpleMessage("删除"),
        "deleteFailed": MessageLookupByLibrary.simpleMessage("删除失败"),
        "detail": MessageLookupByLibrary.simpleMessage("详情"),
        "download": MessageLookupByLibrary.simpleMessage("下载"),
        "edit": MessageLookupByLibrary.simpleMessage("编辑"),
        "failedToGenerate": MessageLookupByLibrary.simpleMessage("生成失败"),
        "generate": MessageLookupByLibrary.simpleMessage("生成"),
        "grid": MessageLookupByLibrary.simpleMessage("格"),
        "imageGenerate": MessageLookupByLibrary.simpleMessage("图像生成"),
        "imageSize": MessageLookupByLibrary.simpleMessage("图片尺寸"),
        "inputKey": MessageLookupByLibrary.simpleMessage("输入键"),
        "interest": MessageLookupByLibrary.simpleMessage("利益"),
        "introAboutKey": MessageLookupByLibrary.simpleMessage(
            "您的 API 密钥存储在您的本地手机上，绝不会发送到其他任何地方。您可以保存密钥以备后用。如果您不想再使用它，也可以删除您的密钥。"),
        "invalidKey": MessageLookupByLibrary.simpleMessage("无效的密钥"),
        "jobRole": MessageLookupByLibrary.simpleMessage("职业角色"),
        "jobSkills": MessageLookupByLibrary.simpleMessage("工作技巧"),
        "layoutStyle": MessageLookupByLibrary.simpleMessage("布局样式"),
        "limitImage": m0,
        "limitTheText": m1,
        "listening": MessageLookupByLibrary.simpleMessage("听..."),
        "loadKeyFailed": MessageLookupByLibrary.simpleMessage("加载密钥失败"),
        "loadKeySuccess": MessageLookupByLibrary.simpleMessage("加载密钥成功"),
        "manage": MessageLookupByLibrary.simpleMessage("管理"),
        "medium": MessageLookupByLibrary.simpleMessage("介质"),
        "mood": MessageLookupByLibrary.simpleMessage("心情"),
        "moreOptions": MessageLookupByLibrary.simpleMessage("更多的选择"),
        "newChat": MessageLookupByLibrary.simpleMessage("新聊天"),
        "noImageGenerate": MessageLookupByLibrary.simpleMessage("没有图像生成"),
        "numberOfImages": MessageLookupByLibrary.simpleMessage("图片数量"),
        "numberOfImagesCondition":
            MessageLookupByLibrary.simpleMessage("要生成的图像数。必须介于 1 和 10 之间。"),
        "options": MessageLookupByLibrary.simpleMessage("选项"),
        "page": MessageLookupByLibrary.simpleMessage("页"),
        "pleaseCheckConnection":
            MessageLookupByLibrary.simpleMessage("请检查您的连接并重试！"),
        "pleaseInputFillAllFields":
            MessageLookupByLibrary.simpleMessage("请填写所有字段"),
        "pleaseInputKey": MessageLookupByLibrary.simpleMessage("请输入密钥"),
        "prompt": MessageLookupByLibrary.simpleMessage("提示"),
        "putKeyHere": MessageLookupByLibrary.simpleMessage("把你的钥匙放在这里"),
        "regenerateResponse": MessageLookupByLibrary.simpleMessage("重新生成响应"),
        "remaining": MessageLookupByLibrary.simpleMessage("其余"),
        "remove": MessageLookupByLibrary.simpleMessage("去掉"),
        "removeKeyFailed": MessageLookupByLibrary.simpleMessage("删除密钥失败"),
        "removeKeySuccess": MessageLookupByLibrary.simpleMessage("成功删除密钥"),
        "reset": MessageLookupByLibrary.simpleMessage("重启"),
        "resetSettings": MessageLookupByLibrary.simpleMessage("重新设置"),
        "save": MessageLookupByLibrary.simpleMessage("保存"),
        "saveKey": MessageLookupByLibrary.simpleMessage("保存密钥"),
        "saveKeyFailed": MessageLookupByLibrary.simpleMessage("保存密钥失败"),
        "saveKeySuccess": MessageLookupByLibrary.simpleMessage("保存密钥成功"),
        "searchByPrompt": MessageLookupByLibrary.simpleMessage("按提示搜索..."),
        "sectionKeywords": MessageLookupByLibrary.simpleMessage("栏目关键词"),
        "sectionTopic": MessageLookupByLibrary.simpleMessage("节主题"),
        "selectChatFailed": MessageLookupByLibrary.simpleMessage("选择聊天失败"),
        "selectPrompt": MessageLookupByLibrary.simpleMessage("选择提示"),
        "settings": MessageLookupByLibrary.simpleMessage("设置"),
        "share": MessageLookupByLibrary.simpleMessage("分享"),
        "skills": MessageLookupByLibrary.simpleMessage("技能专长"),
        "somethingWentWrong": MessageLookupByLibrary.simpleMessage("出了些问题！！！"),
        "somethingWhenWrong":
            MessageLookupByLibrary.simpleMessage("出了些问题！请稍后再试。太感谢了！"),
        "speechNotAvailable": MessageLookupByLibrary.simpleMessage("语音不可用"),
        "style": MessageLookupByLibrary.simpleMessage("样式"),
        "subscriptionExpiredDate": m2,
        "tapTheMicToTalk": MessageLookupByLibrary.simpleMessage("点击麦克风说话"),
        "textGenerate": MessageLookupByLibrary.simpleMessage("文本生成"),
        "textGenerator": MessageLookupByLibrary.simpleMessage("文本生成器"),
        "timeGenerate": m3,
        "typeAMessage": MessageLookupByLibrary.simpleMessage("输入讯息..."),
        "view": MessageLookupByLibrary.simpleMessage("视图"),
        "viewType": MessageLookupByLibrary.simpleMessage("查看类型"),
        "write": MessageLookupByLibrary.simpleMessage("写")
      };
}
