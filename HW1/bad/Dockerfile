# Используем более "жирный" образ Jupyter
FROM jupyter/scipy-notebook:latest

USER root
# Разделение команд в отдельные слои
RUN apt update && \
    apt -y install python3-dev git vim nano
RUN apt update
RUN apt -y install python3-pip
RUN pip install --upgrade pip 
RUN pip install jupyterhub

USER jovyan
# Копируем все файлы из проекта в рабочую директорию
COPY . /home/jovyan/jupyter

# Устанавливаем рабочую директорию
WORKDIR /home/jovyan/jupyter

# Запускаем JupyterHub с нужным уровнем логирования
ENTRYPOINT ["jupyterhub", "--log-level=DEBUG"]
