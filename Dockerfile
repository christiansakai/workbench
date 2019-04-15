FROM alpine:3.9

MAINTAINER Christian Sakai

RUN apk add --update --no-cache \
      curl \
      wget \
      fzf \
      the_silver_searcher \
      tree \
      zsh \
      tmux \
      neovim \
      # Git
      git \
      git-lfs \
      # Python
      gcc \
      libc-dev \
      python3-dev \
      python3 \
      # JavaScript/TypeScript
      nodejs \
      npm

    # Oh-My-Zsh
RUN wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | /bin/zsh \
    && \
    # Vim-Plug
    curl -fLo /root/.local/share/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
    && \
    # For Neovim's Deoplete
    pip3 install --user pynvim \
    && \
    # For JS/TS 
    npm install -g \
      typescript \
      tern \
      neovim \
      eslint \
      prettier \
      eslint-plugin-prettier \
      eslint-config-prettier \
      @typescript-eslint/parser \
      @typescript-eslint/eslint-plugin

    # Neovim config
RUN mkdir -p /root/.config/nvim \
    && \
    # Volume for Projects
    mkdir /root/projects

COPY .gitignore /root/.gitignore
COPY .gitconfig /root/.gitconfig
COPY .eslintrc /root/.eslintrc
COPY .zshrc /root/.zshrc
COPY .tmux.conf /root/.tmux.conf
COPY tat /bin/tat
COPY init.vim /root/.config/nvim/init.vim

RUN /usr/bin/nvim +PlugInstall +qall

WORKDIR /root

ENTRYPOINT ["/bin/zsh"]
