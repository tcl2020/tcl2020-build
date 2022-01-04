FROM tcl-2020-dev:latest

LABEL org.opencontainers.image.source https://github.com/tcl2020/tcl2020-build

RUN touch /.tcl2020-build-core-8-6-branch

COPY developer-mode/builds /builds

RUN mkdir /workspaces && \
    cd /tmp && bash /builds/build-all.sh && \
    cp /workspaces/tcl/unix/tclsh /bin/

RUN echo "package require tclreadline" >/root/.tclshrc && \
    echo "namespace eval tclreadline { proc prompt1 {} { return {tcl> } } }" >>/root/.tclshrc && \
    echo "::tclreadline::Loop" >>/root/.tclshrc && \
    echo "set editing-mode vi" >/root/.inputrc

CMD ["/bin/tclsh"] 
