FROM golang:1.19.0-alpine
RUN go install github.com/cloudevents/conformance/cmd/cloudevents@latest

ENTRYPOINT [ "./bin/cloudevents", "listen" ]
