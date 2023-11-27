# Этап 1: Этап сборки
FROM python:3.9 as builder
LABEL MAINTAINER="marchik32@gmail.com"

WORKDIR /python-game

# Копируем код приложения
COPY app/ .

# Создаем не привилегированного пользователя
RUN useradd -ms /bin/bash gumcol

# Меняем владельца файлов приложения на не привилегированного пользователя
RUN chown -R gumcol:gumcol /python-game

# Переключаемся на пользователя без привилегий
USER gumcol

# Создаем entrypoint.sh
RUN echo -e "#!/bin/bash\npython /python-game/app.py" > entrypoint.sh && \
    chmod +x entrypoint.sh

# Этап 2: Финальный этап
FROM python:3.9
LABEL MAINTAINER="marchik32@gmail.com"

WORKDIR /python-game

# Копируем файлы из этапа сборки
COPY --from=builder --chown=gumcol:gumcol /python-game /python-game

# Копируем entrypoint.sh
COPY --from=builder /python-game/entrypoint.sh /usr/local/bin/entrypoint
RUN chmod +x /usr/local/bin/entrypoint

# Переключаемся на пользователя без привилегий
USER gumcol

# Команда входной точки
ENTRYPOINT ["/usr/local/bin/entrypoint"]
