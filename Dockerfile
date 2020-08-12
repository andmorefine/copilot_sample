FROM golang:1.14.7-alpine3.12 as builder

ENV GO111MODULE=on

COPY . /go/src
WORKDIR /go/src

# コンパイル
RUN go build -o golang-app .

# マルチステージビルド
FROM alpine:3.12
COPY --from=builder /go/src/golang-app /app/golang-app

# プログラム実行
CMD /app/golang-app

# 8080 ポートを解放
EXPOSE 80
