FROM golang:1.14.4 as build

LABEL maintainer "[golang app]"

ENV GOPATH /go

ENV GO111MODULE=on

RUN apk add --update --no-cache git

COPY . /go/src
WORKDIR /go/src

RUN go mod download

RUN go build -o golang-app .

FROM alpine:3.12

RUN go get github.com/pilu/fresh

RUN mkdir /app

WORKDIR /app
COPY --from=build /go/src/golang-app /app/golang-app

CMD ["/app/golang-app", "fresh"]
