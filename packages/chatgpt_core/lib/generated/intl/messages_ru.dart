// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
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
  String get localeName => 'ru';

  static String m0(limit) =>
      "В бесплатной версии есть только ${limit}x поиск изображений.";

  static String m1(limit) =>
      "Только в бесплатной версии может отображаться до ${limit} сообщений.";

  static String m2(date) => "Срок действия подписки ${date}";

  static String m3(number) =>
      "Создать (${number} ${Intl.plural(number, one: 'time', other: 'times')})";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("Около"),
        "apply": MessageLookupByLibrary.simpleMessage("Применять"),
        "artist": MessageLookupByLibrary.simpleMessage("художник"),
        "cancel": MessageLookupByLibrary.simpleMessage("отменить"),
        "chat": MessageLookupByLibrary.simpleMessage("чат"),
        "chatDetail": MessageLookupByLibrary.simpleMessage("Подробности чата"),
        "chatGPT": MessageLookupByLibrary.simpleMessage("Теги GPT в чате"),
        "chatWithBot": MessageLookupByLibrary.simpleMessage("Чат с ботом"),
        "chooseArtist": MessageLookupByLibrary.simpleMessage(
            "Выберите исполнителя для вашего изображения"),
        "chooseDetail": MessageLookupByLibrary.simpleMessage(
            "Выберите детали для вашего образа"),
        "chooseMedium": MessageLookupByLibrary.simpleMessage(
            "Выберите средство для вашего изображения"),
        "chooseMood": MessageLookupByLibrary.simpleMessage(
            "Выберите настроение для вашего образа"),
        "chooseUseCase": MessageLookupByLibrary.simpleMessage(
            "Выберите вариант использования"),
        "choseStyle": MessageLookupByLibrary.simpleMessage(
            "Выберите стиль для вашего образа"),
        "clear": MessageLookupByLibrary.simpleMessage("Очистить"),
        "clearConfirm": MessageLookupByLibrary.simpleMessage(
            "Вы уверены, что хотите удалить контент?"),
        "clearContent":
            MessageLookupByLibrary.simpleMessage("Очистить содержание"),
        "clearConversation":
            MessageLookupByLibrary.simpleMessage("Очистить разговор"),
        "confirm": MessageLookupByLibrary.simpleMessage("подтвердить"),
        "confirmDelete": MessageLookupByLibrary.simpleMessage(
            "Пожалуйста, подтвердите, если вы хотите продолжить удаление этого элемента. Это действие нельзя отменить."),
        "confirmDeleteItem": MessageLookupByLibrary.simpleMessage(
            "Вы уверены, что хотите удалить этот элемент?"),
        "confirmRemoveKey": MessageLookupByLibrary.simpleMessage(
            "Вы уверены, что хотите удалить ключ?"),
        "copiedToClipboard": MessageLookupByLibrary.simpleMessage(
            "Содержимое скопировано в буфер обмена"),
        "copy": MessageLookupByLibrary.simpleMessage("копия"),
        "createChatFailed":
            MessageLookupByLibrary.simpleMessage("Не удалось создать чат"),
        "delete": MessageLookupByLibrary.simpleMessage("удалять"),
        "deleteFailed":
            MessageLookupByLibrary.simpleMessage("Не удалось удалить"),
        "detail": MessageLookupByLibrary.simpleMessage("подробность"),
        "download": MessageLookupByLibrary.simpleMessage("Скачать"),
        "edit": MessageLookupByLibrary.simpleMessage("редактировать"),
        "failedToGenerate":
            MessageLookupByLibrary.simpleMessage("Не удалось сгенерировать"),
        "generate": MessageLookupByLibrary.simpleMessage("генерировать"),
        "grid": MessageLookupByLibrary.simpleMessage("сетка"),
        "imageGenerate":
            MessageLookupByLibrary.simpleMessage("Создание изображения"),
        "imageSize": MessageLookupByLibrary.simpleMessage("Размер изображения"),
        "inputKey": MessageLookupByLibrary.simpleMessage("Ключ ввода"),
        "interest": MessageLookupByLibrary.simpleMessage("интерес"),
        "introAboutKey": MessageLookupByLibrary.simpleMessage(
            "Ваш API-ключ хранится локально на вашем мобильном телефоне и никогда никуда не отправляется. Вы можете сохранить свой ключ, чтобы использовать его позже. Вы также можете удалить свой ключ, если не хотите его больше использовать."),
        "invalidKey": MessageLookupByLibrary.simpleMessage("Неправильный ключ"),
        "jobRole": MessageLookupByLibrary.simpleMessage("рабочая роль"),
        "jobSkills": MessageLookupByLibrary.simpleMessage("Рабочие навыки"),
        "layoutStyle": MessageLookupByLibrary.simpleMessage("Стиль макета"),
        "limitImage": m0,
        "limitTheText": m1,
        "listening": MessageLookupByLibrary.simpleMessage("Прослушивание ..."),
        "loadKeyFailed":
            MessageLookupByLibrary.simpleMessage("Ошибка загрузки ключа"),
        "loadKeySuccess":
            MessageLookupByLibrary.simpleMessage("Загрузить ключ успешно"),
        "manage": MessageLookupByLibrary.simpleMessage("управлять"),
        "medium": MessageLookupByLibrary.simpleMessage("Средняя"),
        "mood": MessageLookupByLibrary.simpleMessage("Настроение"),
        "moreOptions": MessageLookupByLibrary.simpleMessage("Больше вариантов"),
        "newChat": MessageLookupByLibrary.simpleMessage("Новый чат"),
        "noImageGenerate":
            MessageLookupByLibrary.simpleMessage("Не генерируется изображение"),
        "numberOfImages":
            MessageLookupByLibrary.simpleMessage("Количество изображений"),
        "numberOfImagesCondition": MessageLookupByLibrary.simpleMessage(
            "Количество изображений для создания. Должно быть от 1 до 10."),
        "options": MessageLookupByLibrary.simpleMessage("опции"),
        "page": MessageLookupByLibrary.simpleMessage("страница"),
        "pleaseCheckConnection": MessageLookupByLibrary.simpleMessage(
            "Пожалуйста, проверьте подключение и повторите попытку!"),
        "pleaseInputFillAllFields": MessageLookupByLibrary.simpleMessage(
            "Пожалуйста, заполните все поля"),
        "pleaseInputKey":
            MessageLookupByLibrary.simpleMessage("Пожалуйста, введите ключ"),
        "prompt": MessageLookupByLibrary.simpleMessage("подсказка"),
        "putKeyHere":
            MessageLookupByLibrary.simpleMessage("Положи сюда свой ключ"),
        "regenerateResponse":
            MessageLookupByLibrary.simpleMessage("Восстановить ответ"),
        "remaining": MessageLookupByLibrary.simpleMessage("остальной"),
        "remove": MessageLookupByLibrary.simpleMessage("Удалить"),
        "removeKeyFailed":
            MessageLookupByLibrary.simpleMessage("Ошибка удаления ключа"),
        "removeKeySuccess":
            MessageLookupByLibrary.simpleMessage("Ключ успешно удален"),
        "reset": MessageLookupByLibrary.simpleMessage("Сброс"),
        "resetSettings":
            MessageLookupByLibrary.simpleMessage("Сбросить настройки"),
        "save": MessageLookupByLibrary.simpleMessage("Сохранить"),
        "saveKey": MessageLookupByLibrary.simpleMessage("Сохранить ключ"),
        "saveKeyFailed":
            MessageLookupByLibrary.simpleMessage("Ошибка сохранения ключа"),
        "saveKeySuccess":
            MessageLookupByLibrary.simpleMessage("Ключ успешно сохранен"),
        "searchByPrompt":
            MessageLookupByLibrary.simpleMessage("Поиск по подсказке..."),
        "sectionKeywords":
            MessageLookupByLibrary.simpleMessage("Ключевые слова раздела"),
        "sectionTopic": MessageLookupByLibrary.simpleMessage("Раздел Тема"),
        "selectChatFailed":
            MessageLookupByLibrary.simpleMessage("Выберите чат не удалось"),
        "selectPrompt":
            MessageLookupByLibrary.simpleMessage("Выберите Подсказка"),
        "settings": MessageLookupByLibrary.simpleMessage("настройки"),
        "share": MessageLookupByLibrary.simpleMessage("Поделиться"),
        "skills": MessageLookupByLibrary.simpleMessage("Навыки"),
        "somethingWentWrong":
            MessageLookupByLibrary.simpleMessage("Что-то пошло не так!!!"),
        "somethingWhenWrong": MessageLookupByLibrary.simpleMessage(
            "Что-то пошло не так! Пожалуйста, повторите попытку позже. Большое спасибо!"),
        "speechNotAvailable":
            MessageLookupByLibrary.simpleMessage("Речь недоступна"),
        "style": MessageLookupByLibrary.simpleMessage("Стиль"),
        "subscriptionExpiredDate": m2,
        "tapTheMicToTalk": MessageLookupByLibrary.simpleMessage(
            "Коснитесь микрофона, чтобы поговорить"),
        "textGenerate":
            MessageLookupByLibrary.simpleMessage("Генерация текста"),
        "textGenerator":
            MessageLookupByLibrary.simpleMessage("Генератор текста"),
        "timeGenerate": m3,
        "typeAMessage":
            MessageLookupByLibrary.simpleMessage("Введите сообщение ..."),
        "view": MessageLookupByLibrary.simpleMessage("Посмотреть"),
        "viewType": MessageLookupByLibrary.simpleMessage("Тип просмотра"),
        "write": MessageLookupByLibrary.simpleMessage("Напишите")
      };
}
