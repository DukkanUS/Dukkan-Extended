// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a my locale. All the
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
  String get localeName => 'my';

  static String m0(limit) =>
      "အခမဲ့ဗားရှင်းတွင် ရုပ်ပုံရှာဖွေမှု ${limit}x သာရှိသည်။";

  static String m1(limit) =>
      "မက်ဆေ့ခ်ျ ${limit} စောင်အထိ အခမဲ့ဗားရှင်းတွင်သာ ပြသနိုင်သည်။";

  static String m2(date) => "စာရင်းသွင်းမှု သက်တမ်းကုန်ဆုံးရက် ${date}";

  static String m3(number) =>
      "ထုတ်လုပ်ပါ (${number} ${Intl.plural(number, one: 'time', other: 'times')})";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("အကြောင်း"),
        "apply": MessageLookupByLibrary.simpleMessage("လျှောက်ထားပါ"),
        "artist": MessageLookupByLibrary.simpleMessage("အနုပညာရှင်"),
        "cancel": MessageLookupByLibrary.simpleMessage("ပယ်ဖျက်ပါ"),
        "chat": MessageLookupByLibrary.simpleMessage("ချက်တင်"),
        "chatDetail": MessageLookupByLibrary.simpleMessage("ချတ်အသေးစိတ်"),
        "chatGPT": MessageLookupByLibrary.simpleMessage("GPT ချတ်"),
        "chatWithBot":
            MessageLookupByLibrary.simpleMessage("Bot နှင့် ချတ်လုပ်ပါ။"),
        "chooseArtist": MessageLookupByLibrary.simpleMessage(
            "သင့်ပုံအတွက် အနုပညာရှင်ကို ရွေးချယ်ပါ။"),
        "chooseDetail": MessageLookupByLibrary.simpleMessage(
            "သင့်ပုံအတွက် အသေးစိတ်ကို ရွေးပါ။"),
        "chooseMedium": MessageLookupByLibrary.simpleMessage(
            "သင့်ပုံအတွက် ကြားခံကို ရွေးပါ။"),
        "chooseMood": MessageLookupByLibrary.simpleMessage(
            "သင့်ပုံအတွက် စိတ်ခံစားချက်ကို ရွေးချယ်ပါ။"),
        "chooseUseCase":
            MessageLookupByLibrary.simpleMessage("အသုံးပြုပုံကို ရွေးချယ်ပါ။"),
        "choseStyle": MessageLookupByLibrary.simpleMessage(
            "သင့်ပုံအတွက် စတိုင်လ်ကို ရွေးချယ်ပါ။"),
        "clear": MessageLookupByLibrary.simpleMessage("ရှင်းလင်းသော"),
        "clearConfirm": MessageLookupByLibrary.simpleMessage(
            "အကြောင်းအရာကို ရှင်းလင်းရန် သေချာပါသလား။"),
        "clearContent":
            MessageLookupByLibrary.simpleMessage("အကြောင်းအရာကို ရှင်းလင်းပါ။"),
        "clearConversation":
            MessageLookupByLibrary.simpleMessage("ရှင်းလင်းပြောဆိုခြင်း။"),
        "confirm": MessageLookupByLibrary.simpleMessage("အတည်ပြုပါ"),
        "confirmDelete": MessageLookupByLibrary.simpleMessage(
            "ဤအရာအား ဖျက်ခြင်းနှင့်ပတ်သက်၍ ဆက်လက်လုပ်ဆောင်လိုပါက အတည်ပြုပါ။ ဤလုပ်ဆောင်ချက်ကို သင်ပြန်ပြင်၍မရပါ။"),
        "confirmDeleteItem": MessageLookupByLibrary.simpleMessage(
            "ဤအရာကို ဖျက်လိုသည်မှာ သေချာပါသလား။"),
        "confirmRemoveKey": MessageLookupByLibrary.simpleMessage(
            "သော့ကို ဖယ်ရှားရန် သေချာပါသလား။"),
        "copiedToClipboard": MessageLookupByLibrary.simpleMessage(
            "အကြောင်းအရာကို ကလစ်ဘုတ်သို့ ကူးယူထားသည်။"),
        "copy": MessageLookupByLibrary.simpleMessage("ကူးပါ"),
        "createChatFailed": MessageLookupByLibrary.simpleMessage(
            "ချတ်ဖန်တီးခြင်း မအောင်မြင်ပါ။"),
        "delete": MessageLookupByLibrary.simpleMessage("ဖျက်ပါ"),
        "deleteFailed": MessageLookupByLibrary.simpleMessage("ဖျက်၍မရပါ။"),
        "detail": MessageLookupByLibrary.simpleMessage("အသေးစိတ်"),
        "download": MessageLookupByLibrary.simpleMessage("ဒေါင်းလုပ်"),
        "edit": MessageLookupByLibrary.simpleMessage("တည်းဖြတ်ပါ"),
        "failedToGenerate":
            MessageLookupByLibrary.simpleMessage("ထုတ်လုပ်ရန် မအောင်မြင်ပါ။"),
        "generate": MessageLookupByLibrary.simpleMessage("Generate"),
        "grid": MessageLookupByLibrary.simpleMessage("ဂရစ်"),
        "imageGenerate": MessageLookupByLibrary.simpleMessage("ပုံထုတ်ပေးသည်။"),
        "imageSize": MessageLookupByLibrary.simpleMessage("ပုံအရွယ်အစား"),
        "inputKey": MessageLookupByLibrary.simpleMessage("ထည့်သွင်းသောကီး"),
        "interest": MessageLookupByLibrary.simpleMessage("အတိုး"),
        "introAboutKey": MessageLookupByLibrary.simpleMessage(
            "သင်၏ API ကီးကို သင့်မိုဘိုင်းတွင် စက်တွင်း၌ သိမ်းဆည်းထားပြီး အခြားမည်သည့်နေရာကိုမှ မပို့ပါ။ နောက်မှအသုံးပြုရန် သင့်သော့ကို သင်သိမ်းဆည်းနိုင်ပါသည်။ သင့်သော့ကို အသုံးမပြုလိုပါကလည်း ဖယ်ရှားနိုင်ပါသည်။"),
        "invalidKey": MessageLookupByLibrary.simpleMessage("ကီးမမှန်ကန်ပါ။"),
        "jobRole": MessageLookupByLibrary.simpleMessage("ယောဘကဏ္ R"),
        "jobSkills": MessageLookupByLibrary.simpleMessage("အလုပ်ကျွမ်းကျင်မှု"),
        "layoutStyle": MessageLookupByLibrary.simpleMessage("လက်ကွက်ပုံစံ"),
        "limitImage": m0,
        "limitTheText": m1,
        "listening": MessageLookupByLibrary.simpleMessage("နားထောင်နေသည်..."),
        "loadKeyFailed":
            MessageLookupByLibrary.simpleMessage("ကီးတင်ရန် မအောင်မြင်ပါ။"),
        "loadKeySuccess": MessageLookupByLibrary.simpleMessage(
            "သော့ဖွင့်ခြင်း အောင်မြင်သည်။"),
        "manage": MessageLookupByLibrary.simpleMessage("စီမံသည်"),
        "medium": MessageLookupByLibrary.simpleMessage("အလယ်အလတ်"),
        "mood": MessageLookupByLibrary.simpleMessage("စိတ်ဓာတ်"),
        "moreOptions":
            MessageLookupByLibrary.simpleMessage("နောက်ထပ် ရွေးချယ်စရာများ"),
        "newChat": MessageLookupByLibrary.simpleMessage("Chat အသစ်"),
        "noImageGenerate":
            MessageLookupByLibrary.simpleMessage("ပုံထုတ်ပေးခြင်းမရှိပါ။"),
        "numberOfImages": MessageLookupByLibrary.simpleMessage("ပုံအရေအတွက်"),
        "numberOfImagesCondition": MessageLookupByLibrary.simpleMessage(
            "ထုတ်လုပ်ရန် ပုံအရေအတွက်။ 1 နှင့် 10 ကြားရှိရမည်။"),
        "options": MessageLookupByLibrary.simpleMessage("ရွေးစရာများ"),
        "page": MessageLookupByLibrary.simpleMessage("စာမျက်နှာ"),
        "pleaseCheckConnection": MessageLookupByLibrary.simpleMessage(
            "သင့်ချိတ်ဆက်မှုကို စစ်ဆေးပြီး ထပ်စမ်းကြည့်ပါ။"),
        "pleaseInputFillAllFields":
            MessageLookupByLibrary.simpleMessage("ကွက်လပ်အားလုံးကို ဖြည့်ပါ။"),
        "pleaseInputKey":
            MessageLookupByLibrary.simpleMessage("ကျေးဇူးပြု၍ သော့ထည့်ပါ။"),
        "prompt": MessageLookupByLibrary.simpleMessage("ချက်ချင်း"),
        "putKeyHere":
            MessageLookupByLibrary.simpleMessage("သင့်သော့ကို ဤနေရာတွင်ထားပါ။"),
        "regenerateResponse":
            MessageLookupByLibrary.simpleMessage("တုံ့ပြန်မှုကို ပြန်ထုတ်ပါ။"),
        "remaining": MessageLookupByLibrary.simpleMessage("ကျန်"),
        "remove": MessageLookupByLibrary.simpleMessage("ဖယ်ရှားပါ"),
        "removeKeyFailed": MessageLookupByLibrary.simpleMessage(
            "သော့ကို ဖယ်ရှားခြင်း မအောင်မြင်ပါ။"),
        "removeKeySuccess": MessageLookupByLibrary.simpleMessage(
            "သော့ကို အောင်မြင်စွာ ဖယ်ရှားခဲ့သည်။"),
        "reset": MessageLookupByLibrary.simpleMessage("ပြန်လည်စတင်"),
        "resetSettings": MessageLookupByLibrary.simpleMessage(
            "ဆက်တင်များကို ပြန်လည်သတ်မှတ်ပါ။"),
        "save": MessageLookupByLibrary.simpleMessage("သိမ်းဆည်းပါ"),
        "saveKey": MessageLookupByLibrary.simpleMessage("သော့ကိုသိမ်းဆည်းပါ။"),
        "saveKeyFailed": MessageLookupByLibrary.simpleMessage(
            "သော့ကို သိမ်းဆည်းခြင်း မအောင်မြင်ပါ။"),
        "saveKeySuccess": MessageLookupByLibrary.simpleMessage(
            "သော့ကို အောင်မြင်စွာ သိမ်းဆည်းပြီးပါပြီ။"),
        "searchByPrompt":
            MessageLookupByLibrary.simpleMessage("Prompt ဖြင့်ရှာပါ..."),
        "sectionKeywords":
            MessageLookupByLibrary.simpleMessage("ကဏ္ဍ သော့ချက်စာလုံးများ"),
        "sectionTopic": MessageLookupByLibrary.simpleMessage("ကဏ္ဍခေါင်းစဉ်"),
        "selectChatFailed":
            MessageLookupByLibrary.simpleMessage("Chat Failed ကို ရွေးပါ။"),
        "selectPrompt":
            MessageLookupByLibrary.simpleMessage("Prompt ကို ရွေးပါ။"),
        "settings": MessageLookupByLibrary.simpleMessage("ချိန်ညှိချက်များ"),
        "share": MessageLookupByLibrary.simpleMessage("မျှဝေပါ"),
        "skills": MessageLookupByLibrary.simpleMessage("ကျွမ်းကျင်မှု"),
        "somethingWentWrong":
            MessageLookupByLibrary.simpleMessage("တစ်ခုခု မှားသွားသည်!!!"),
        "somethingWhenWrong": MessageLookupByLibrary.simpleMessage(
            "တစ်ခုခုမှားသွားသည်။ နောက်မှ ထပ်စမ်းကြည့်ပါ။ ကျေးဇူးအရမ်းတင်ပါတယ်!"),
        "speechNotAvailable":
            MessageLookupByLibrary.simpleMessage("စကားပြောမရနိုင်ပါ။"),
        "style": MessageLookupByLibrary.simpleMessage("စတိုင်"),
        "subscriptionExpiredDate": m2,
        "tapTheMicToTalk": MessageLookupByLibrary.simpleMessage(
            "စကားပြောရန် မိုက်ကို တို့ပါ။"),
        "textGenerate": MessageLookupByLibrary.simpleMessage("စာသားဖန်တီးပါ။"),
        "textGenerator": MessageLookupByLibrary.simpleMessage("စာသားမီးစက်"),
        "timeGenerate": m3,
        "typeAMessage":
            MessageLookupByLibrary.simpleMessage("မက်ဆေ့ခ်ျရိုက်ပါ..."),
        "view": MessageLookupByLibrary.simpleMessage("ကြည့်ရှုပါ"),
        "viewType":
            MessageLookupByLibrary.simpleMessage("ကြည့်ရှုမှုအမျိုးအစား"),
        "write": MessageLookupByLibrary.simpleMessage("ရေးပါ။")
      };
}
