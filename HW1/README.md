# Лабораторная работа 1

## Плохой пример в `Dockerfile_bad`

1. Использование "жирного" образа:
   * Проблема в использовании тяжелого образа без особой необходимости.
   * Плохо, потому что приводит к увеличению веса образа.
   * В `Dockerfile_good` исправлено путём изменения базового образа с `jupyter/datascience-notebook:latest` на `jupyter/minimal-notebook:latest`.
2. Разделение команд на отдельные слои
   * Каждая команда `RUN` создает новый слой, что увеличивает количество слоев и размер образа.
   * Больше слоёв — больше размер образа.
   * Исправлено с помощью `&&`, что объединяет команды в один слой.
3. Копирование всех файлов проекта
   * Проблема: Команда `COPY` копирует все файлы, среди которых может оказаться конфиденциальная информация, например в `.env`.
   * Увеличивает размер образа и возможная потеря конфиденциальности
   * Исправлено путём добавления только необходимых файлов. Так же можно решить с помощью `.dockerignore`

## Плохие практики контейнеризации
1. <b>Хранение данных в контенерах.</b> Хранение данных внутри контейнеров может привести к потере данных при удалении или перезапуске контейнеров. Лучше использовать внешние тома или базы данных для хранения данных.
2. <b>Хранение конфиденциальной информации</b>, такой как пароли, в Dockerfile или в переменных окружения без шифрования может представлять угрозу безопасности. Используйте секреты и конфигурационные файлы для хранения конфиденциальной информации.

## Запуск
```bash
docker build -f Dockerfile_bad -t jupyter_bad . && docker run -p 8888:8888 -it jupyter_bad
```
```bash
docker build -f Dockerfile_good -t jupyter_good . && docker run -p 8888:8888 -it jupyter_good
```
