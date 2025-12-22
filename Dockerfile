FROM alpine:3.23.2
RUN apk add --no-cache novnc websockify
RUN cp /usr/share/novnc/vnc.html /usr/share/novnc/index.html
USER nobody
ENTRYPOINT ["websockify", "--web", "/usr/share/novnc"]
