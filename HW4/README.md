# ЛР 4. More Kubernetes

## Задача
Развернуть свой собственный сервис в Kubernetes, по аналогии с ЛР 3

## Описание
Можно использовать Minikube из ЛР 3. Нужно развернуть сервис в связке из минимум 2 контейнеров + 1 init, по
аналогии с ЛР 2.
Требования:
- минимум два Deployment , по количеству сервисов
- кастомный образ для минимум одного Deployment (т.е. не публичный и собранный из своего Dockerfile)
- минимум один Deployment должен содержать в себе контейнер и инит-контейнер
- минимум один Deployment должен содержать volume (любой)
- обязательно использование ConfigMap и/или Secret
- обязательно Service хотя бы для одного из сервисов (что логично, если они работают в связке)
- Liveness и/или Readiness пробы минимум в одном из Deployment
- обязательно использование лейблов (помимо обязательных selector/matchLabel , конечно)


## Запуск
Запустить `entrypoint.bat` 
## Описание работы
1. Создадим кастомный `docker image` для `jupyter` с помощью команды
    ```cmd
    docker build -t app/init_image:latest .
    ```
2. Запуск `minikube`
    ```cmd
    minikube start
    ```
    В отдельном окне запустим `dashboard`
    ```cmd
    minikube dashboard --url
    ```
3. Для того, чтобы использовать наш локальный `docker image` в `kubernetes` загрузим его в `minikube`
    ```cmd
    minikube image load app/init_image:latest
    ```
4. Запустим все манифесты (их порядок пронумерован для правильного запуска)
    ```cmd
    kubectl apply -f .
    ```
5. Запуск сервиса `Jupyter`
   ```cmd
   minikube service app-service
   ```
## Скриншоты
Пункт 1 и 2:
![image](https://github.com/user-attachments/assets/14af29a3-e048-44b5-8cb5-8ac79e6d914e)
Пункт 3 и 4:
![image](https://github.com/user-attachments/assets/3ca0b603-5eb4-4a15-9ef8-3a6da33bf27c)
Пункт 5:
![image](https://github.com/user-attachments/assets/33220be9-8237-470e-88bd-093c19cde70c)


Kubernetes Dashboard:
![image](https://github.com/user-attachments/assets/adb19f15-6ba0-4bdb-826b-d82223f2eb26)
![image](https://github.com/user-attachments/assets/b9ccdbca-f458-4d6d-85ec-3fe80a6d3c6f)
![image](https://github.com/user-attachments/assets/d00aeac4-64c7-458e-a172-db7f44b517cb)
![image](https://github.com/user-attachments/assets/c46fd6a2-cec0-41e4-984c-9cdf28a583ea)




