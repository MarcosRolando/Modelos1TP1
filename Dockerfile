FROM texlive/texlive:latest

RUN apt-get update && apt-get -y install latexmk

# These ids are the Linux defaults for the first user created
ARG USER_ID=1000
ARG GROUP_ID=1000
RUN groupadd -g ${GROUP_ID} compiler && \
    useradd -u ${USER_ID} -g ${GROUP_ID} -ms /bin/bash compiler

WORKDIR /home/compiler/app

RUN mkdir -p target

COPY tp1.tex fiuba.png ./

RUN chown -R compiler:compiler /home/compiler/app/target

USER compiler

CMD latexmk -pdf -output-directory=target tp1.tex
