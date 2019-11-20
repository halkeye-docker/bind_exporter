FROM golang as builder

RUN go get github.com/digitalocean/bind_exporter
WORKDIR /go/src/github.com/digitalocean/bind_exporter
RUN make

FROM scratch
COPY --from=builder /go/src/github.com/digitalocean/bind_exporter/bind_exporter /bin/bind_exporter
ENTRYPOINT ["/bin/bind_exporter"]
