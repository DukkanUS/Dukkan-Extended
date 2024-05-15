// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a de locale. All the
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
  String get localeName => 'de';

  static String m0(limit) =>
      "In der kostenlosen Version gibt es nur ${limit}x Bildsuche.";

  static String m1(limit) =>
      "Bis zu ${limit} Nachrichten können nur in der kostenlosen Version angezeigt werden.";

  static String m2(date) => "Abonnement abgelaufen am ${date}";

  static String m3(number) =>
      "Generieren (${number} ${Intl.plural(number, one: 'time', other: 'times')})";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("Über"),
        "apply": MessageLookupByLibrary.simpleMessage("Sich bewerben"),
        "artist": MessageLookupByLibrary.simpleMessage("Künstler"),
        "cancel": MessageLookupByLibrary.simpleMessage("Stornieren"),
        "chat": MessageLookupByLibrary.simpleMessage("Plaudern"),
        "chatDetail": MessageLookupByLibrary.simpleMessage("Chat-Details"),
        "chatGPT": MessageLookupByLibrary.simpleMessage("GPT-Chat"),
        "chatWithBot":
            MessageLookupByLibrary.simpleMessage("Chatten Sie mit Bot"),
        "chooseArtist": MessageLookupByLibrary.simpleMessage(
            "Wählen Sie einen Künstler für Ihr Bild"),
        "chooseDetail": MessageLookupByLibrary.simpleMessage(
            "Wählen Sie Details für Ihr Bild"),
        "chooseMedium": MessageLookupByLibrary.simpleMessage(
            "Wählen Sie Medium für Ihr Bild"),
        "chooseMood": MessageLookupByLibrary.simpleMessage(
            "Wählen Sie die Stimmung für Ihr Bild"),
        "chooseUseCase":
            MessageLookupByLibrary.simpleMessage("Anwendungsfall wählen"),
        "choseStyle": MessageLookupByLibrary.simpleMessage(
            "Wählen Sie den Stil für Ihr Bild"),
        "clear": MessageLookupByLibrary.simpleMessage("klar"),
        "clearConfirm": MessageLookupByLibrary.simpleMessage(
            "Möchten Sie den Inhalt wirklich löschen?"),
        "clearContent": MessageLookupByLibrary.simpleMessage("Klarer Inhalt"),
        "clearConversation":
            MessageLookupByLibrary.simpleMessage("Klare Unterhaltung"),
        "confirm": MessageLookupByLibrary.simpleMessage("Bestätigen"),
        "confirmDelete": MessageLookupByLibrary.simpleMessage(
            "Bitte bestätigen Sie, wenn Sie mit dem Löschen dieses Elements fortfahren möchten. Sie können diese Aktion nicht rückgängig machen."),
        "confirmDeleteItem": MessageLookupByLibrary.simpleMessage(
            "Möchten Sie diesen Artikel wirklich löschen?"),
        "confirmRemoveKey": MessageLookupByLibrary.simpleMessage(
            "Möchten Sie den Schlüssel wirklich abziehen?"),
        "copiedToClipboard": MessageLookupByLibrary.simpleMessage(
            "Inhalt in die Zwischenablage kopiert"),
        "copy": MessageLookupByLibrary.simpleMessage("Kopieren"),
        "createChatFailed": MessageLookupByLibrary.simpleMessage(
            "Chat erstellen fehlgeschlagen"),
        "delete": MessageLookupByLibrary.simpleMessage("Löschen"),
        "deleteFailed":
            MessageLookupByLibrary.simpleMessage("Löschen fehlgeschlagen"),
        "detail": MessageLookupByLibrary.simpleMessage("Detail"),
        "download": MessageLookupByLibrary.simpleMessage("Herunterladen"),
        "edit": MessageLookupByLibrary.simpleMessage("Bearbeiten"),
        "failedToGenerate":
            MessageLookupByLibrary.simpleMessage("Fehler beim generieren"),
        "generate": MessageLookupByLibrary.simpleMessage("Generieren"),
        "grid": MessageLookupByLibrary.simpleMessage("Gitter"),
        "imageGenerate": MessageLookupByLibrary.simpleMessage("Bild erzeugen"),
        "imageSize": MessageLookupByLibrary.simpleMessage("Bildgröße"),
        "inputKey": MessageLookupByLibrary.simpleMessage("Eingabetaste"),
        "interest": MessageLookupByLibrary.simpleMessage("Interesse"),
        "introAboutKey": MessageLookupByLibrary.simpleMessage(
            "Ihr API-Schlüssel wird lokal auf Ihrem Mobiltelefon gespeichert und niemals an einen anderen Ort gesendet. Sie können Ihren Schlüssel speichern, um ihn später zu verwenden. Sie können Ihren Schlüssel auch entfernen, wenn Sie ihn nicht mehr verwenden möchten."),
        "invalidKey":
            MessageLookupByLibrary.simpleMessage("Ungültiger Schlüssel"),
        "jobRole": MessageLookupByLibrary.simpleMessage("Stellenbeschreibung"),
        "jobSkills": MessageLookupByLibrary.simpleMessage("Berufsfähigkeiten"),
        "layoutStyle": MessageLookupByLibrary.simpleMessage("Layout-Stil"),
        "limitImage": m0,
        "limitTheText": m1,
        "listening": MessageLookupByLibrary.simpleMessage("Hören..."),
        "loadKeyFailed": MessageLookupByLibrary.simpleMessage(
            "Fehler beim Laden des Schlüssels"),
        "loadKeySuccess":
            MessageLookupByLibrary.simpleMessage("Schlüsselerfolg laden"),
        "manage": MessageLookupByLibrary.simpleMessage("Verwalten"),
        "medium": MessageLookupByLibrary.simpleMessage("Mittel"),
        "mood": MessageLookupByLibrary.simpleMessage("Stimmung"),
        "moreOptions": MessageLookupByLibrary.simpleMessage("Mehr Optionen"),
        "newChat": MessageLookupByLibrary.simpleMessage("Neuer Chat"),
        "noImageGenerate":
            MessageLookupByLibrary.simpleMessage("Kein Bild erzeugen"),
        "numberOfImages":
            MessageLookupByLibrary.simpleMessage("Anzahl der Bilder"),
        "numberOfImagesCondition": MessageLookupByLibrary.simpleMessage(
            "Die Anzahl der zu generierenden Bilder. Muss zwischen 1 und 10 liegen."),
        "options": MessageLookupByLibrary.simpleMessage("Optionen"),
        "page": MessageLookupByLibrary.simpleMessage("Seite"),
        "pleaseCheckConnection": MessageLookupByLibrary.simpleMessage(
            "Bitte überprüfe deine Verbindung und versuche es erneut!"),
        "pleaseInputFillAllFields": MessageLookupByLibrary.simpleMessage(
            "Bitte füllen Sie alle Felder aus"),
        "pleaseInputKey": MessageLookupByLibrary.simpleMessage(
            "Bitte geben Sie den Schlüssel ein"),
        "prompt": MessageLookupByLibrary.simpleMessage("Prompt"),
        "putKeyHere": MessageLookupByLibrary.simpleMessage(
            "Legen Sie hier Ihren Schlüssel ab"),
        "regenerateResponse":
            MessageLookupByLibrary.simpleMessage("Antwort neu generieren"),
        "remaining": MessageLookupByLibrary.simpleMessage("Verbleibend"),
        "remove": MessageLookupByLibrary.simpleMessage("Löschen"),
        "removeKeyFailed": MessageLookupByLibrary.simpleMessage(
            "Schlüssel konnte nicht entfernt werden"),
        "removeKeySuccess": MessageLookupByLibrary.simpleMessage(
            "Schlüssel erfolgreich entfernt"),
        "reset": MessageLookupByLibrary.simpleMessage("Zurücksetzen"),
        "resetSettings":
            MessageLookupByLibrary.simpleMessage("Einstellungen zurücksetzen"),
        "save": MessageLookupByLibrary.simpleMessage("sparen"),
        "saveKey": MessageLookupByLibrary.simpleMessage("Schlüssel speichern"),
        "saveKeyFailed": MessageLookupByLibrary.simpleMessage(
            "Fehler beim Speichern des Schlüssels"),
        "saveKeySuccess": MessageLookupByLibrary.simpleMessage(
            "Schlüssel erfolgreich gespeichert"),
        "searchByPrompt":
            MessageLookupByLibrary.simpleMessage("Nach Aufforderung suchen..."),
        "sectionKeywords":
            MessageLookupByLibrary.simpleMessage("Abschnitt Schlüsselwörter"),
        "sectionTopic": MessageLookupByLibrary.simpleMessage("Abschnitt Thema"),
        "selectChatFailed": MessageLookupByLibrary.simpleMessage(
            "Wählen Sie „Chat fehlgeschlagen“ aus"),
        "selectPrompt": MessageLookupByLibrary.simpleMessage(
            "Wählen Sie Eingabeaufforderung"),
        "settings": MessageLookupByLibrary.simpleMessage("die Einstellungen"),
        "share": MessageLookupByLibrary.simpleMessage("Aktie"),
        "skills": MessageLookupByLibrary.simpleMessage("Kompetenzen"),
        "somethingWentWrong": MessageLookupByLibrary.simpleMessage(
            "Etwas ist schief gelaufen!!!"),
        "somethingWhenWrong": MessageLookupByLibrary.simpleMessage(
            "Etwas ist schief gelaufen! Bitte versuchen Sie es später erneut. Vielen Dank!"),
        "speechNotAvailable":
            MessageLookupByLibrary.simpleMessage("Sprache nicht verfügbar"),
        "style": MessageLookupByLibrary.simpleMessage("Stil"),
        "subscriptionExpiredDate": m2,
        "tapTheMicToTalk": MessageLookupByLibrary.simpleMessage(
            "Tippen Sie auf das Mikrofon, um zu sprechen"),
        "textGenerate":
            MessageLookupByLibrary.simpleMessage("Texte generieren"),
        "textGenerator": MessageLookupByLibrary.simpleMessage("Textgenerator"),
        "timeGenerate": m3,
        "typeAMessage":
            MessageLookupByLibrary.simpleMessage("Nachricht eingeben ..."),
        "view": MessageLookupByLibrary.simpleMessage("Aussicht"),
        "viewType": MessageLookupByLibrary.simpleMessage("Ansichtstyp"),
        "write": MessageLookupByLibrary.simpleMessage("Schreiben")
      };
}
