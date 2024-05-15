// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh_TW locale. All the
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
  String get localeName => 'zh_TW';

  static String m0(limit) => "免費版只有 ${limit}x 圖片搜索。";

  static String m1(limit) => "最多 ${limit} 條消息只能在免費版本中顯示。";

  static String m2(date) => "訂閱到期日期 ${date}";

  static String m3(number) =>
      "生成（${number} ${Intl.plural(number, one: 'time', other: 'times')}）";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("關於"),
        "apply": MessageLookupByLibrary.simpleMessage("應用"),
        "artist": MessageLookupByLibrary.simpleMessage("藝術家"),
        "cancel": MessageLookupByLibrary.simpleMessage("取消"),
        "chat": MessageLookupByLibrary.simpleMessage("聊"),
        "chatDetail": MessageLookupByLibrary.simpleMessage("聊天詳情"),
        "chatGPT": MessageLookupByLibrary.simpleMessage("聊天 GPT"),
        "chatWithBot": MessageLookupByLibrary.simpleMessage("與機器人聊天"),
        "chooseArtist": MessageLookupByLibrary.simpleMessage("為您的圖像選擇藝術家"),
        "chooseDetail": MessageLookupByLibrary.simpleMessage("選擇圖像的細節"),
        "chooseMedium": MessageLookupByLibrary.simpleMessage("為您的圖像選擇介質"),
        "chooseMood": MessageLookupByLibrary.simpleMessage("為您的圖像選擇心情"),
        "chooseUseCase": MessageLookupByLibrary.simpleMessage("選擇用例"),
        "choseStyle": MessageLookupByLibrary.simpleMessage("為您的圖片選擇風格"),
        "clear": MessageLookupByLibrary.simpleMessage("明確"),
        "clearConfirm": MessageLookupByLibrary.simpleMessage("您確定要清除內容嗎？"),
        "clearContent": MessageLookupByLibrary.simpleMessage("清除內容"),
        "clearConversation": MessageLookupByLibrary.simpleMessage("清晰的對話"),
        "confirm": MessageLookupByLibrary.simpleMessage("確認"),
        "confirmDelete":
            MessageLookupByLibrary.simpleMessage("請確認您是否希望繼續刪除該項目。您無法撤消此操作。"),
        "confirmDeleteItem":
            MessageLookupByLibrary.simpleMessage("您確定要刪除此項目嗎？"),
        "confirmRemoveKey": MessageLookupByLibrary.simpleMessage("您確定要刪除密鑰嗎？"),
        "copiedToClipboard": MessageLookupByLibrary.simpleMessage("將內容複製到剪貼板"),
        "copy": MessageLookupByLibrary.simpleMessage("複製"),
        "createChatFailed": MessageLookupByLibrary.simpleMessage("創建聊天失敗"),
        "delete": MessageLookupByLibrary.simpleMessage("刪除"),
        "deleteFailed": MessageLookupByLibrary.simpleMessage("刪除失敗"),
        "detail": MessageLookupByLibrary.simpleMessage("詳情"),
        "download": MessageLookupByLibrary.simpleMessage("下載"),
        "edit": MessageLookupByLibrary.simpleMessage("編輯"),
        "failedToGenerate": MessageLookupByLibrary.simpleMessage("生成失敗"),
        "generate": MessageLookupByLibrary.simpleMessage("生成"),
        "grid": MessageLookupByLibrary.simpleMessage("格"),
        "imageGenerate": MessageLookupByLibrary.simpleMessage("圖像生成"),
        "imageSize": MessageLookupByLibrary.simpleMessage("圖片大小"),
        "inputKey": MessageLookupByLibrary.simpleMessage("輸入鍵"),
        "interest": MessageLookupByLibrary.simpleMessage("興趣"),
        "introAboutKey": MessageLookupByLibrary.simpleMessage(
            "您的 API 密鑰存儲在您的本地手機上，絕不會發送到其他任何地方。您可以保存密鑰以備後用。如果您不想再使用它，也可以刪除您的密鑰。"),
        "invalidKey": MessageLookupByLibrary.simpleMessage("無效的密鑰"),
        "jobRole": MessageLookupByLibrary.simpleMessage("職業角色"),
        "jobSkills": MessageLookupByLibrary.simpleMessage("工作技巧"),
        "layoutStyle": MessageLookupByLibrary.simpleMessage("佈局樣式"),
        "limitImage": m0,
        "limitTheText": m1,
        "listening": MessageLookupByLibrary.simpleMessage("聽..."),
        "loadKeyFailed": MessageLookupByLibrary.simpleMessage("加載密鑰失敗"),
        "loadKeySuccess": MessageLookupByLibrary.simpleMessage("加載密鑰成功"),
        "manage": MessageLookupByLibrary.simpleMessage("管理"),
        "medium": MessageLookupByLibrary.simpleMessage("介質"),
        "mood": MessageLookupByLibrary.simpleMessage("情緒"),
        "moreOptions": MessageLookupByLibrary.simpleMessage("更多選擇"),
        "newChat": MessageLookupByLibrary.simpleMessage("新聊天"),
        "noImageGenerate": MessageLookupByLibrary.simpleMessage("沒有圖像生成"),
        "numberOfImages": MessageLookupByLibrary.simpleMessage("圖片數量"),
        "numberOfImagesCondition":
            MessageLookupByLibrary.simpleMessage("要生成的圖像數。必須介於 1 和 10 之間。"),
        "options": MessageLookupByLibrary.simpleMessage("選項"),
        "page": MessageLookupByLibrary.simpleMessage("頁"),
        "pleaseCheckConnection":
            MessageLookupByLibrary.simpleMessage("請檢查您的連接並重試！"),
        "pleaseInputFillAllFields":
            MessageLookupByLibrary.simpleMessage("請填寫所有字段"),
        "pleaseInputKey": MessageLookupByLibrary.simpleMessage("請輸入密鑰"),
        "prompt": MessageLookupByLibrary.simpleMessage("提示"),
        "putKeyHere": MessageLookupByLibrary.simpleMessage("把你的鑰匙放在這裡"),
        "regenerateResponse": MessageLookupByLibrary.simpleMessage("重新生成響應"),
        "remaining": MessageLookupByLibrary.simpleMessage("其餘"),
        "remove": MessageLookupByLibrary.simpleMessage("去掉"),
        "removeKeyFailed": MessageLookupByLibrary.simpleMessage("刪除密鑰失敗"),
        "removeKeySuccess": MessageLookupByLibrary.simpleMessage("成功刪除密鑰"),
        "reset": MessageLookupByLibrary.simpleMessage("重啟"),
        "resetSettings": MessageLookupByLibrary.simpleMessage("重新設置"),
        "save": MessageLookupByLibrary.simpleMessage("保存"),
        "saveKey": MessageLookupByLibrary.simpleMessage("保存密鑰"),
        "saveKeyFailed": MessageLookupByLibrary.simpleMessage("保存密鑰失敗"),
        "saveKeySuccess": MessageLookupByLibrary.simpleMessage("保存密鑰成功"),
        "searchByPrompt": MessageLookupByLibrary.simpleMessage("按提示搜索..."),
        "sectionKeywords": MessageLookupByLibrary.simpleMessage("欄目關鍵詞"),
        "sectionTopic": MessageLookupByLibrary.simpleMessage("節主題"),
        "selectChatFailed": MessageLookupByLibrary.simpleMessage("選擇聊天失敗"),
        "selectPrompt": MessageLookupByLibrary.simpleMessage("選擇提示"),
        "settings": MessageLookupByLibrary.simpleMessage("設置"),
        "share": MessageLookupByLibrary.simpleMessage("分享"),
        "skills": MessageLookupByLibrary.simpleMessage("技能"),
        "somethingWentWrong": MessageLookupByLibrary.simpleMessage("出了些問題！！！"),
        "somethingWhenWrong":
            MessageLookupByLibrary.simpleMessage("出了些問題！請稍後再試。太感謝了！"),
        "speechNotAvailable": MessageLookupByLibrary.simpleMessage("語音不可用"),
        "style": MessageLookupByLibrary.simpleMessage("樣式"),
        "subscriptionExpiredDate": m2,
        "tapTheMicToTalk": MessageLookupByLibrary.simpleMessage("點擊麥克風說話"),
        "textGenerate": MessageLookupByLibrary.simpleMessage("文本生成"),
        "textGenerator": MessageLookupByLibrary.simpleMessage("文本生成器"),
        "timeGenerate": m3,
        "typeAMessage": MessageLookupByLibrary.simpleMessage("輸入消息..."),
        "view": MessageLookupByLibrary.simpleMessage("視圖"),
        "viewType": MessageLookupByLibrary.simpleMessage("查看類型"),
        "write": MessageLookupByLibrary.simpleMessage("寫")
      };
}
