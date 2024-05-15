// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pl locale. All the
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
  String get localeName => 'pl';

  static String m0(limit) =>
      "W darmowej wersji dostępne jest tylko ${limit}x wyszukiwanie grafiki.";

  static String m1(limit) =>
      "Tylko w bezpłatnej wersji można wyświetlić maksymalnie ${limit} wiadomości.";

  static String m2(date) => "Data wygaśnięcia subskrypcji ${date}";

  static String m3(number) =>
      "Wygeneruj (${number} ${Intl.plural(number, one: 'time', other: 'times')})";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("O"),
        "apply": MessageLookupByLibrary.simpleMessage("Zastosować"),
        "artist": MessageLookupByLibrary.simpleMessage("Artysta"),
        "cancel": MessageLookupByLibrary.simpleMessage("Anuluj"),
        "chat": MessageLookupByLibrary.simpleMessage("Czat"),
        "chatDetail": MessageLookupByLibrary.simpleMessage("Szczegóły czatu"),
        "chatGPT": MessageLookupByLibrary.simpleMessage("Czat GPT"),
        "chatWithBot": MessageLookupByLibrary.simpleMessage("Czat z Botem"),
        "chooseArtist": MessageLookupByLibrary.simpleMessage(
            "Wybierz artystę dla swojego obrazu"),
        "chooseDetail": MessageLookupByLibrary.simpleMessage(
            "Wybierz szczegóły dla swojego obrazu"),
        "chooseMedium": MessageLookupByLibrary.simpleMessage(
            "Wybierz medium dla swojego obrazu"),
        "chooseMood": MessageLookupByLibrary.simpleMessage(
            "Wybierz nastrój dla swojego obrazu"),
        "chooseUseCase":
            MessageLookupByLibrary.simpleMessage("Wybierz przypadek użycia"),
        "choseStyle": MessageLookupByLibrary.simpleMessage(
            "Wybierz styl dla swojego obrazu"),
        "clear": MessageLookupByLibrary.simpleMessage("Jasny"),
        "clearConfirm": MessageLookupByLibrary.simpleMessage(
            "Czy na pewno usunąć zawartość?"),
        "clearContent": MessageLookupByLibrary.simpleMessage("Wyczyść treść"),
        "clearConversation":
            MessageLookupByLibrary.simpleMessage("Wyraźna rozmowa"),
        "confirm": MessageLookupByLibrary.simpleMessage("Potwierdzać"),
        "confirmDelete": MessageLookupByLibrary.simpleMessage(
            "Potwierdź, czy chcesz kontynuować usuwanie tego elementu. Tej czynności nie można cofnąć."),
        "confirmDeleteItem": MessageLookupByLibrary.simpleMessage(
            "Czy na pewno chcesz usunąć ten element?"),
        "confirmRemoveKey":
            MessageLookupByLibrary.simpleMessage("Czy na pewno usunąć klucz?"),
        "copiedToClipboard": MessageLookupByLibrary.simpleMessage(
            "Skopiowano zawartość do schowka"),
        "copy": MessageLookupByLibrary.simpleMessage("Kopiuj"),
        "createChatFailed": MessageLookupByLibrary.simpleMessage(
            "Tworzenie czatu nie powiodło się"),
        "delete": MessageLookupByLibrary.simpleMessage("Kasować"),
        "deleteFailed":
            MessageLookupByLibrary.simpleMessage("Usunięcie nie powiodło się"),
        "detail": MessageLookupByLibrary.simpleMessage("Szczegół"),
        "download": MessageLookupByLibrary.simpleMessage("Ściągnij"),
        "edit": MessageLookupByLibrary.simpleMessage("Edytować"),
        "failedToGenerate":
            MessageLookupByLibrary.simpleMessage("Nie udało się wygenerować"),
        "generate": MessageLookupByLibrary.simpleMessage("Generować"),
        "grid": MessageLookupByLibrary.simpleMessage("Krata"),
        "imageGenerate":
            MessageLookupByLibrary.simpleMessage("Wygeneruj obraz"),
        "imageSize": MessageLookupByLibrary.simpleMessage("Rozmiar obrazu"),
        "inputKey": MessageLookupByLibrary.simpleMessage("Klucz wejściowy"),
        "interest": MessageLookupByLibrary.simpleMessage("Zainteresowanie"),
        "introAboutKey": MessageLookupByLibrary.simpleMessage(
            "Twój klucz API jest przechowywany lokalnie na telefonie komórkowym i nigdy nie jest wysyłany nigdzie indziej. Możesz zapisać swój klucz, aby użyć go później. Możesz też wyjąć klucz, jeśli nie chcesz go już używać."),
        "invalidKey": MessageLookupByLibrary.simpleMessage("Niewłaściwy klucz"),
        "jobRole": MessageLookupByLibrary.simpleMessage("Rola pracy"),
        "jobSkills":
            MessageLookupByLibrary.simpleMessage("Umiejętności w pracy"),
        "layoutStyle": MessageLookupByLibrary.simpleMessage("Styl układu"),
        "limitImage": m0,
        "limitTheText": m1,
        "listening": MessageLookupByLibrary.simpleMessage("Słuchający..."),
        "loadKeyFailed": MessageLookupByLibrary.simpleMessage(
            "Ładowanie klucza nie powiodło się"),
        "loadKeySuccess":
            MessageLookupByLibrary.simpleMessage("Załaduj klucz pomyślnie"),
        "manage": MessageLookupByLibrary.simpleMessage("Zarządzanie"),
        "medium": MessageLookupByLibrary.simpleMessage("Średni"),
        "mood": MessageLookupByLibrary.simpleMessage("Nastrój"),
        "moreOptions": MessageLookupByLibrary.simpleMessage("Więcej opcji"),
        "newChat": MessageLookupByLibrary.simpleMessage("Nowy czat"),
        "noImageGenerate":
            MessageLookupByLibrary.simpleMessage("Brak generowania obrazu"),
        "numberOfImages":
            MessageLookupByLibrary.simpleMessage("Liczba obrazów"),
        "numberOfImagesCondition": MessageLookupByLibrary.simpleMessage(
            "Liczba obrazów do wygenerowania. Musi zawierać się w przedziale od 1 do 10."),
        "options": MessageLookupByLibrary.simpleMessage("Opcje"),
        "page": MessageLookupByLibrary.simpleMessage("Strona"),
        "pleaseCheckConnection": MessageLookupByLibrary.simpleMessage(
            "Proszę, sprawdź swoje połączenie i spróbuj ponownie!"),
        "pleaseInputFillAllFields": MessageLookupByLibrary.simpleMessage(
            "Proszę wypełnić wszystkie pola"),
        "pleaseInputKey":
            MessageLookupByLibrary.simpleMessage("Proszę wprowadzić klucz"),
        "prompt": MessageLookupByLibrary.simpleMessage("Skłonić"),
        "putKeyHere":
            MessageLookupByLibrary.simpleMessage("Połóż swój klucz tutaj"),
        "regenerateResponse":
            MessageLookupByLibrary.simpleMessage("Zregeneruj odpowiedź"),
        "remaining": MessageLookupByLibrary.simpleMessage("Pozostały"),
        "remove": MessageLookupByLibrary.simpleMessage("usunąć"),
        "removeKeyFailed": MessageLookupByLibrary.simpleMessage(
            "Usuwanie klucza nie powiodło się"),
        "removeKeySuccess":
            MessageLookupByLibrary.simpleMessage("Pomyślnie usunięto klucz"),
        "reset": MessageLookupByLibrary.simpleMessage("Nastawić"),
        "resetSettings":
            MessageLookupByLibrary.simpleMessage("Resetowanie ustawień"),
        "save": MessageLookupByLibrary.simpleMessage("Zapisać"),
        "saveKey": MessageLookupByLibrary.simpleMessage("Zapisz klucz"),
        "saveKeyFailed": MessageLookupByLibrary.simpleMessage(
            "Zapisywanie klucza nie powiodło się"),
        "saveKeySuccess":
            MessageLookupByLibrary.simpleMessage("Pomyślnie zapisano klucz"),
        "searchByPrompt":
            MessageLookupByLibrary.simpleMessage("Szukaj według monitu..."),
        "sectionKeywords":
            MessageLookupByLibrary.simpleMessage("Słowa kluczowe sekcji"),
        "sectionTopic": MessageLookupByLibrary.simpleMessage("Temat sekcji"),
        "selectChatFailed": MessageLookupByLibrary.simpleMessage(
            "Wybierz Czat nie powiódł się"),
        "selectPrompt":
            MessageLookupByLibrary.simpleMessage("Wybierz Podpowiedź"),
        "settings": MessageLookupByLibrary.simpleMessage("Ustawienia"),
        "share": MessageLookupByLibrary.simpleMessage("Dzielić"),
        "skills": MessageLookupByLibrary.simpleMessage("Umiejętności"),
        "somethingWentWrong":
            MessageLookupByLibrary.simpleMessage("Coś poszło nie tak!!!"),
        "somethingWhenWrong": MessageLookupByLibrary.simpleMessage(
            "Coś poszło nie tak! Spróbuj ponownie później. Bardzo dziękuję!"),
        "speechNotAvailable":
            MessageLookupByLibrary.simpleMessage("Mowa niedostępna"),
        "style": MessageLookupByLibrary.simpleMessage("Styl"),
        "subscriptionExpiredDate": m2,
        "tapTheMicToTalk": MessageLookupByLibrary.simpleMessage(
            "Dotknij mikrofonu, aby mówić"),
        "textGenerate": MessageLookupByLibrary.simpleMessage("Wygeneruj tekst"),
        "textGenerator":
            MessageLookupByLibrary.simpleMessage("Generator tekstu"),
        "timeGenerate": m3,
        "typeAMessage":
            MessageLookupByLibrary.simpleMessage("Wpisz wiadomość..."),
        "view": MessageLookupByLibrary.simpleMessage("widok"),
        "viewType": MessageLookupByLibrary.simpleMessage("Zobacz typ"),
        "write": MessageLookupByLibrary.simpleMessage("pisać")
      };
}
