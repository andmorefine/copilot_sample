FROM golang:1.14.4
FROM alpine:latest

RUN apk add --update --no-cache git go

WORKDIR /go/src/app
COPY . .

ENV GO111MODULE=on

RUN go get -d -v ./...
RUN go install -v ./...
RUN go mod download
RUN go get github.com/pilu/fresh

RUN go build -o golang-app .

# CMD ["fresh"]

CMD /app/golang-app 80
