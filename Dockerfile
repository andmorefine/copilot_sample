FROM golang:1.13-alpine3.12 as build

ENV GOPATH /go
ENV GO111MODULE=on

RUN apk add --update --no-cache git

COPY . /go/src
WORKDIR /go/src

RUN go get github.com/pilu/fresh

RUN go build -o golang-app .

FROM alpine:3.12

# CMD ["fresh"]
COPY --from=build /go/src/golang-app /app/golang-app

EXPOSE 80

CMD /app/golang-app
