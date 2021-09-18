FROM markhu53/dockernodejsphoenix:elixir1.7.4-phx1.4.0

RUN cd ~ && \
    git clone https://github.com/koudelka/visualixir.git && \
    cd ~/visualixir && \
    mix deps.get && mix compile && cd assets && npm install && \
    echo '#!/bin/sh' > ~/visualixir/run.sh && \
    echo "cd ~/visualixir && elixir --name visualixir@127.0.0.1 -S mix phx.server" >> ~/visualixir/run.sh && \
    chmod u+x ~/visualixir/run.sh

CMD ["sh","-c","~/visualixir/run.sh"]

WORKDIR /app
