# Dockerfile for binder
FROM registry.gitlab.com/sagemath/sage/sagemath-dev:9.0.beta3-py3

RUN sudo apt-get update && sudo apt-get -qy install graphviz build-essential git && sudo apt-get clean
RUN sage -i gap_packages
RUN sage -pip install RISE
RUN sage -pip install dot2tex
RUN sage -pip install sage_combinat_widgets
RUN sage -pip install sage-explorer
RUN sage -pip install git+https://github.com/nthiery/sage-gap-semantic-interface
RUN sage -pip install git+https://github.com/nthiery/sage-gap-semantic-interface
RUN sage -pip install git+https://github.com/nthiery/sage-semigroups/

# Ensure this COPY goes *after* installation of prerequisites; otherwise the
# build cache will be invalidated any time we change a file in this repository.
COPY --chown=sage:sage . ${HOME}
