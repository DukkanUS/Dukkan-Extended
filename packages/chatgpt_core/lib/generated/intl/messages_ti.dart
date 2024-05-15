// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ti locale. All the
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
  String get localeName => 'ti';

  static String m0(limit) => "ኣብቲ ነጻ ስሪት ${limit}x ምስሊ ምድላይ ጥራይ እዩ ዘሎ።";

  static String m1(limit) =>
      "ክሳብ ${limit} ዝበጽሕ መልእኽትታት ኣብቲ ነጻ ስሪት ጥራይ እዩ ክረአ ዝኽእል።";

  static String m2(date) => "ምዝገባ ዝውድኣሉ ዕለት ${date}";

  static String m3(number) =>
      "ምፍጣር (${number} ${Intl.plural(number, one: 'time', other: 'times')}) ።";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("ብዝዕባ"),
        "apply": MessageLookupByLibrary.simpleMessage("ኣተግብር"),
        "artist": MessageLookupByLibrary.simpleMessage("ኣርቲስት"),
        "cancel": MessageLookupByLibrary.simpleMessage("ሰርዝ"),
        "chat": MessageLookupByLibrary.simpleMessage("ፀወታ"),
        "chatDetail": MessageLookupByLibrary.simpleMessage("ዝርዝር ዕላል"),
        "chatGPT": MessageLookupByLibrary.simpleMessage("ቻት ጂፒቲ"),
        "chatWithBot": MessageLookupByLibrary.simpleMessage("ምስ ቦት ዕላል ግበር"),
        "chooseArtist": MessageLookupByLibrary.simpleMessage("ምስልኻ ስነጥበባዊ ምረጽ"),
        "chooseDetail": MessageLookupByLibrary.simpleMessage("ምስልኻ ዝርዝር ምረጽ"),
        "chooseMedium": MessageLookupByLibrary.simpleMessage("ምስልኻ ማእከላይ ምረጽ"),
        "chooseMood": MessageLookupByLibrary.simpleMessage("ምስልኻ ስሚዒት ምረጽ"),
        "chooseUseCase": MessageLookupByLibrary.simpleMessage("use case ምረጽ"),
        "choseStyle": MessageLookupByLibrary.simpleMessage("ምስልኻ ቅዲ ምረጽ"),
        "clear": MessageLookupByLibrary.simpleMessage("ንፁር"),
        "clearConfirm":
            MessageLookupByLibrary.simpleMessage("ትሕዝቶ ከተጽርዮ ርግጸኛ ዲኻ?"),
        "clearContent": MessageLookupByLibrary.simpleMessage("ንጹር ትሕዝቶ"),
        "clearConversation": MessageLookupByLibrary.simpleMessage("ንጹር ዕላል"),
        "confirm": MessageLookupByLibrary.simpleMessage("ኣረጋግፅ"),
        "confirmDelete": MessageLookupByLibrary.simpleMessage(
            "እዚ ንብረት ምድምሳስ ክትቅጽሉ ምስ እትደልዩ ኣረጋግጹ። ነዚ ተግባር ክትመልሶ ኣይትኽእልን ኢኻ።"),
        "confirmDeleteItem": MessageLookupByLibrary.simpleMessage(
            "ነዚ ንብረት ክትድምስሶ ከም እትደሊ ርግጸኛ ዲኻ?"),
        "confirmRemoveKey":
            MessageLookupByLibrary.simpleMessage("መፍትሕ ከም እተውጽእ ርግጸኛ ዲኻ?"),
        "copiedToClipboard":
            MessageLookupByLibrary.simpleMessage("ትሕዝቶ ናብ ቅንጥብጣብ ሰሌዳ ዝተቐድሐ"),
        "copy": MessageLookupByLibrary.simpleMessage("ቅዳሕ"),
        "createChatFailed":
            MessageLookupByLibrary.simpleMessage("ቻት ምፍጣር ፈሺሉ።"),
        "delete": MessageLookupByLibrary.simpleMessage("ምድምሳስ"),
        "deleteFailed": MessageLookupByLibrary.simpleMessage("ምድምሳስ ኣይተዓወተን"),
        "detail": MessageLookupByLibrary.simpleMessage("ዝርዝር"),
        "download": MessageLookupByLibrary.simpleMessage("ምውራድ"),
        "edit": MessageLookupByLibrary.simpleMessage("ምዕራይ"),
        "failedToGenerate": MessageLookupByLibrary.simpleMessage("ምፍራይ ኣይከኣለን"),
        "generate": MessageLookupByLibrary.simpleMessage("ምምንጫው"),
        "grid": MessageLookupByLibrary.simpleMessage("መስመር"),
        "imageGenerate": MessageLookupByLibrary.simpleMessage("ምስሊ ምፍጣር"),
        "imageSize": MessageLookupByLibrary.simpleMessage("መጠን ምስሊ"),
        "inputKey": MessageLookupByLibrary.simpleMessage("መፍትሕ ምእታው"),
        "interest": MessageLookupByLibrary.simpleMessage("ወለድ"),
        "introAboutKey": MessageLookupByLibrary.simpleMessage(
            "ኤፒኣይ መፍትሕካ ኣብ ሞባይልካ ኣብ ከባቢኻ ይኽዘን እምበር ናብ ካልእ ቦታ ተላኢኹ ኣይፈልጥን። መፍትሕካ ድሒርካ ክትጥቀመሉ ክትዕቅቦ ትኽእል ኢኻ። ድሕሪ ሕጂ ክትጥቀመሉ እንተዘይደሊኻ ውን መፍትሕካ ከተውጽኦ ትኽእል ኢኻ።"),
        "invalidKey": MessageLookupByLibrary.simpleMessage("ዘይሕጋዊ መፍትሕ"),
        "jobRole": MessageLookupByLibrary.simpleMessage("ተራ ስራሕ"),
        "jobSkills": MessageLookupByLibrary.simpleMessage("ናይ ስራሕ ክእለት።"),
        "layoutStyle": MessageLookupByLibrary.simpleMessage("ቅዲ ኣቀማምጣ"),
        "limitImage": m0,
        "limitTheText": m1,
        "listening": MessageLookupByLibrary.simpleMessage("ምድማፅ..."),
        "loadKeyFailed": MessageLookupByLibrary.simpleMessage("መፍትሕ ጽዕነት ፈሺሉ።"),
        "loadKeySuccess": MessageLookupByLibrary.simpleMessage("ዓወት ቁልፊ ጽዕነት"),
        "manage": MessageLookupByLibrary.simpleMessage("ኣተሓሕዛ"),
        "medium": MessageLookupByLibrary.simpleMessage("ማእኸላይ"),
        "mood": MessageLookupByLibrary.simpleMessage("ስምዒት"),
        "moreOptions": MessageLookupByLibrary.simpleMessage("ተወሳኺ ኣማራጺታት"),
        "newChat": MessageLookupByLibrary.simpleMessage("ሓድሽ ዕላል"),
        "noImageGenerate": MessageLookupByLibrary.simpleMessage("ምስሊ ዝፈጥር የለን"),
        "numberOfImages": MessageLookupByLibrary.simpleMessage("ብዝሒ ምስልታት"),
        "numberOfImagesCondition": MessageLookupByLibrary.simpleMessage(
            "ብዝሒ ምስልታት ክትፈጥሮ ዘለካ። ካብ 1 ክሳብ 10 ክኸውን ኣለዎ።"),
        "options": MessageLookupByLibrary.simpleMessage("ኣማራጺታት"),
        "page": MessageLookupByLibrary.simpleMessage("ገጽ"),
        "pleaseCheckConnection": MessageLookupByLibrary.simpleMessage(
            "በጃኹም ርክብኩም ኣረጋግጹ እሞ እንደገና ፈትኑ!"),
        "pleaseInputFillAllFields":
            MessageLookupByLibrary.simpleMessage("በጃኹም ኩሉ ቦታታት ምልኣዩ።"),
        "pleaseInputKey":
            MessageLookupByLibrary.simpleMessage("በጃኹም መፍትሕ ኣእትዉ"),
        "prompt": MessageLookupByLibrary.simpleMessage("ምስዓብ"),
        "putKeyHere": MessageLookupByLibrary.simpleMessage("መፍትሕካ ኣብዚ ኣቐምጥ"),
        "regenerateResponse":
            MessageLookupByLibrary.simpleMessage("ምላሽ ዳግማይ ምፍጣር"),
        "remaining": MessageLookupByLibrary.simpleMessage("ዝተረፈ"),
        "remove": MessageLookupByLibrary.simpleMessage("ኣወግድ"),
        "removeKeyFailed":
            MessageLookupByLibrary.simpleMessage("መፍትሕ ምእላይ ፈሺሉ።"),
        "removeKeySuccess":
            MessageLookupByLibrary.simpleMessage("መፍትሕ ብዓወት ተኣልዩ።"),
        "reset": MessageLookupByLibrary.simpleMessage("ዳግማይ ምትካል"),
        "resetSettings":
            MessageLookupByLibrary.simpleMessage("ቅጥዕታት ዳግማይ ምትካል"),
        "save": MessageLookupByLibrary.simpleMessage("ምቑጣብ"),
        "saveKey": MessageLookupByLibrary.simpleMessage("መፍትሕ ምዕቃብ"),
        "saveKeyFailed": MessageLookupByLibrary.simpleMessage("መፍትሕ ምዕቃብ ፈሺሉ።"),
        "saveKeySuccess":
            MessageLookupByLibrary.simpleMessage("ዝተዓቀበ መፍትሕ ብዓወት"),
        "searchByPrompt": MessageLookupByLibrary.simpleMessage("ብፕሮምፕት ድለዩ..."),
        "sectionKeywords": MessageLookupByLibrary.simpleMessage("ክፍሊ መፍትሕ ቃላት"),
        "sectionTopic": MessageLookupByLibrary.simpleMessage("ክፍሊ ኣርእስቲ"),
        "selectChatFailed":
            MessageLookupByLibrary.simpleMessage("Chat Failed ዝብል ምረጽ"),
        "selectPrompt": MessageLookupByLibrary.simpleMessage("Prompt ዝብል ምረጽ"),
        "settings": MessageLookupByLibrary.simpleMessage("ቅጥዕታት"),
        "share": MessageLookupByLibrary.simpleMessage("ናይ ሓባር"),
        "skills": MessageLookupByLibrary.simpleMessage("ክእለታት"),
        "somethingWentWrong":
            MessageLookupByLibrary.simpleMessage("ገለ ነገር ተጋግዩ!!!"),
        "somethingWhenWrong": MessageLookupByLibrary.simpleMessage(
            "ገለ ነገር ተጋግዩ! በጃኹም ድሒርኩም ደጊምኩም ፈትኑ። ብጣዕሚ የቅንየልና!"),
        "speechNotAvailable":
            MessageLookupByLibrary.simpleMessage("ዘረባ ኣይርከብን።"),
        "style": MessageLookupByLibrary.simpleMessage("ኣገባብ"),
        "subscriptionExpiredDate": m2,
        "tapTheMicToTalk":
            MessageLookupByLibrary.simpleMessage("ንምዝርራብ ማይክ ጠውቕ"),
        "textGenerate": MessageLookupByLibrary.simpleMessage("ጽሑፍ ምፍጣር"),
        "textGenerator": MessageLookupByLibrary.simpleMessage("ጽሑፍ ጀነሬተር"),
        "timeGenerate": m3,
        "typeAMessage": MessageLookupByLibrary.simpleMessage("መልእኽቲ ጽሓፍ..."),
        "view": MessageLookupByLibrary.simpleMessage("ኣረኣእያ"),
        "viewType": MessageLookupByLibrary.simpleMessage("ዓይነት ርእይቶ"),
        "write": MessageLookupByLibrary.simpleMessage("ፀሓፍ")
      };
}
