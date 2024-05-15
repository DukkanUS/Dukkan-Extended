// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a uk locale. All the
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
  String get localeName => 'uk';

  static String m0(limit) =>
      "У безкоштовній версії є лише ${limit}x пошук зображень.";

  static String m1(limit) =>
      "Лише у безкоштовній версії можна відобразити до ${limit} повідомлень.";

  static String m2(date) => "Термін дії підписки закінчився ${date}";

  static String m3(number) =>
      "Створити (${number} ${Intl.plural(number, one: 'time', other: 'times')})";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("Про"),
        "apply": MessageLookupByLibrary.simpleMessage("застосувати"),
        "artist": MessageLookupByLibrary.simpleMessage("художник"),
        "cancel": MessageLookupByLibrary.simpleMessage("Скасувати"),
        "chat": MessageLookupByLibrary.simpleMessage("Чат"),
        "chatDetail": MessageLookupByLibrary.simpleMessage("Деталі чату"),
        "chatGPT": MessageLookupByLibrary.simpleMessage("Чат GPT"),
        "chatWithBot":
            MessageLookupByLibrary.simpleMessage("Спілкуйтеся з Ботом"),
        "chooseArtist": MessageLookupByLibrary.simpleMessage(
            "Виберіть художника для свого образу"),
        "chooseDetail": MessageLookupByLibrary.simpleMessage(
            "Виберіть деталь для свого образу"),
        "chooseMedium": MessageLookupByLibrary.simpleMessage(
            "Виберіть засіб для свого зображення"),
        "chooseMood": MessageLookupByLibrary.simpleMessage(
            "Виберіть настрій для свого образу"),
        "chooseUseCase": MessageLookupByLibrary.simpleMessage(
            "Виберіть варіант використання"),
        "choseStyle": MessageLookupByLibrary.simpleMessage(
            "Виберіть стиль для свого образу"),
        "clear": MessageLookupByLibrary.simpleMessage("Очистити"),
        "clearConfirm": MessageLookupByLibrary.simpleMessage(
            "Ви впевнені, що хочете очистити вміст?"),
        "clearContent": MessageLookupByLibrary.simpleMessage("Чіткий вміст"),
        "clearConversation":
            MessageLookupByLibrary.simpleMessage("Чітка розмова"),
        "confirm": MessageLookupByLibrary.simpleMessage("Підтвердьте"),
        "confirmDelete": MessageLookupByLibrary.simpleMessage(
            "Підтвердьте, якщо ви бажаєте продовжити видалення цього елемента. Ви не можете скасувати цю дію."),
        "confirmDeleteItem": MessageLookupByLibrary.simpleMessage(
            "Ви впевнені, що хочете видалити цей елемент?"),
        "confirmRemoveKey": MessageLookupByLibrary.simpleMessage(
            "Ви впевнені, що хочете видалити ключ?"),
        "copiedToClipboard": MessageLookupByLibrary.simpleMessage(
            "Вміст скопійовано в буфер обміну"),
        "copy": MessageLookupByLibrary.simpleMessage("Копіювати"),
        "createChatFailed":
            MessageLookupByLibrary.simpleMessage("Не вдалося створити чат"),
        "delete": MessageLookupByLibrary.simpleMessage("Видалити"),
        "deleteFailed":
            MessageLookupByLibrary.simpleMessage("Не вдалося видалити"),
        "detail": MessageLookupByLibrary.simpleMessage("Докладно"),
        "download": MessageLookupByLibrary.simpleMessage("Завантажити"),
        "edit": MessageLookupByLibrary.simpleMessage("редагувати"),
        "failedToGenerate":
            MessageLookupByLibrary.simpleMessage("Не вдалося створити"),
        "generate": MessageLookupByLibrary.simpleMessage("Створювати"),
        "grid": MessageLookupByLibrary.simpleMessage("Сітка"),
        "imageGenerate":
            MessageLookupByLibrary.simpleMessage("Генерація зображення"),
        "imageSize": MessageLookupByLibrary.simpleMessage("Розмір зображення"),
        "inputKey": MessageLookupByLibrary.simpleMessage("Ключ введення"),
        "interest": MessageLookupByLibrary.simpleMessage("Інтерес"),
        "introAboutKey": MessageLookupByLibrary.simpleMessage(
            "Ваш ключ API зберігається локально на вашому мобільному телефоні та більше нікуди не надсилається. Ви можете зберегти свій ключ, щоб використовувати його пізніше. Ви також можете видалити свій ключ, якщо більше не хочете ним користуватися."),
        "invalidKey": MessageLookupByLibrary.simpleMessage("Недійсний ключ"),
        "jobRole": MessageLookupByLibrary.simpleMessage("Посадова роль"),
        "jobSkills": MessageLookupByLibrary.simpleMessage("Робочі навички"),
        "layoutStyle": MessageLookupByLibrary.simpleMessage("Стиль макета"),
        "limitImage": m0,
        "limitTheText": m1,
        "listening": MessageLookupByLibrary.simpleMessage("Слухання..."),
        "loadKeyFailed":
            MessageLookupByLibrary.simpleMessage("Не вдалося завантажити ключ"),
        "loadKeySuccess":
            MessageLookupByLibrary.simpleMessage("Успішне завантаження ключа"),
        "manage": MessageLookupByLibrary.simpleMessage("управління"),
        "medium": MessageLookupByLibrary.simpleMessage("середній"),
        "mood": MessageLookupByLibrary.simpleMessage("настрій"),
        "moreOptions": MessageLookupByLibrary.simpleMessage("Більше опцій"),
        "newChat": MessageLookupByLibrary.simpleMessage("Новий чат"),
        "noImageGenerate":
            MessageLookupByLibrary.simpleMessage("Зображення не генерується"),
        "numberOfImages":
            MessageLookupByLibrary.simpleMessage("кількість зображень"),
        "numberOfImagesCondition": MessageLookupByLibrary.simpleMessage(
            "Кількість зображень для створення. Має бути від 1 до 10."),
        "options": MessageLookupByLibrary.simpleMessage("Параметри"),
        "page": MessageLookupByLibrary.simpleMessage("сторінка"),
        "pleaseCheckConnection": MessageLookupByLibrary.simpleMessage(
            "Перевірте підключення та повторіть спробу!"),
        "pleaseInputFillAllFields": MessageLookupByLibrary.simpleMessage(
            "Будь ласка, заповніть усі поля"),
        "pleaseInputKey":
            MessageLookupByLibrary.simpleMessage("Будь ласка, введіть ключ"),
        "prompt": MessageLookupByLibrary.simpleMessage("Підказуйте"),
        "putKeyHere":
            MessageLookupByLibrary.simpleMessage("Покладіть свій ключ тут"),
        "regenerateResponse":
            MessageLookupByLibrary.simpleMessage("Відновити відповідь"),
        "remaining": MessageLookupByLibrary.simpleMessage("Залишився"),
        "remove": MessageLookupByLibrary.simpleMessage("Видалити"),
        "removeKeyFailed":
            MessageLookupByLibrary.simpleMessage("Не вдалося видалити ключ"),
        "removeKeySuccess":
            MessageLookupByLibrary.simpleMessage("Ключ успішно видалено"),
        "reset": MessageLookupByLibrary.simpleMessage("Скинути"),
        "resetSettings":
            MessageLookupByLibrary.simpleMessage("Скинути налаштування"),
        "save": MessageLookupByLibrary.simpleMessage("зберегти"),
        "saveKey": MessageLookupByLibrary.simpleMessage("Зберегти ключ"),
        "saveKeyFailed":
            MessageLookupByLibrary.simpleMessage("Не вдалося зберегти ключ"),
        "saveKeySuccess":
            MessageLookupByLibrary.simpleMessage("Ключ успішно збережено"),
        "searchByPrompt":
            MessageLookupByLibrary.simpleMessage("Пошук за запитом..."),
        "sectionKeywords":
            MessageLookupByLibrary.simpleMessage("Ключові слова розділу"),
        "sectionTopic": MessageLookupByLibrary.simpleMessage("Розділ Тема"),
        "selectChatFailed":
            MessageLookupByLibrary.simpleMessage("Виберіть Чат не вдалося"),
        "selectPrompt":
            MessageLookupByLibrary.simpleMessage("Виберіть Підказка"),
        "settings": MessageLookupByLibrary.simpleMessage("налаштування"),
        "share": MessageLookupByLibrary.simpleMessage("Поділитися"),
        "skills": MessageLookupByLibrary.simpleMessage("Навички"),
        "somethingWentWrong":
            MessageLookupByLibrary.simpleMessage("Щось пішло не так!!!"),
        "somethingWhenWrong": MessageLookupByLibrary.simpleMessage(
            "Щось пішло не так! Будь-ласка спробуйте пізніше. Дуже дякую!"),
        "speechNotAvailable":
            MessageLookupByLibrary.simpleMessage("Мовлення недоступне"),
        "style": MessageLookupByLibrary.simpleMessage("Стиль"),
        "subscriptionExpiredDate": m2,
        "tapTheMicToTalk": MessageLookupByLibrary.simpleMessage(
            "Торкніться мікрофона, щоб говорити"),
        "textGenerate":
            MessageLookupByLibrary.simpleMessage("Генерувати текст"),
        "textGenerator":
            MessageLookupByLibrary.simpleMessage("Генератор тексту"),
        "timeGenerate": m3,
        "typeAMessage":
            MessageLookupByLibrary.simpleMessage("Введіть повідомлення..."),
        "view": MessageLookupByLibrary.simpleMessage("Переглянути"),
        "viewType": MessageLookupByLibrary.simpleMessage("Вид перегляду"),
        "write": MessageLookupByLibrary.simpleMessage("Напишіть")
      };
}
