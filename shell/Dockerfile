FROM tcl2020/developer-mode:latest

RUN touch /.tcl2020-build-core-8-6-branch-merge-20190206

RUN cd /root && \
    git clone https://github.com/TCL-2020/dockerfiles.git && \
    mkdir /workspace && \
    cp -r dockerfiles/developer-mode/builds /builds && \
    cd /tmp && bash /builds/build-all.sh && \
    cp /workspace/tcl/unix/tclsh /bin

RUN echo "package require tclreadline" >/root/.tclshrc && \
    echo "namespace eval tclreadline { proc prompt1 {} { return {tcl> } } }" >>/root/.tclshrc && \
    echo "::tclreadline::Loop" >>/root/.tclshrc

CMD ["/bin/tclsh"] 
