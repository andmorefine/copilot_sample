FROM golang:1.14.7-alpine3.12 as build

ENV GOPATH /go
ENV GO111MODULE=on

COPY . /go/src
WORKDIR /go/src

RUN go build -o golang-app .

COPY --from=build /go/src/golang-app /app/golang-app

EXPOSE 80

CMD ["/app/golang-app", "fresh"]
