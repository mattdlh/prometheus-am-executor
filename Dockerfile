FROM golang:alpine as build

WORKDIR /build
COPY . .
RUN go build -o /go/bin/prometheus-am-executor

FROM alpine
WORKDIR /
COPY --from=build /go/bin/prometheus-am-executor .
ENTRYPOINT ["/prometheus-am-executor"]
