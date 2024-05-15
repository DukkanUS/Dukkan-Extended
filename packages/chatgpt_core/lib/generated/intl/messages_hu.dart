// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a hu locale. All the
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
  String get localeName => 'hu';

  static String m0(limit) =>
      "Az ingyenes verzióban csak ${limit}x képkeresés található.";

  static String m1(limit) =>
      "Legfeljebb ${limit} üzenet jeleníthető meg az ingyenes verzióban.";

  static String m2(date) => "Az előfizetés lejárati dátuma: ${date}";

  static String m3(number) =>
      "Létrehoz (${number} ${Intl.plural(number, one: 'time', other: 'times')})";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("Ról ről"),
        "apply": MessageLookupByLibrary.simpleMessage("Alkalmaz"),
        "artist": MessageLookupByLibrary.simpleMessage("művész"),
        "cancel": MessageLookupByLibrary.simpleMessage("Megszünteti"),
        "chat": MessageLookupByLibrary.simpleMessage("Csevegés"),
        "chatDetail":
            MessageLookupByLibrary.simpleMessage("Csevegés részletei"),
        "chatGPT": MessageLookupByLibrary.simpleMessage("Chat GPT"),
        "chatWithBot": MessageLookupByLibrary.simpleMessage("Csevegés Bottal"),
        "chooseArtist":
            MessageLookupByLibrary.simpleMessage("Válasszon előadót a képéhez"),
        "chooseDetail":
            MessageLookupByLibrary.simpleMessage("Válassza ki a kép részletét"),
        "chooseMedium":
            MessageLookupByLibrary.simpleMessage("Válasszon médiát a képhez"),
        "chooseMood": MessageLookupByLibrary.simpleMessage(
            "Válassza ki a kép hangulatát"),
        "chooseUseCase":
            MessageLookupByLibrary.simpleMessage("Válasszon használati esetet"),
        "choseStyle":
            MessageLookupByLibrary.simpleMessage("Válasszon stílust a képhez"),
        "clear": MessageLookupByLibrary.simpleMessage("Egyértelmű"),
        "clearConfirm":
            MessageLookupByLibrary.simpleMessage("Biztosan törli a tartalmat?"),
        "clearContent": MessageLookupByLibrary.simpleMessage("Tiszta tartalom"),
        "clearConversation":
            MessageLookupByLibrary.simpleMessage("Tiszta beszélgetés"),
        "confirm": MessageLookupByLibrary.simpleMessage("megerősít"),
        "confirmDelete": MessageLookupByLibrary.simpleMessage(
            "Kérjük, erősítse meg, ha folytatni kívánja ennek az elemnek a törlését. Ez a művelet nem vonható vissza."),
        "confirmDeleteItem": MessageLookupByLibrary.simpleMessage(
            "Biztosan törli ezt az elemet?"),
        "confirmRemoveKey": MessageLookupByLibrary.simpleMessage(
            "Biztosan eltávolítja a kulcsot?"),
        "copiedToClipboard": MessageLookupByLibrary.simpleMessage(
            "Tartalom a vágólapra másolva"),
        "copy": MessageLookupByLibrary.simpleMessage("másolat"),
        "createChatFailed": MessageLookupByLibrary.simpleMessage(
            "A csevegés létrehozása nem sikerült"),
        "delete": MessageLookupByLibrary.simpleMessage("Töröl"),
        "deleteFailed":
            MessageLookupByLibrary.simpleMessage("A törlés sikertelen"),
        "detail": MessageLookupByLibrary.simpleMessage("Részlet"),
        "download": MessageLookupByLibrary.simpleMessage("Letöltés"),
        "edit": MessageLookupByLibrary.simpleMessage("szerkesztése"),
        "failedToGenerate":
            MessageLookupByLibrary.simpleMessage("Nem sikerült létrehozni"),
        "generate": MessageLookupByLibrary.simpleMessage("generál"),
        "grid": MessageLookupByLibrary.simpleMessage("Rács"),
        "imageGenerate": MessageLookupByLibrary.simpleMessage("Kép generálása"),
        "imageSize": MessageLookupByLibrary.simpleMessage("Képméret"),
        "inputKey": MessageLookupByLibrary.simpleMessage("Beviteli kulcs"),
        "interest": MessageLookupByLibrary.simpleMessage("Érdeklődés"),
        "introAboutKey": MessageLookupByLibrary.simpleMessage(
            "Az API-kulcsot helyben tárolja a mobilja, és soha nem küldi el máshová. A kulcsot elmentheti későbbi használatra. A kulcsot is eltávolíthatja, ha már nem kívánja használni."),
        "invalidKey": MessageLookupByLibrary.simpleMessage("Hibás kulcs"),
        "jobRole": MessageLookupByLibrary.simpleMessage("Munkakör"),
        "jobSkills": MessageLookupByLibrary.simpleMessage("Munkakészségek"),
        "layoutStyle": MessageLookupByLibrary.simpleMessage("kinézet stílus"),
        "limitImage": m0,
        "limitTheText": m1,
        "listening": MessageLookupByLibrary.simpleMessage("Hallgat..."),
        "loadKeyFailed": MessageLookupByLibrary.simpleMessage(
            "A kulcs betöltése sikertelen"),
        "loadKeySuccess":
            MessageLookupByLibrary.simpleMessage("A kulcs betöltése sikeres"),
        "manage": MessageLookupByLibrary.simpleMessage("kezel"),
        "medium": MessageLookupByLibrary.simpleMessage("Közepes"),
        "mood": MessageLookupByLibrary.simpleMessage("Hangulat"),
        "moreOptions": MessageLookupByLibrary.simpleMessage("Több lehetőség"),
        "newChat": MessageLookupByLibrary.simpleMessage("Új chat"),
        "noImageGenerate":
            MessageLookupByLibrary.simpleMessage("Nincs kép generálása"),
        "numberOfImages": MessageLookupByLibrary.simpleMessage("Képek száma"),
        "numberOfImagesCondition": MessageLookupByLibrary.simpleMessage(
            "A generálandó képek száma. 1 és 10 között kell lennie."),
        "options": MessageLookupByLibrary.simpleMessage("Opciók"),
        "page": MessageLookupByLibrary.simpleMessage("Oldal"),
        "pleaseCheckConnection": MessageLookupByLibrary.simpleMessage(
            "Kérjük, ellenőrizze a kapcsolatot, és próbálja újra!"),
        "pleaseInputFillAllFields": MessageLookupByLibrary.simpleMessage(
            "Kérem, töltsön ki minden mezőt"),
        "pleaseInputKey":
            MessageLookupByLibrary.simpleMessage("Kérjük, adja meg a kulcsot"),
        "prompt": MessageLookupByLibrary.simpleMessage("Gyors"),
        "putKeyHere":
            MessageLookupByLibrary.simpleMessage("Tedd ide a kulcsodat"),
        "regenerateResponse":
            MessageLookupByLibrary.simpleMessage("Válasz újragenerálása"),
        "remaining": MessageLookupByLibrary.simpleMessage("Többi"),
        "remove": MessageLookupByLibrary.simpleMessage("eltávolít"),
        "removeKeyFailed": MessageLookupByLibrary.simpleMessage(
            "A kulcs eltávolítása nem sikerült"),
        "removeKeySuccess": MessageLookupByLibrary.simpleMessage(
            "A kulcs sikeresen eltávolítva"),
        "reset": MessageLookupByLibrary.simpleMessage("Visszaállítás"),
        "resetSettings": MessageLookupByLibrary.simpleMessage(
            "Beállítások alaphelyzetbe állítása"),
        "save": MessageLookupByLibrary.simpleMessage("Mentés"),
        "saveKey": MessageLookupByLibrary.simpleMessage("Kulcs mentése"),
        "saveKeyFailed": MessageLookupByLibrary.simpleMessage(
            "A kulcs mentése nem sikerült"),
        "saveKeySuccess":
            MessageLookupByLibrary.simpleMessage("Kulcs sikeresen elmentve"),
        "searchByPrompt": MessageLookupByLibrary.simpleMessage(
            "Keresés felszólítás alapján..."),
        "sectionKeywords":
            MessageLookupByLibrary.simpleMessage("Szakasz Kulcsszavak"),
        "sectionTopic": MessageLookupByLibrary.simpleMessage("Szakasz téma"),
        "selectChatFailed": MessageLookupByLibrary.simpleMessage(
            "Válassza a Csevegés sikertelen lehetőséget"),
        "selectPrompt": MessageLookupByLibrary.simpleMessage(
            "Válassza a Prompt lehetőséget"),
        "settings": MessageLookupByLibrary.simpleMessage("BEÁLLÍTÁSOK"),
        "share": MessageLookupByLibrary.simpleMessage("Részvény"),
        "skills": MessageLookupByLibrary.simpleMessage("szakértelem"),
        "somethingWentWrong":
            MessageLookupByLibrary.simpleMessage("Valami elromlott!!!"),
        "somethingWhenWrong": MessageLookupByLibrary.simpleMessage(
            "Valami elromlott! Kérlek, próbáld újra később. Nagyon szépen köszönöm!"),
        "speechNotAvailable":
            MessageLookupByLibrary.simpleMessage("A beszéd nem elérhető"),
        "style": MessageLookupByLibrary.simpleMessage("Stílus"),
        "subscriptionExpiredDate": m2,
        "tapTheMicToTalk": MessageLookupByLibrary.simpleMessage(
            "Koppintson a mikrofonra a beszélgetéshez"),
        "textGenerate":
            MessageLookupByLibrary.simpleMessage("Szöveg generálása"),
        "textGenerator":
            MessageLookupByLibrary.simpleMessage("Szöveggenerátor"),
        "timeGenerate": m3,
        "typeAMessage":
            MessageLookupByLibrary.simpleMessage("Írjon be egy üzenetet..."),
        "view": MessageLookupByLibrary.simpleMessage("Kilátás"),
        "viewType": MessageLookupByLibrary.simpleMessage("Nézet típusa"),
        "write": MessageLookupByLibrary.simpleMessage("Ír")
      };
}
