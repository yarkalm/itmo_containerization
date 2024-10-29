# Используем более большой "жирный" образ
FROM jupyter/datascience-notebook:latest

USER root

# Разделение команд на отдельные слои
RUN apt-get update && apt-get install -y \
    git \
    vim
RUN rm -rf /var/lib/apt/lists/*
RUN pip install numpy pandas matplotlib scikit-learn

USER jovyan
# Копируем все файлы из проекта в рабочую директорию контейнера
COPY . /home/jovyan/work

# Устанавливаем рабочую директорию
WORKDIR /home/jovyan/work

# Запускаем Jupyter Notebook
CMD ["start-notebook.sh", "--NotebookApp.token=''"]
