// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a lt locale. All the
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
  String get localeName => 'lt';

  static String m0(limit) =>
      "Nemokamoje versijoje yra tik ${limit}x vaizdų paieška.";

  static String m1(limit) =>
      "Tik nemokama versija gali būti rodoma iki ${limit} pranešimų.";

  static String m2(date) => "Prenumeratos galiojimo pabaigos data ${date}";

  static String m3(number) =>
      "Generuoti (${number} ${Intl.plural(number, one: 'time', other: 'times')})";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("Apie"),
        "apply": MessageLookupByLibrary.simpleMessage("Taikyti"),
        "artist": MessageLookupByLibrary.simpleMessage("Menininkas"),
        "cancel": MessageLookupByLibrary.simpleMessage("Atšaukti"),
        "chat": MessageLookupByLibrary.simpleMessage("Pokalbis"),
        "chatDetail": MessageLookupByLibrary.simpleMessage("Pokalbio detalė"),
        "chatGPT": MessageLookupByLibrary.simpleMessage("Pokalbis GPT"),
        "chatWithBot":
            MessageLookupByLibrary.simpleMessage("Kalbėkitės su Botu"),
        "chooseArtist": MessageLookupByLibrary.simpleMessage(
            "Pasirinkite savo įvaizdžio menininką"),
        "chooseDetail": MessageLookupByLibrary.simpleMessage(
            "Pasirinkite savo vaizdo detales"),
        "chooseMedium": MessageLookupByLibrary.simpleMessage(
            "Pasirinkite savo vaizdo terpę"),
        "chooseMood": MessageLookupByLibrary.simpleMessage(
            "Pasirinkite savo įvaizdžio nuotaiką"),
        "chooseUseCase": MessageLookupByLibrary.simpleMessage(
            "Pasirinkite naudojimo atvejį"),
        "choseStyle": MessageLookupByLibrary.simpleMessage(
            "Pasirinkite savo įvaizdžio stilių"),
        "clear": MessageLookupByLibrary.simpleMessage("Išvalyti"),
        "clearConfirm": MessageLookupByLibrary.simpleMessage(
            "Ar tikrai išvalysite turinį?"),
        "clearContent": MessageLookupByLibrary.simpleMessage("Aiškus turinys"),
        "clearConversation":
            MessageLookupByLibrary.simpleMessage("Aiškus pokalbis"),
        "confirm": MessageLookupByLibrary.simpleMessage("Patvirtinti"),
        "confirmDelete": MessageLookupByLibrary.simpleMessage(
            "Patvirtinkite, jei norite tęsti šio elemento ištrynimą. Šio veiksmo anuliuoti negalite."),
        "confirmDeleteItem": MessageLookupByLibrary.simpleMessage(
            "Ar tikrai norite ištrinti šį elementą?"),
        "confirmRemoveKey": MessageLookupByLibrary.simpleMessage(
            "Ar tikrai pašalinsite raktą?"),
        "copiedToClipboard": MessageLookupByLibrary.simpleMessage(
            "Turinys nukopijuotas į mainų sritį"),
        "copy": MessageLookupByLibrary.simpleMessage("Kopijuoti"),
        "createChatFailed":
            MessageLookupByLibrary.simpleMessage("Nepavyko sukurti pokalbio"),
        "delete": MessageLookupByLibrary.simpleMessage("Ištrinti"),
        "deleteFailed":
            MessageLookupByLibrary.simpleMessage("Ištrinti nepavyko"),
        "detail": MessageLookupByLibrary.simpleMessage("Išsami informacija"),
        "download": MessageLookupByLibrary.simpleMessage("parsisiųsti"),
        "edit": MessageLookupByLibrary.simpleMessage("Redaguoti"),
        "failedToGenerate":
            MessageLookupByLibrary.simpleMessage("Nepavyko sugeneruoti"),
        "generate": MessageLookupByLibrary.simpleMessage("Generuoti"),
        "grid": MessageLookupByLibrary.simpleMessage("Tinklelis"),
        "imageGenerate":
            MessageLookupByLibrary.simpleMessage("Vaizdo generavimas"),
        "imageSize": MessageLookupByLibrary.simpleMessage("Paveikslėlio dydis"),
        "inputKey": MessageLookupByLibrary.simpleMessage("Įvesties raktas"),
        "interest": MessageLookupByLibrary.simpleMessage("Palūkanos"),
        "introAboutKey": MessageLookupByLibrary.simpleMessage(
            "Jūsų API raktas yra saugomas jūsų mobiliajame telefone ir niekada niekur nesiunčiamas. Galite išsaugoti raktą, kad galėtumėte jį naudoti vėliau. Taip pat galite išimti raktą, jei nebenorite jo naudoti."),
        "invalidKey":
            MessageLookupByLibrary.simpleMessage("Neteisingas raktas"),
        "jobRole": MessageLookupByLibrary.simpleMessage("Darbo vaidmuo"),
        "jobSkills": MessageLookupByLibrary.simpleMessage("Darbo įgūdžiai"),
        "layoutStyle":
            MessageLookupByLibrary.simpleMessage("Išdėstymo stilius"),
        "limitImage": m0,
        "limitTheText": m1,
        "listening": MessageLookupByLibrary.simpleMessage("Klausau..."),
        "loadKeyFailed":
            MessageLookupByLibrary.simpleMessage("Nepavyko įkelti rakto"),
        "loadKeySuccess":
            MessageLookupByLibrary.simpleMessage("Įkelti raktą sėkminga"),
        "manage": MessageLookupByLibrary.simpleMessage("Tvarkykite"),
        "medium": MessageLookupByLibrary.simpleMessage("Vidutinis"),
        "mood": MessageLookupByLibrary.simpleMessage("Nuotaika"),
        "moreOptions":
            MessageLookupByLibrary.simpleMessage("Daugiau pasirinkimų"),
        "newChat": MessageLookupByLibrary.simpleMessage("Naujas pokalbis"),
        "noImageGenerate":
            MessageLookupByLibrary.simpleMessage("Vaizdas negeneruojamas"),
        "numberOfImages":
            MessageLookupByLibrary.simpleMessage("Vaizdų skaičius"),
        "numberOfImagesCondition": MessageLookupByLibrary.simpleMessage(
            "Sugeneruojamų vaizdų skaičius. Turi būti nuo 1 iki 10."),
        "options": MessageLookupByLibrary.simpleMessage("Galimybės"),
        "page": MessageLookupByLibrary.simpleMessage("Puslapis"),
        "pleaseCheckConnection": MessageLookupByLibrary.simpleMessage(
            "Patikrinkite ryšį ir bandykite dar kartą!"),
        "pleaseInputFillAllFields": MessageLookupByLibrary.simpleMessage(
            "Prašome užpildyti visus laukus"),
        "pleaseInputKey":
            MessageLookupByLibrary.simpleMessage("Prašome įvesti raktą"),
        "prompt": MessageLookupByLibrary.simpleMessage("Raginama"),
        "putKeyHere":
            MessageLookupByLibrary.simpleMessage("Įdėkite savo raktą čia"),
        "regenerateResponse":
            MessageLookupByLibrary.simpleMessage("Regeneruoti atsaką"),
        "remaining": MessageLookupByLibrary.simpleMessage("Lieka"),
        "remove": MessageLookupByLibrary.simpleMessage("Pašalinti"),
        "removeKeyFailed":
            MessageLookupByLibrary.simpleMessage("Nepavyko pašalinti rakto"),
        "removeKeySuccess":
            MessageLookupByLibrary.simpleMessage("Raktas sėkmingai pašalintas"),
        "reset": MessageLookupByLibrary.simpleMessage("Atstatyti"),
        "resetSettings":
            MessageLookupByLibrary.simpleMessage("Atstatyti nustatymus"),
        "save": MessageLookupByLibrary.simpleMessage("Sutaupyti"),
        "saveKey": MessageLookupByLibrary.simpleMessage("Išsaugoti raktą"),
        "saveKeyFailed":
            MessageLookupByLibrary.simpleMessage("Nepavyko išsaugoti rakto"),
        "saveKeySuccess":
            MessageLookupByLibrary.simpleMessage("Raktas sėkmingai išsaugotas"),
        "searchByPrompt":
            MessageLookupByLibrary.simpleMessage("Ieškoti pagal raginimą..."),
        "sectionKeywords":
            MessageLookupByLibrary.simpleMessage("Skyrius Raktiniai žodžiai"),
        "sectionTopic": MessageLookupByLibrary.simpleMessage("Skyriaus tema"),
        "selectChatFailed": MessageLookupByLibrary.simpleMessage(
            "Pasirinkite Pokalbis nepavyko"),
        "selectPrompt":
            MessageLookupByLibrary.simpleMessage("Pasirinkite Raginimas"),
        "settings": MessageLookupByLibrary.simpleMessage("Nustatymai"),
        "share": MessageLookupByLibrary.simpleMessage("Dalintis"),
        "skills": MessageLookupByLibrary.simpleMessage("Įgūdžiai"),
        "somethingWentWrong":
            MessageLookupByLibrary.simpleMessage("Kažkas ne taip!!!"),
        "somethingWhenWrong": MessageLookupByLibrary.simpleMessage(
            "Kažkas ne taip! Pabandykite dar kartą vėliau. Labai ačiū!"),
        "speechNotAvailable":
            MessageLookupByLibrary.simpleMessage("Kalba nepasiekiama"),
        "style": MessageLookupByLibrary.simpleMessage("Stilius"),
        "subscriptionExpiredDate": m2,
        "tapTheMicToTalk": MessageLookupByLibrary.simpleMessage(
            "Norėdami kalbėti, bakstelėkite mikrofoną"),
        "textGenerate":
            MessageLookupByLibrary.simpleMessage("Teksto generavimas"),
        "textGenerator":
            MessageLookupByLibrary.simpleMessage("Teksto generatorius"),
        "timeGenerate": m3,
        "typeAMessage":
            MessageLookupByLibrary.simpleMessage("Įveskite pranešimą ..."),
        "view": MessageLookupByLibrary.simpleMessage("Vaizdas"),
        "viewType": MessageLookupByLibrary.simpleMessage("Rodinio tipas"),
        "write": MessageLookupByLibrary.simpleMessage("Rašyti")
      };
}
