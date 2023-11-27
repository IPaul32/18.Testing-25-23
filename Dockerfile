FROM python:3.9 as builder

LABEL MAINTAINER="marchik32@gmail.com"

WORKDIR /python-game

COPY app/app.py .

RUN echo -e "#!/bin/bash\npython /python-game/app.py" > /python-game/entrypoint.sh && \
    chmod +x /python-game/entrypoint.sh

FROM python:3.9-slim

WORKDIR /python-game

RUN useradd -ms /bin/bash test

COPY --from=builder /python-game/entrypoint.sh /usr/local/bin/entrypoint

ENTRYPOINT ["py-game"]

USER gumcol
