FROM enpedasi/nodejs-phoenix:latest

RUN cd ~ && \
    git clone https://github.com/koudelka/visualixir.git && \
    cd ~/visualixir && \
    mix deps.get && mix compile && cd assets && npm install && \
    echo '#!/bin/sh' > ~/visualixir/run.sh && \
    echo "cd ~/visualixir && elixir --sname visualixir --hidden -S mix phx.server" >> ~/visualixir/run.sh && \
    chmod u+x ~/visualixir/run.sh

CMD ["sh","-c","~/visualixir/run.sh"]

WORKDIR /app
