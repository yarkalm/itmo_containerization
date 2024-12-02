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

3. Проверим, что всё успешно создалось в помощью `kubectl get тип_ресурса`
   ![image](https://github.com/user-attachments/assets/c45d82dc-1697-4051-b0d9-9696490d0e50)
