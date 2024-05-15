// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a sr locale. All the
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
  String get localeName => 'sr';

  static String m0(limit) =>
      "У бесплатној верзији постоји само ${limit}к претрага слика.";

  static String m1(limit) =>
      "До ${limit} порука може да се прикаже само у бесплатној верзији.";

  static String m2(date) => "Датум истека претплате ${date}";

  static String m3(number) =>
      "Генериши (${number} ${Intl.plural(number, one: 'time', other: 'times')})";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("O"),
        "apply": MessageLookupByLibrary.simpleMessage("Prijavite se"),
        "artist": MessageLookupByLibrary.simpleMessage("Уметник"),
        "cancel": MessageLookupByLibrary.simpleMessage("Otkaži"),
        "chat": MessageLookupByLibrary.simpleMessage("Chat"),
        "chatDetail": MessageLookupByLibrary.simpleMessage("Цхат Детаил"),
        "chatGPT": MessageLookupByLibrary.simpleMessage("Цхат ГПТ"),
        "chatWithBot": MessageLookupByLibrary.simpleMessage("Ћаскање са Ботом"),
        "chooseArtist": MessageLookupByLibrary.simpleMessage(
            "Изаберите уметника за своју слику"),
        "chooseDetail": MessageLookupByLibrary.simpleMessage(
            "Одаберите детаље за своју слику"),
        "chooseMedium": MessageLookupByLibrary.simpleMessage(
            "Изаберите медиј за своју слику"),
        "chooseMood": MessageLookupByLibrary.simpleMessage(
            "Изаберите расположење за своју слику"),
        "chooseUseCase":
            MessageLookupByLibrary.simpleMessage("Изаберите случај употребе"),
        "choseStyle": MessageLookupByLibrary.simpleMessage(
            "Изаберите стил за своју слику"),
        "clear": MessageLookupByLibrary.simpleMessage("jasno"),
        "clearConfirm": MessageLookupByLibrary.simpleMessage(
            "Да ли сте сигурни да обришете садржај?"),
        "clearContent": MessageLookupByLibrary.simpleMessage("Јасан садржај"),
        "clearConversation":
            MessageLookupByLibrary.simpleMessage("Очисти разговор"),
        "confirm": MessageLookupByLibrary.simpleMessage("Potvrdite"),
        "confirmDelete": MessageLookupByLibrary.simpleMessage(
            "Потврдите да ли желите да наставите са брисањем ове ставке. Не можете поништити ову радњу."),
        "confirmDeleteItem": MessageLookupByLibrary.simpleMessage(
            "Jeste li sigurni da želite izbrisati ovu stavku?"),
        "confirmRemoveKey": MessageLookupByLibrary.simpleMessage(
            "Да ли сте сигурни да ћете уклонити кључ?"),
        "copiedToClipboard": MessageLookupByLibrary.simpleMessage(
            "Садржај је копиран у међуспремник"),
        "copy": MessageLookupByLibrary.simpleMessage("kopiraj"),
        "createChatFailed": MessageLookupByLibrary.simpleMessage(
            "Креирање ћаскања није успело"),
        "delete": MessageLookupByLibrary.simpleMessage("Izbriši"),
        "deleteFailed":
            MessageLookupByLibrary.simpleMessage("brisanje nije uspjelo"),
        "detail": MessageLookupByLibrary.simpleMessage("Detalj"),
        "download": MessageLookupByLibrary.simpleMessage("Skinuti"),
        "edit": MessageLookupByLibrary.simpleMessage("Uredi"),
        "failedToGenerate":
            MessageLookupByLibrary.simpleMessage("Генерисање није успело"),
        "generate": MessageLookupByLibrary.simpleMessage("Generiraj"),
        "grid": MessageLookupByLibrary.simpleMessage("Грид"),
        "imageGenerate":
            MessageLookupByLibrary.simpleMessage("Генерисање слике"),
        "imageSize": MessageLookupByLibrary.simpleMessage("Величина слике"),
        "inputKey": MessageLookupByLibrary.simpleMessage("Тастер за унос"),
        "interest": MessageLookupByLibrary.simpleMessage("Interes"),
        "introAboutKey": MessageLookupByLibrary.simpleMessage(
            "Ваш АПИ кључ се чува локално на вашем мобилном телефону и никада се не шаље нигде другде. Можете да сачувате свој кључ да бисте га касније користили. Такође можете уклонити свој кључ ако више не желите да га користите."),
        "invalidKey": MessageLookupByLibrary.simpleMessage("Неважећа шифра"),
        "jobRole": MessageLookupByLibrary.simpleMessage("Пословна улога"),
        "jobSkills": MessageLookupByLibrary.simpleMessage("Вештине посла"),
        "layoutStyle": MessageLookupByLibrary.simpleMessage("Лаиоут Стиле"),
        "limitImage": m0,
        "limitTheText": m1,
        "listening": MessageLookupByLibrary.simpleMessage("слушам..."),
        "loadKeyFailed":
            MessageLookupByLibrary.simpleMessage("Учитавање кључа није успело"),
        "loadKeySuccess":
            MessageLookupByLibrary.simpleMessage("Учитавање кључа успешно"),
        "manage": MessageLookupByLibrary.simpleMessage("Upravljajte"),
        "medium": MessageLookupByLibrary.simpleMessage("Srednje"),
        "mood": MessageLookupByLibrary.simpleMessage("Моод"),
        "moreOptions": MessageLookupByLibrary.simpleMessage("Više opcija"),
        "newChat": MessageLookupByLibrary.simpleMessage("Ново ћаскање"),
        "noImageGenerate":
            MessageLookupByLibrary.simpleMessage("Нема генерисања слике"),
        "numberOfImages": MessageLookupByLibrary.simpleMessage("Број слика"),
        "numberOfImagesCondition": MessageLookupByLibrary.simpleMessage(
            "Број слика за генерисање. Мора бити између 1 и 10."),
        "options": MessageLookupByLibrary.simpleMessage("Opcije"),
        "page": MessageLookupByLibrary.simpleMessage("Page"),
        "pleaseCheckConnection": MessageLookupByLibrary.simpleMessage(
            "Проверите своју везу и покушајте поново!"),
        "pleaseInputFillAllFields": MessageLookupByLibrary.simpleMessage(
            "Молимо Вас да попуните сва поља"),
        "pleaseInputKey": MessageLookupByLibrary.simpleMessage("Унесите кључ"),
        "prompt": MessageLookupByLibrary.simpleMessage("Промпт"),
        "putKeyHere":
            MessageLookupByLibrary.simpleMessage("Стави свој кључ овде"),
        "regenerateResponse":
            MessageLookupByLibrary.simpleMessage("Регенерација одговора"),
        "remaining": MessageLookupByLibrary.simpleMessage("преосталих"),
        "remove": MessageLookupByLibrary.simpleMessage("Ukloni"),
        "removeKeyFailed":
            MessageLookupByLibrary.simpleMessage("Уклањање кључа није успело"),
        "removeKeySuccess":
            MessageLookupByLibrary.simpleMessage("Кључ је успешно уклоњен"),
        "reset": MessageLookupByLibrary.simpleMessage("Resetovati"),
        "resetSettings":
            MessageLookupByLibrary.simpleMessage("Ресетујте подешавања"),
        "save": MessageLookupByLibrary.simpleMessage("Spremi"),
        "saveKey": MessageLookupByLibrary.simpleMessage("Сачувај кључ"),
        "saveKeyFailed":
            MessageLookupByLibrary.simpleMessage("Чување кључа није успело"),
        "saveKeySuccess":
            MessageLookupByLibrary.simpleMessage("Кључ је успешно сачуван"),
        "searchByPrompt":
            MessageLookupByLibrary.simpleMessage("Претрага по упиту..."),
        "sectionKeywords":
            MessageLookupByLibrary.simpleMessage("Кључне речи одељка"),
        "sectionTopic": MessageLookupByLibrary.simpleMessage("Тема одељка"),
        "selectChatFailed": MessageLookupByLibrary.simpleMessage(
            "Изаберите Ћаскање није успело"),
        "selectPrompt":
            MessageLookupByLibrary.simpleMessage("Изаберите Промпт"),
        "settings": MessageLookupByLibrary.simpleMessage("Podešavanja"),
        "share": MessageLookupByLibrary.simpleMessage("Podijeli"),
        "skills": MessageLookupByLibrary.simpleMessage("Вештине"),
        "somethingWentWrong":
            MessageLookupByLibrary.simpleMessage("Нешто није у реду!!!"),
        "somethingWhenWrong": MessageLookupByLibrary.simpleMessage(
            "Нешто није у реду! Покушајте поново касније. Хвала Вам много!"),
        "speechNotAvailable":
            MessageLookupByLibrary.simpleMessage("Говор није доступан"),
        "style": MessageLookupByLibrary.simpleMessage("Стиле"),
        "subscriptionExpiredDate": m2,
        "tapTheMicToTalk": MessageLookupByLibrary.simpleMessage(
            "Додирните микрофон да бисте разговарали"),
        "textGenerate":
            MessageLookupByLibrary.simpleMessage("Генерисање текста"),
        "textGenerator": MessageLookupByLibrary.simpleMessage("Тект Генератор"),
        "timeGenerate": m3,
        "typeAMessage":
            MessageLookupByLibrary.simpleMessage("Унесите поруку..."),
        "view": MessageLookupByLibrary.simpleMessage("Pogled"),
        "viewType": MessageLookupByLibrary.simpleMessage("Тип приказа"),
        "write": MessageLookupByLibrary.simpleMessage("Пишите")
      };
}
