FROM golang:1.14.4 as build

ENV GOPATH /go
RUN apk add --update --no-cache git

COPY . /go/src
WORKDIR /go/src

RUN go build -o copilot-app .

ENV GO111MODULE=on

RUN go mod download
RUN go get github.com/pilu/fresh

FROM alpine:latest

RUN mkdir /app
WORKDIR /app
COPY --from=build /go/src/copilot-app /app/copilot-app

CMD ["/app/copilot-app", "fresh"]
