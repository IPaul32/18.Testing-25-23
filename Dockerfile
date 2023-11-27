FROM python:3.9 as builder
LABEL MAINTAINER="marchik32@gmail.com"

WORKDIR /python-game

COPY app/ .

RUN useradd -ms /bin/bash gumcol

RUN chown -R gumcol:gumcol /python-game

USER gumcol

FROM python:3.9
LABEL MAINTAINER="marchik32@gmail.com"

WORKDIR /python-game

COPY --from=builder --chown=gumcol:gumcol /python-game /python-game

USER gumcol

CMD ["python", "/python-game/app.py"]
