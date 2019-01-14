# Advanced-RTF-Report

Advanced RTF Report

Генератор предназначен для получения RTF отчетов без использования WORD, отчетов в EXCEL как с использованием шаблона, так и без, а также текстовых отчетов с заданной структурой (например, XML или HTML). 
Имеет гибкую структуру, позволяющую последовательно добавлять неограниченное количество таблиц. Также можно вложить таблицу в контейнер и размножить ее по количеству записей в таблице контейнера.
Скорость генерации – 10-100 листов в секунду

Ver 1.1
1. Добавлена возможность обратной сортировки, для этого конструкцию "ORD=выражение" писать как "ORD=DESC:выражение"
2. Добавлен показ % выполнения формирования разделов отчета
3. Добавлена возможность замены русских букв на HEX-коды при обработке символьных переменных

Ver 1.2
1. Добавлены теги [CASE], [OTHERWISE], [ENDCASE], позволяющие выбрать альтернативные варианты печати каждой строки отчета. Принцип действия аналогичен такому же оператору в фоксе.
2. Добавлен предварительный подсчет кол-ва разделов и вывод в градуснике "*** из ***"
3. Изменен метод запуска готового файла на WScript.

Ver 1.3
1. Добавлена возможность вывода в отчет PNG файлов (конструкция IMG: в описании символьных переменных)
2. Для картинок (переменных с IMG:) можно задавать 3 типа рамки: RM1-простая рамка,RM2-рамка с тенью,RM3-двойная рамка
3. Добавлена возможность разделения разрядов при обработке числовых переменных (конструкция RAZ).
4. Добавлен вывод ДА/НЕТ при обработке логических переменных (конструкция LRU:)

Ver 1.4
1. Исправлена неадекватная работа счетчика str_tbl (не сбрасывался на 0 при смене таблицы)
2. Исправлен рабочий алиас заголовка и подвала контейнера (переменные не отрабатывались правильно без явного указания алиаса контейнера)
3. Добавлена возможность задавать условие в теге [ALI] как USL$выражение для поиска по списку. Условием для добавления записей в таблицу, находящуюся в группе, в этом случае является: выражение IN (ключ), т.е. ключ должен быть вида "1,2,3" или "'AA','BB','CC'".

Ver 1.5
1. Добавлена возможность задавать подстановки для переменных (конструкция REPVAR*:) Потом использование в переменных вида [&*], где * - ID подстановки. Переменная наследует все функции подстановки, при этом функции самой переменной приоритетней функций подстановки.
2. Ранее переменные переводились UPPER() теперь этого не делается. Это сделано для того, чтобы переменные вида ["Дата:"+DTOC(DATE())] выводились в виде "Дата:..." а не "ДАТА:...". Индексы, условия, группировки и сортировки остались регистронезависимыми (переводятся в UPPER() перед обработкой)!

Ver 1.6
1. Добавлен параметр [ADDF] в конфигурации запуска для подавления ошибки создания выходного файла. В случае, если файл результата не может быть перезаписан, добавляет к имени файла "_N", где N может быть от 1 до 49 и пытается записать с новым именем. При достижении N=50, формирует ошибку доступа к диску.
2. Добавлена возможность вывода в отчет JPG файлов.

Ver 2.0
ВНИМАНИЕ! VER 2.0 НЕСОВМЕСТИМА С ПРЕДЫДУЩИМИ ВЕРСИЯМИ В ПЛАНЕ СЧЕТЧИКОВ И АЛИАСОВ ГРУПП!!!
1. Добавлена возможность добавлять подгруппы. Подгруппы объявляются также как и группы. МАХ вложенность групп=6.
2. Полностью изменен подход к счетчикам, теперь их стало 72 штуки.
3. Алиас группы изменился с GRP на GR1,GR2,GR3... - в зависимости от вложенности.

Ver 2.1
1. Поправлен счетчик [tbl_str] (в некоторых случаях считал неверно)
2. Исправлена ошибка обработки файлов у которых внутренние шрифты указаны без кодировки.
3. Добавлена функция форматирования "BLZ" - выводит число 1000000 как 1 000 000, разделяя разряды пробелами, при этом если число=0, то не выводит ничего.
4. Добавлена функция форматирования "BLK" - если число=0, то не выводит ничего.
5. Добавлен параметр [HIDE] в конфигурации запуска для подавления сообщений процесса генерации

Ver 2.2
1. Поправлены косяки с подстановками в переменных. (Для ряда функций брались не те данные)
2. В целях унификации шаблонов добавлена подстановка "&" при описании контейнеров, таблиц или групп.
Пример использования [REP:ALI=&myalias|ORD=&myorder] - здесь в "ALI=&myalias" - "&" - признак подстановки, "myalias" - переменная, которая содержит значения алиаса. Так же и для сортировки. Переменные "myalias" и "myorder" должны быть описаны до запуска генератора! Подстановка может быть использована для любой секции и позволит многократно использовать один и тот же шаблон для схожих по структуре данных.
3. Добавлена функция преобразования "RD3" - округление до 3 знаков после запятой.
4. Добавлена пользовательская функция форматирования переменных: конструкция "FUN=USERFUNC" или "FUN=USERFUNC(m.znh_now)". Если нужно в вашу функцию передать более одного значения, то для передачи текущего значения поля нужно пользоваться переменной m.znh_now.Если параметр только один, то задавать его не нужно - будет автоматически добавлено к имени функции концовка "(m.znh_now)"! Эта конструкция разделяется двоеточием от остальных функций. Выполняется после всех преобразований, при этом имейте ввиду, что тип переменной m.znh_now в момент запуска пользовательской функции, всегда символьный! На выходе также ожидается значение символьного типа!

Ver 2.3
1. Поправлен подвал группировок и ссылки на другие группы. (Теперь в алиасе, на который ссылается переменная, указатель записи из EOF() переводится на BOTTOM).
2. Исправлена ошибка с ограничением до 3, распознавания секций в описании переменных. В связи с этим часть ф-й могли не распознаться. (Теперь увеличено до 10)
3. Теперь концовка к имени пользовательской функции форматирования переменных добавляется не "(m.znh_now)" a "(m.znh_val)". Проверьте свои шаблоны!
4. Добавлена переменная ZNH_VAL с вычисленным, но не преобразованным значением для использования во внешних функциях. Тип переменной ZNH_VAL тот, который имеет поле (выражение) в источнике. ВНИМАНИЕ! Если вы используете внешнюю функцию с переменной ZNH_VAL, то функции преобразования и форматирования задавать бессмысленно!
5. Добавлена переменная ZNH_CON с вычисленным и преобразованным но не отформатированным значением для использования во внешних функциях. Тип переменной ZNH_CON тот, который имеет который имеет функция преобразования на выходе. ВНИМАНИЕ! Если вы используете внешнюю функцию с переменной ZNH_CON, то функции форматирования задавать бессмысленно!

Ver 2.4
1. Исправлена ошибка с длинными путями при показе готового отчета (теперь полное имя файла оборачивается в кавычки).
2. Добавлен параметр [PRINT] или [PRINT=имя_принтера] в конфигурации запуска для печати отчета без просмотра. После знака равенства можно задать целевой принтер.
3. Добавлен параметр [COPIES=*] для печати * копий отчета. Актуально только совместно с [PRINT].
4. Добавлен параметр [PAGES=1,2,5-8] для печати заданных страниц или [PAGES=BOOK] для формирования книжки.
Актуально только совместно с [PRINT]!

Ver 2.5
1. Добавлен параметр [MERGE] - Позволяет объединять текущий результат с существующим файлом WORD.
2. Тег [ENDPAGE] теперь не срабатывает на последних записях текущей таблицы.
3. У тега [ENDPAGE] добавлена возможность задавать условие срабатывания: конструкция USL=выражение (задается через разделитель "|")
4. Добавлена пост обработка полученного файла (параметр [FORMAT]): обновление оглавления, если оно есть (только если установлен MS Office)
5. Оптимизация ввода/вывода. Существенное ускорение разборки шаблонов отчетов.
6. Добавлена функция форматирования "TDT" – преобразует DATETIME значение в тип DATE.
7. Исправлена ошибка исполнения условий объектов в безалиасной зоне.

Ver 2.6

Добавлена функция SPLIT_REPORT(), надстройка над RTF_REPORT() - дает возможность разделения отчета на несколько файлов. Здесь и далее будут использоваться ссылки, для привязки изменений к конкретной функции.
[1] - изменения для функции RTF_REPORT()
[2] - изменения для функции SPLIT_REPORT()
1. [1].ADD: Генератор можно использовать для формирования текстовых (HTML и XML) отчетов.
2. [1].ERR: Исправлена ошибка применения условия таблицы, заданной вне контейнера
3. [1].ADD: Добавлен параметр [COD=N] - Позволяет записывать данные поля в перекодированном виде. Варианты N см. в параметрах ф-и STRCONV(). Параметр [COD] имеет более высокий приоритет, чем параметр [ENCODE].
4. [1].ADD: Добавлен параметр [ENCODE=N] - Позволяет записывать все данные отчета в перекодированном виде. Варианты N см. в параметрах ф-и STRCONV(). (Например, есть шаблон в кодировке 1251, необходимо сохранить XML файл в кодировке utf-8).
5. [2].ADD: Добавлена функция SPLIT_REPORT(), надстройка над RTF_REPORT() - дает возможность разделения отчета на несколько файлов.
6. [2].ADD: Добавлен ОБЯЗАТЕЛЬНЫЙ параметр [SPLIT=*] - где "*" - MAX количество записей в томе.
7. [2].ADD: Добавлен параметр [STOMS=1,2,5-8] для формирования только указанных томов.

Ver 2.7
1. [1].ADD: Добавлена функция преобразования "PAR" - для добавления текста содержащего несколько строк в виде отдельных параграфов. Актуально только для RTF файла. 

Ver 2.8
1. [1].ERR: Добавлена проверка длины наименования функции преобразования, чтобы исключить их срабатывание при похожем начале имени переменной и установкой SET EXACT OFF. 2. [1].ADD: Добавлена функция преобразования "ML5" - масштабирование (уменьшение) картинки на 50% (актуально только для конструкции "IMG"). 

Ver 2.9
1. [1].IZM: Более чем в 2 раза ускорена функция разборки шаблона READ_RTF(). 

Ver 3.0
Добавлена функция XLS_REPORT, надстройка над RTF_REPORT() для формирования отчетов в EXCEL с использованием XML шаблонов. 
Добавлена функция DBF_TOEXCEL - продвинутая выгрузка данных курсора в EXCEL – для любителей творить отчеты кодом. 
Здесь и далее будут использоваться ссылки, для привязки изменений к конкретной функции:

• [1] - изменения для функции RTF_REPORT()
• [2] - изменения для функции SPLIT_REPORT()
• [3] - изменения для функции XLS_REPORT()
• [4] - изменения для функции DBF_TOEXCEL()

1. [1].ADD: Добавлена поддержка выгрузки в EXCEL. 
2. [3].ADD: Добавлена функции XLS_REPORT(). 
3. [4].ADD: Добавлена функции DBF_TOEXCEL(). 
