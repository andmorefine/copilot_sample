FROM golang:1.14.4 as build
FROM alpine:latest

RUN apk add --update --no-cache git go

COPY . /go/src
WORKDIR /go/src

ENV GO111MODULE=on

RUN go mod download
RUN go get github.com/pilu/fresh

RUN go build -o copilot-app .

RUN mkdir /app
WORKDIR /app
COPY --from=build /go/src /app

# CMD ["fresh"]

CMD ["/app/copilot-app"]
