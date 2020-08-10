FROM golang:1.14.7-alpine3.12 as builder

ENV GO111MODULE=on

COPY . /go/src
WORKDIR /go/src

RUN go build -o golang-app .

FROM alpine:3.12
COPY --from=builder /go/src/golang-app /app/golang-app

EXPOSE 80

CMD /app/golang-app
