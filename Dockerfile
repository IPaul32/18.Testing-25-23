FROM python:3.9 as builder

LABEL MAINTAINER="marchik32@gmail.com"

WORKDIR /python-game

COPY app/app.py .

RUN echo -e "#!/bin/bash\npython /python-game/app.py" > entrypoint.sh && \
    chmod +x entrypoint.sh

FROM python:3.9

WORKDIR /python-game

COPY --from=builder --chown=gumcol:gumcol /python-game/entrypoint.sh /usr/local/bin/entrypoint

RUN chmod +x /usr/local/bin/entrypoint

ENTRYPOINT ["entrypoint"]

USER gumcol
