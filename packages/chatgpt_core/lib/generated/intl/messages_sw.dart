// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a sw locale. All the
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
  String get localeName => 'sw';

  static String m0(limit) =>
      "Kuna utafutaji wa picha wa x ${limit}pekee katika toleo lisilolipishwa.";

  static String m1(limit) =>
      "Hadi jumbe ${limit} zinaweza kuonyeshwa katika toleo lisilolipishwa pekee.";

  static String m2(date) => "Tarehe ya mwisho ya usajili ${date}";

  static String m3(number) =>
      "Tengeneza (${number} ${Intl.plural(number, one: 'time', other: 'times')})";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("Kuhusu"),
        "apply": MessageLookupByLibrary.simpleMessage("Omba"),
        "artist": MessageLookupByLibrary.simpleMessage("Msanii"),
        "cancel": MessageLookupByLibrary.simpleMessage("Ghairi"),
        "chat": MessageLookupByLibrary.simpleMessage("Ongea"),
        "chatDetail": MessageLookupByLibrary.simpleMessage("Maelezo ya Gumzo"),
        "chatGPT": MessageLookupByLibrary.simpleMessage("Gumzo la GPT"),
        "chatWithBot":
            MessageLookupByLibrary.simpleMessage("Piga gumzo na Bot"),
        "chooseArtist": MessageLookupByLibrary.simpleMessage(
            "Chagua msanii kwa picha yako"),
        "chooseDetail": MessageLookupByLibrary.simpleMessage(
            "Chagua maelezo ya picha yako"),
        "chooseMedium":
            MessageLookupByLibrary.simpleMessage("Chagua kati kwa picha yako"),
        "chooseMood":
            MessageLookupByLibrary.simpleMessage("Chagua hali ya picha yako"),
        "chooseUseCase":
            MessageLookupByLibrary.simpleMessage("Chagua kesi ya matumizi"),
        "choseStyle": MessageLookupByLibrary.simpleMessage(
            "Chagua mtindo kwa picha yako"),
        "clear": MessageLookupByLibrary.simpleMessage("Wazi"),
        "clearConfirm": MessageLookupByLibrary.simpleMessage(
            "Je, una uhakika wa kufuta maudhui?"),
        "clearContent": MessageLookupByLibrary.simpleMessage("Futa maudhui"),
        "clearConversation":
            MessageLookupByLibrary.simpleMessage("Mazungumzo wazi"),
        "confirm": MessageLookupByLibrary.simpleMessage("Thibitisha"),
        "confirmDelete": MessageLookupByLibrary.simpleMessage(
            "Tafadhali thibitisha ikiwa ungependa kuendelea na kufuta kipengee hiki. Huwezi kutendua kitendo hiki."),
        "confirmDeleteItem": MessageLookupByLibrary.simpleMessage(
            "Je, una uhakika ungependa kufuta kipengee hiki?"),
        "confirmRemoveKey": MessageLookupByLibrary.simpleMessage(
            "Je, una uhakika wa kuondoa ufunguo?"),
        "copiedToClipboard": MessageLookupByLibrary.simpleMessage(
            "Imenakili maudhui kwenye ubao wa kunakili"),
        "copy": MessageLookupByLibrary.simpleMessage("Nakala"),
        "createChatFailed":
            MessageLookupByLibrary.simpleMessage("Imeshindwa Kuunda Gumzo"),
        "delete": MessageLookupByLibrary.simpleMessage("Futa"),
        "deleteFailed":
            MessageLookupByLibrary.simpleMessage("Imeshindwa Kufuta"),
        "detail": MessageLookupByLibrary.simpleMessage("Maelezo"),
        "download": MessageLookupByLibrary.simpleMessage("Pakua"),
        "edit": MessageLookupByLibrary.simpleMessage("Hariri"),
        "failedToGenerate":
            MessageLookupByLibrary.simpleMessage("Imeshindwa kuzalisha"),
        "generate": MessageLookupByLibrary.simpleMessage("Tengeneza"),
        "grid": MessageLookupByLibrary.simpleMessage("Gridi"),
        "imageGenerate":
            MessageLookupByLibrary.simpleMessage("Tengeneza picha"),
        "imageSize": MessageLookupByLibrary.simpleMessage("Ukubwa wa picha"),
        "inputKey": MessageLookupByLibrary.simpleMessage("Ufunguo wa Kuingiza"),
        "interest": MessageLookupByLibrary.simpleMessage("hamu"),
        "introAboutKey": MessageLookupByLibrary.simpleMessage(
            "Ufunguo wako wa API umehifadhiwa kwenye kifaa chako cha mkononi na haujatumwa popote pengine. Unaweza kuhifadhi ufunguo wako ili kuutumia baadaye. Unaweza pia kuondoa ufunguo wako ikiwa hutaki kuutumia tena."),
        "invalidKey": MessageLookupByLibrary.simpleMessage("Ufunguo Batili"),
        "jobRole": MessageLookupByLibrary.simpleMessage("Jukumu la Kazi"),
        "jobSkills": MessageLookupByLibrary.simpleMessage("Ujuzi wa Kazi"),
        "layoutStyle":
            MessageLookupByLibrary.simpleMessage("Mtindo wa Mpangilio"),
        "limitImage": m0,
        "limitTheText": m1,
        "listening": MessageLookupByLibrary.simpleMessage("Inasikiliza..."),
        "loadKeyFailed": MessageLookupByLibrary.simpleMessage(
            "Ufunguo wa Kupakia Umeshindwa"),
        "loadKeySuccess":
            MessageLookupByLibrary.simpleMessage("Kupakia Ufunguo Mafanikio"),
        "manage": MessageLookupByLibrary.simpleMessage("Simamia"),
        "medium": MessageLookupByLibrary.simpleMessage("Ya kati"),
        "mood": MessageLookupByLibrary.simpleMessage("Mood"),
        "moreOptions": MessageLookupByLibrary.simpleMessage("Chaguo zaidi"),
        "newChat": MessageLookupByLibrary.simpleMessage("Gumzo Mpya"),
        "noImageGenerate":
            MessageLookupByLibrary.simpleMessage("Hakuna picha inayozalisha"),
        "numberOfImages":
            MessageLookupByLibrary.simpleMessage("Idadi ya picha"),
        "numberOfImagesCondition": MessageLookupByLibrary.simpleMessage(
            "Idadi ya picha za kutengeneza. Lazima iwe kati ya 1 na 10."),
        "options": MessageLookupByLibrary.simpleMessage("chaguzi"),
        "page": MessageLookupByLibrary.simpleMessage("Ukurasa"),
        "pleaseCheckConnection": MessageLookupByLibrary.simpleMessage(
            "Tafadhali angalia muunganisho wako na ujaribu tena!"),
        "pleaseInputFillAllFields":
            MessageLookupByLibrary.simpleMessage("Tafadhali jaza sehemu zote"),
        "pleaseInputKey":
            MessageLookupByLibrary.simpleMessage("Tafadhali ingiza ufunguo"),
        "prompt": MessageLookupByLibrary.simpleMessage("haraka"),
        "putKeyHere":
            MessageLookupByLibrary.simpleMessage("Weka ufunguo wako hapa"),
        "regenerateResponse":
            MessageLookupByLibrary.simpleMessage("Tengeneza jibu upya"),
        "remaining": MessageLookupByLibrary.simpleMessage("iliyobaki"),
        "remove": MessageLookupByLibrary.simpleMessage("Ondoa"),
        "removeKeyFailed":
            MessageLookupByLibrary.simpleMessage("Kuondoa Ufunguo Imeshindwa"),
        "removeKeySuccess": MessageLookupByLibrary.simpleMessage(
            "Ufunguo Umeondolewa Umefaulu"),
        "reset": MessageLookupByLibrary.simpleMessage("Rudisha"),
        "resetSettings":
            MessageLookupByLibrary.simpleMessage("Weka upya Mipangilio"),
        "save": MessageLookupByLibrary.simpleMessage("Okoa"),
        "saveKey": MessageLookupByLibrary.simpleMessage("Hifadhi Ufunguo"),
        "saveKeyFailed": MessageLookupByLibrary.simpleMessage(
            "Imeshindwa Kuhifadhi Ufunguo"),
        "saveKeySuccess": MessageLookupByLibrary.simpleMessage(
            "Ufunguo Umehifadhiwa Umefaulu"),
        "searchByPrompt":
            MessageLookupByLibrary.simpleMessage("Tafuta kwa Prompt..."),
        "sectionKeywords":
            MessageLookupByLibrary.simpleMessage("Maneno muhimu ya Sehemu"),
        "sectionTopic": MessageLookupByLibrary.simpleMessage("Mada ya Sehemu"),
        "selectChatFailed":
            MessageLookupByLibrary.simpleMessage("Chagua Gumzo Imeshindwa"),
        "selectPrompt": MessageLookupByLibrary.simpleMessage("Chagua Prompt"),
        "settings": MessageLookupByLibrary.simpleMessage("Mipangilio"),
        "share": MessageLookupByLibrary.simpleMessage("Shiriki"),
        "skills": MessageLookupByLibrary.simpleMessage("Ujuzi"),
        "somethingWentWrong":
            MessageLookupByLibrary.simpleMessage("Kuna kitu kimeharibika!!!"),
        "somethingWhenWrong": MessageLookupByLibrary.simpleMessage(
            "Hitilafu fulani imetokea! Tafadhali jaribu tena baadae. Asante sana!"),
        "speechNotAvailable":
            MessageLookupByLibrary.simpleMessage("Hotuba haipatikani"),
        "style": MessageLookupByLibrary.simpleMessage("Mtindo"),
        "subscriptionExpiredDate": m2,
        "tapTheMicToTalk": MessageLookupByLibrary.simpleMessage(
            "Gusa maikrofoni ili kuzungumza"),
        "textGenerate":
            MessageLookupByLibrary.simpleMessage("Tengeneza maandishi"),
        "textGenerator":
            MessageLookupByLibrary.simpleMessage("Jenereta ya maandishi"),
        "timeGenerate": m3,
        "typeAMessage":
            MessageLookupByLibrary.simpleMessage("Andika ujumbe..."),
        "view": MessageLookupByLibrary.simpleMessage("Tazama"),
        "viewType": MessageLookupByLibrary.simpleMessage("Aina ya kutazama"),
        "write": MessageLookupByLibrary.simpleMessage("Andika")
      };
}
