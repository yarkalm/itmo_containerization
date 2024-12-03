# ЛР 3. Kubernetes

## Задача
Установить Kubernetes на локальную машину (приведен пример для minikube на Windows 10/11). Развернуть
тестовый сервис

## Описание работы
### Установка minikube
 Проверим, что всё успешно установилосб командой `minikube version`
 ![image](https://github.com/user-attachments/assets/595767ce-e76e-483e-8f24-1906170cd9dc)
И затем запустим `minikube start`
![image](https://github.com/user-attachments/assets/ddb3a09c-dba5-4fae-918d-63ad7d881bdc)
Так же наблюдаем наш контейнер в `docker`
![image](https://github.com/user-attachments/assets/0b547e9f-1817-410a-b00b-c0f8c3aa61d5)

### Установка PostgreSQL
1. Переходим в директорию `cd postgres` и создаём все объекты в порядке `Secrets -> ConfigMap -> Deployment`. Для упрощения запуска все файлы пронумерованы и достаточно запустить команду `kubectl create –f .`
   ![image](https://github.com/user-attachments/assets/46d3bae8-5125-4745-aaf7-3d604a31c1e7)

2. Проверим, что всё успешно создалось в помощью `kubectl get тип_ресурса`
   ![image](https://github.com/user-attachments/assets/c45d82dc-1697-4051-b0d9-9696490d0e50)

### Nextcloud

1. Вернёмся в предыдущую директорию `cd ..`. Прогоним все манифесты командой `kubectl apply –f .`.
   ![image](https://github.com/user-attachments/assets/6cbd9554-d1e1-4529-a5c1-d63290279146)
2. Проверим состояние с помощью `kubectl logs ...`
   ![image](https://github.com/user-attachments/assets/d2b5e1ca-6253-4670-bc0a-c15c5a5f0d4a)
3. Выполним перенаправление портов `kubectl expose deployment nextcloud --type=NodePort --port=80`
   ![image](https://github.com/user-attachments/assets/69980bcb-693b-4b40-bd8b-35e805693adf)
4. Запустим туннелирование `minikube service nextcloud`
   ![image](https://github.com/user-attachments/assets/cf38e268-a966-4680-9909-b1de49f5b551)
5. Наблюдаем успешный запуск и радуемся
   ![image](https://github.com/user-attachments/assets/b54a386b-360b-48f3-924b-becb0e5af8bd)
  


## Ответы на вопросы:
1. Вопрос: важен ли порядок выполнения этих манифестов? Почему?
   - В Kubernetes порядок выполнения манифестов может быть важен в зависимости от того, как они используются и зависят друг от друга.
2. Вопрос: что (и почему) произойдет, если отскейлить количество реплик postgres-deployment в 0,
затем обратно в 1, после чего попробовать снова зайти на Nextcloud?
   - В нашем случае при отскейле реплик postgres-deployment в 0, то мы потеряем данные, которые хранились в postgres.
