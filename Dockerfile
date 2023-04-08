FROM texlive/texlive:latest-minimal

# Install procps for ps command (used by latexmk -pvc)
RUN apt-get update && apt-get -y install texlive-latex-base  \
    texlive-latex-extra latexmk procps

# These ids are the Linux defaults for the first user created
ARG USER_ID=1000
ARG GROUP_ID=1000
RUN groupadd -g ${GROUP_ID} tex && \
    useradd -u ${USER_ID} -g ${GROUP_ID} -ms /bin/bash tex

WORKDIR /home/tex/app

RUN mkdir -p target

COPY src/ ./src
COPY assets/ ./assets

RUN chown -R tex:tex /home/tex/app/target

USER tex

ENTRYPOINT ["latexmk", "-pdf", "-output-directory=target", "src/tp1.tex"]
