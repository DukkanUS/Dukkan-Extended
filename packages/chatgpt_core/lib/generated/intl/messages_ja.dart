// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ja locale. All the
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
  String get localeName => 'ja';

  static String m0(limit) => "無料版では画像検索は ${limit}x しかありません。";

  static String m1(limit) => "最大 ${limit} 件のメッセージは、無料版でのみ表示できます。";

  static String m2(date) => "サブスクリプションの有効期限が切れた日 ${date}";

  static String m3(number) =>
      "生成 (${number} ${Intl.plural(number, one: 'time', other: 'times')})";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("約"),
        "apply": MessageLookupByLibrary.simpleMessage("適用する"),
        "artist": MessageLookupByLibrary.simpleMessage("アーティスト"),
        "cancel": MessageLookupByLibrary.simpleMessage("キャンセル"),
        "chat": MessageLookupByLibrary.simpleMessage("チャット"),
        "chatDetail": MessageLookupByLibrary.simpleMessage("チャットの詳細"),
        "chatGPT": MessageLookupByLibrary.simpleMessage("チャットGPT"),
        "chatWithBot": MessageLookupByLibrary.simpleMessage("ボットとチャット"),
        "chooseArtist": MessageLookupByLibrary.simpleMessage("画像のアーティストを選択"),
        "chooseDetail": MessageLookupByLibrary.simpleMessage("画像の詳細を選択してください"),
        "chooseMedium": MessageLookupByLibrary.simpleMessage("画像の媒体を選択してください"),
        "chooseMood": MessageLookupByLibrary.simpleMessage("画像の雰囲気を選択してください"),
        "chooseUseCase": MessageLookupByLibrary.simpleMessage("ユースケースを選択"),
        "choseStyle": MessageLookupByLibrary.simpleMessage("画像のスタイルを選択してください"),
        "clear": MessageLookupByLibrary.simpleMessage("クリア"),
        "clearConfirm":
            MessageLookupByLibrary.simpleMessage("コンテンツをクリアしてもよろしいですか？"),
        "clearContent": MessageLookupByLibrary.simpleMessage("コンテンツをクリア"),
        "clearConversation": MessageLookupByLibrary.simpleMessage("クリアな会話"),
        "confirm": MessageLookupByLibrary.simpleMessage("確認"),
        "confirmDelete": MessageLookupByLibrary.simpleMessage(
            "このアイテムの削除を続行するかどうかを確認してください。この操作を元に戻すことはできません。"),
        "confirmDeleteItem":
            MessageLookupByLibrary.simpleMessage("このアイテムを削除してもよろしいですか？"),
        "confirmRemoveKey":
            MessageLookupByLibrary.simpleMessage("本当にキーを削除しますか?"),
        "copiedToClipboard":
            MessageLookupByLibrary.simpleMessage("コンテンツをクリップボードにコピーしました"),
        "copy": MessageLookupByLibrary.simpleMessage("コピーする"),
        "createChatFailed":
            MessageLookupByLibrary.simpleMessage("チャットの作成に失敗しました"),
        "delete": MessageLookupByLibrary.simpleMessage("削除"),
        "deleteFailed": MessageLookupByLibrary.simpleMessage("削除に失敗しました"),
        "detail": MessageLookupByLibrary.simpleMessage("詳細"),
        "download": MessageLookupByLibrary.simpleMessage("ダウンロード"),
        "edit": MessageLookupByLibrary.simpleMessage("編集"),
        "failedToGenerate": MessageLookupByLibrary.simpleMessage("生成に失敗しました"),
        "generate": MessageLookupByLibrary.simpleMessage("生成する"),
        "grid": MessageLookupByLibrary.simpleMessage("グリッド"),
        "imageGenerate": MessageLookupByLibrary.simpleMessage("画像生成"),
        "imageSize": MessageLookupByLibrary.simpleMessage("画像サイズ"),
        "inputKey": MessageLookupByLibrary.simpleMessage("キー入力"),
        "interest": MessageLookupByLibrary.simpleMessage("興味"),
        "introAboutKey": MessageLookupByLibrary.simpleMessage(
            "API キーはモバイル上でローカルに保存され、他の場所に送信されることはありません。後で使用するためにキーを保存できます。キーをもう使用したくない場合は、キーを削除することもできます。"),
        "invalidKey": MessageLookupByLibrary.simpleMessage("無効キー"),
        "jobRole": MessageLookupByLibrary.simpleMessage("職務"),
        "jobSkills": MessageLookupByLibrary.simpleMessage("ジョブスキル"),
        "layoutStyle": MessageLookupByLibrary.simpleMessage("レイアウトスタイル"),
        "limitImage": m0,
        "limitTheText": m1,
        "listening": MessageLookupByLibrary.simpleMessage("聞いている..."),
        "loadKeyFailed": MessageLookupByLibrary.simpleMessage("キーのロードに失敗しました"),
        "loadKeySuccess": MessageLookupByLibrary.simpleMessage("キーのロードが成功しました"),
        "manage": MessageLookupByLibrary.simpleMessage("管理する"),
        "medium": MessageLookupByLibrary.simpleMessage("中"),
        "mood": MessageLookupByLibrary.simpleMessage("ムード"),
        "moreOptions": MessageLookupByLibrary.simpleMessage("より多くのオプション"),
        "newChat": MessageLookupByLibrary.simpleMessage("新しいチャット"),
        "noImageGenerate": MessageLookupByLibrary.simpleMessage("画像生成なし"),
        "numberOfImages": MessageLookupByLibrary.simpleMessage("画像数"),
        "numberOfImagesCondition": MessageLookupByLibrary.simpleMessage(
            "生成する画像の数。 1 から 10 の間でなければなりません。"),
        "options": MessageLookupByLibrary.simpleMessage("オプション"),
        "page": MessageLookupByLibrary.simpleMessage("ページ"),
        "pleaseCheckConnection":
            MessageLookupByLibrary.simpleMessage("接続を確認して、もう一度お試しください。"),
        "pleaseInputFillAllFields":
            MessageLookupByLibrary.simpleMessage("すべてのフィールドに記入してください"),
        "pleaseInputKey": MessageLookupByLibrary.simpleMessage("キーを入力してください"),
        "prompt": MessageLookupByLibrary.simpleMessage("促す"),
        "putKeyHere": MessageLookupByLibrary.simpleMessage("ここに鍵を置きます"),
        "regenerateResponse": MessageLookupByLibrary.simpleMessage("応答を再生成する"),
        "remaining": MessageLookupByLibrary.simpleMessage("残り"),
        "remove": MessageLookupByLibrary.simpleMessage("削除する"),
        "removeKeyFailed": MessageLookupByLibrary.simpleMessage("キーの削除に失敗しました"),
        "removeKeySuccess":
            MessageLookupByLibrary.simpleMessage("キーが正常に削除されました"),
        "reset": MessageLookupByLibrary.simpleMessage("リセット"),
        "resetSettings": MessageLookupByLibrary.simpleMessage("設定をリセット"),
        "save": MessageLookupByLibrary.simpleMessage("保存する"),
        "saveKey": MessageLookupByLibrary.simpleMessage("キーの保存"),
        "saveKeyFailed": MessageLookupByLibrary.simpleMessage("キーの保存に失敗しました"),
        "saveKeySuccess": MessageLookupByLibrary.simpleMessage("キーが正常に保存されました"),
        "searchByPrompt": MessageLookupByLibrary.simpleMessage("プロンプトで検索..."),
        "sectionKeywords": MessageLookupByLibrary.simpleMessage("セクションのキーワード"),
        "sectionTopic": MessageLookupByLibrary.simpleMessage("セクションのトピック"),
        "selectChatFailed":
            MessageLookupByLibrary.simpleMessage("チャットの選択に失敗しました"),
        "selectPrompt": MessageLookupByLibrary.simpleMessage("プロンプトを選択"),
        "settings": MessageLookupByLibrary.simpleMessage("設定"),
        "share": MessageLookupByLibrary.simpleMessage("シェア"),
        "skills": MessageLookupByLibrary.simpleMessage("スキル"),
        "somethingWentWrong":
            MessageLookupByLibrary.simpleMessage("何か問題が発生しました!!!"),
        "somethingWhenWrong": MessageLookupByLibrary.simpleMessage(
            "エラーが発生しました。後でもう一度やり直してください。どうもありがとうございます！"),
        "speechNotAvailable":
            MessageLookupByLibrary.simpleMessage("スピーチは利用できません"),
        "style": MessageLookupByLibrary.simpleMessage("スタイル"),
        "subscriptionExpiredDate": m2,
        "tapTheMicToTalk": MessageLookupByLibrary.simpleMessage("マイクをタップして話す"),
        "textGenerate": MessageLookupByLibrary.simpleMessage("テキスト生成"),
        "textGenerator": MessageLookupByLibrary.simpleMessage("テキストジェネレーター"),
        "timeGenerate": m3,
        "typeAMessage": MessageLookupByLibrary.simpleMessage("メッセージを入力..."),
        "view": MessageLookupByLibrary.simpleMessage("見る"),
        "viewType": MessageLookupByLibrary.simpleMessage("表示タイプ"),
        "write": MessageLookupByLibrary.simpleMessage("書きます")
      };
}
