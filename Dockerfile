# Dockerfile for binder
FROM registry.gitlab.com/sagemath/sage/sagemath:9.0.beta0-py3
COPY --chown=sage:sage . ${HOME}

RUN sudo apt-get install graphviz
RUN sage -pip install RISE
RUN sage -pip install dot2tex
RUN sage -pip install sage_combinat_widgets
RUN sage -pip install sage-explorer
RUN sage -pip install git+https://github.com/nthiery/sage-gap-semantic-interface
RUN sage -pip install git+https://github.com/nthiery/sage-gap-semantic-interface
RUN sage -pip install git+https://github.com/nthiery/sage-semigroups/
