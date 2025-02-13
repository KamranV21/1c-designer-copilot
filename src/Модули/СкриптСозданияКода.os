#Использовать "../gemini"
#Использовать "../utils"

JSON = РаботаСФайлами.СодержимоеТекстовогоДокумента(ТекущийСценарий().Каталог + "\..\..\env.json");
env = РаботаСJSON.ЗначениеИзJSON(JSON);

ПутьКФайлу = ТекущийСценарий().Каталог + "\..\..\temp\clipboard.txt";

Промт = РаботаСФайлами.СодержимоеТекстовогоДокумента(ПутьКФайлу);

Gemini = Новый Gemini(env.geminiApiKey);
Результат = Gemini.СформироватьКодПоОписанию(Промт);

РаботаСФайлами.ЗаписатьТекстовыйДокумент(ПутьКФайлу, Результат.Ответ);
