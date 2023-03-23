FROM python:3.11-slim as build
ENV workdir=/src
RUN mkdir -p $workdir
WORKDIR $workdir
RUN apt-get update
RUN apt-get install -y openssl ca-certificates libffi-dev build-essential libssl-dev git rustc cargo
RUN python3 -m pip install numpy
RUN apt-get remove --purge -y libffi-dev build-essential libssl-dev git rustc cargo
RUN rm -rf /root/.cargo
ADD https://github.com/novnc/websockify/archive/refs/tags/v0.11.0.tar.gz websockify.tar.gz
RUN python3 -m pip install websockify.tar.gz
ADD https://github.com/novnc/noVNC/archive/refs/tags/v1.4.0.tar.gz novnc.tar.gz
RUN mkdir /usr/local/share/novnc
RUN tar xvzmf novnc.tar.gz --strip-components 1 -C /usr/local/share/novnc
RUN cp /usr/local/share/novnc/vnc.html /usr/local/share/novnc/index.html

FROM python:3.11-slim

COPY --from=build /lib /lib
COPY --from=build /usr/local /usr/local

USER nobody

ENTRYPOINT ["websockify", "--web", "/usr/local/share/novnc"]
