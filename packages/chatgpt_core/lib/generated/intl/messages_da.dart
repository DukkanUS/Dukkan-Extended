// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a da locale. All the
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
  String get localeName => 'da';

  static String m0(limit) =>
      "Der er kun ${limit}x billedsøgning i den gratis version.";

  static String m1(limit) =>
      "Op til ${limit} beskeder kan kun vises i den gratis version.";

  static String m2(date) => "Abonnementets udløbsdato ${date}";

  static String m3(number) =>
      "Generer (${number} ${Intl.plural(number, one: 'time', other: 'times')})";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("Om"),
        "apply": MessageLookupByLibrary.simpleMessage("ansøge"),
        "artist": MessageLookupByLibrary.simpleMessage("Kunstner"),
        "cancel": MessageLookupByLibrary.simpleMessage("afbestille"),
        "chat": MessageLookupByLibrary.simpleMessage("Snak"),
        "chatDetail": MessageLookupByLibrary.simpleMessage("Chat detaljer"),
        "chatGPT": MessageLookupByLibrary.simpleMessage("Chat GPT"),
        "chatWithBot": MessageLookupByLibrary.simpleMessage("Chat med Bot"),
        "chooseArtist": MessageLookupByLibrary.simpleMessage(
            "Vælg kunstner til dit billede"),
        "chooseDetail": MessageLookupByLibrary.simpleMessage(
            "Vælg detalje til dit billede"),
        "chooseMedium":
            MessageLookupByLibrary.simpleMessage("Vælg medium til dit billede"),
        "chooseMood": MessageLookupByLibrary.simpleMessage(
            "Vælg stemning til dit billede"),
        "chooseUseCase": MessageLookupByLibrary.simpleMessage("Vælg use case"),
        "choseStyle":
            MessageLookupByLibrary.simpleMessage("Vælg stil til dit billede"),
        "clear": MessageLookupByLibrary.simpleMessage("Klar"),
        "clearConfirm": MessageLookupByLibrary.simpleMessage(
            "Er du sikker på at rydde indhold?"),
        "clearContent": MessageLookupByLibrary.simpleMessage("Ryd indhold"),
        "clearConversation":
            MessageLookupByLibrary.simpleMessage("Klar samtale"),
        "confirm": MessageLookupByLibrary.simpleMessage("bekræfte"),
        "confirmDelete": MessageLookupByLibrary.simpleMessage(
            "Bekræft venligst, om du ønsker at fortsætte med sletningen af dette element. Du kan ikke fortryde denne handling."),
        "confirmDeleteItem": MessageLookupByLibrary.simpleMessage(
            "Er du sikker på, at du vil slette dette element?"),
        "confirmRemoveKey": MessageLookupByLibrary.simpleMessage(
            "Er du sikker på at du vil fjerne nøglen?"),
        "copiedToClipboard": MessageLookupByLibrary.simpleMessage(
            "Kopieret indhold til udklipsholder"),
        "copy": MessageLookupByLibrary.simpleMessage("Kopi"),
        "createChatFailed":
            MessageLookupByLibrary.simpleMessage("Opret chat mislykkedes"),
        "delete": MessageLookupByLibrary.simpleMessage("Slet"),
        "deleteFailed":
            MessageLookupByLibrary.simpleMessage("Slet mislykkedes"),
        "detail": MessageLookupByLibrary.simpleMessage("Detalje"),
        "download": MessageLookupByLibrary.simpleMessage("Hent"),
        "edit": MessageLookupByLibrary.simpleMessage("Redigere"),
        "failedToGenerate":
            MessageLookupByLibrary.simpleMessage("Kunne ikke generere"),
        "generate": MessageLookupByLibrary.simpleMessage("Frembringe"),
        "grid": MessageLookupByLibrary.simpleMessage("Grid"),
        "imageGenerate":
            MessageLookupByLibrary.simpleMessage("Generer billede"),
        "imageSize": MessageLookupByLibrary.simpleMessage("Billedestørrelse"),
        "inputKey": MessageLookupByLibrary.simpleMessage("Indtastningstast"),
        "interest": MessageLookupByLibrary.simpleMessage("Interesse"),
        "introAboutKey": MessageLookupByLibrary.simpleMessage(
            "Din API-nøgle gemmes lokalt på din mobil og sendes aldrig andre steder. Du kan gemme din nøgle for at bruge den senere. Du kan også fjerne din nøgle, hvis du ikke ønsker at bruge den mere."),
        "invalidKey": MessageLookupByLibrary.simpleMessage("Ugyldig nøgle"),
        "jobRole": MessageLookupByLibrary.simpleMessage("Jobrolle"),
        "jobSkills": MessageLookupByLibrary.simpleMessage("Arbejdsevner"),
        "layoutStyle": MessageLookupByLibrary.simpleMessage("layout stil"),
        "limitImage": m0,
        "limitTheText": m1,
        "listening": MessageLookupByLibrary.simpleMessage("Hører efter..."),
        "loadKeyFailed": MessageLookupByLibrary.simpleMessage(
            "Indlæsningsnøglen mislykkedes"),
        "loadKeySuccess":
            MessageLookupByLibrary.simpleMessage("Indlæs nøgle succes"),
        "manage": MessageLookupByLibrary.simpleMessage("Styre"),
        "medium": MessageLookupByLibrary.simpleMessage("Medium"),
        "mood": MessageLookupByLibrary.simpleMessage("Humør"),
        "moreOptions": MessageLookupByLibrary.simpleMessage("Flere muligheder"),
        "newChat": MessageLookupByLibrary.simpleMessage("Ny chat"),
        "noImageGenerate":
            MessageLookupByLibrary.simpleMessage("Intet billede genereres"),
        "numberOfImages":
            MessageLookupByLibrary.simpleMessage("Antal billeder"),
        "numberOfImagesCondition": MessageLookupByLibrary.simpleMessage(
            "Antallet af billeder, der skal genereres. Skal være mellem 1 og 10."),
        "options": MessageLookupByLibrary.simpleMessage("Muligheder"),
        "page": MessageLookupByLibrary.simpleMessage("Side"),
        "pleaseCheckConnection": MessageLookupByLibrary.simpleMessage(
            "Tjek venligst din forbindelse og prøv igen!"),
        "pleaseInputFillAllFields":
            MessageLookupByLibrary.simpleMessage("Udfyld venligst alle felter"),
        "pleaseInputKey":
            MessageLookupByLibrary.simpleMessage("Indtast venligst nøgle"),
        "prompt": MessageLookupByLibrary.simpleMessage("Hurtig"),
        "putKeyHere": MessageLookupByLibrary.simpleMessage("Læg din nøgle her"),
        "regenerateResponse":
            MessageLookupByLibrary.simpleMessage("Gendan respons"),
        "remaining": MessageLookupByLibrary.simpleMessage("Resterende"),
        "remove": MessageLookupByLibrary.simpleMessage("Fjerne"),
        "removeKeyFailed":
            MessageLookupByLibrary.simpleMessage("Fjern nøgle mislykkedes"),
        "removeKeySuccess":
            MessageLookupByLibrary.simpleMessage("Fjernet nøgle med succes"),
        "reset": MessageLookupByLibrary.simpleMessage("Nulstil"),
        "resetSettings":
            MessageLookupByLibrary.simpleMessage("Nulstil indstillingerne"),
        "save": MessageLookupByLibrary.simpleMessage("Gemme"),
        "saveKey": MessageLookupByLibrary.simpleMessage("Gem nøgle"),
        "saveKeyFailed":
            MessageLookupByLibrary.simpleMessage("Gem nøgle mislykkedes"),
        "saveKeySuccess":
            MessageLookupByLibrary.simpleMessage("Nøglen er gemt"),
        "searchByPrompt":
            MessageLookupByLibrary.simpleMessage("Søg efter prompt..."),
        "sectionKeywords":
            MessageLookupByLibrary.simpleMessage("Sektion Nøgleord"),
        "sectionTopic": MessageLookupByLibrary.simpleMessage("Afsnit Emne"),
        "selectChatFailed":
            MessageLookupByLibrary.simpleMessage("Vælg Chat mislykkedes"),
        "selectPrompt": MessageLookupByLibrary.simpleMessage("Vælg Spørg"),
        "settings": MessageLookupByLibrary.simpleMessage("INDSTILLINGER"),
        "share": MessageLookupByLibrary.simpleMessage("Del"),
        "skills": MessageLookupByLibrary.simpleMessage("Skills"),
        "somethingWentWrong":
            MessageLookupByLibrary.simpleMessage("Noget gik galt!!!"),
        "somethingWhenWrong": MessageLookupByLibrary.simpleMessage(
            "Noget gik galt! Prøv igen senere. Mange tak!"),
        "speechNotAvailable":
            MessageLookupByLibrary.simpleMessage("Tale ikke tilgængelig"),
        "style": MessageLookupByLibrary.simpleMessage("Stil"),
        "subscriptionExpiredDate": m2,
        "tapTheMicToTalk": MessageLookupByLibrary.simpleMessage(
            "Tryk på mikrofonen for at tale"),
        "textGenerate": MessageLookupByLibrary.simpleMessage("Generer tekst"),
        "textGenerator": MessageLookupByLibrary.simpleMessage("Tekstgenerator"),
        "timeGenerate": m3,
        "typeAMessage":
            MessageLookupByLibrary.simpleMessage("Skriv en meddelelse ..."),
        "view": MessageLookupByLibrary.simpleMessage("Udsigt"),
        "viewType": MessageLookupByLibrary.simpleMessage("Visningstype"),
        "write": MessageLookupByLibrary.simpleMessage("Skrive")
      };
}
