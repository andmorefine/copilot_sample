build:
    GOARCH=amd64 GOOS=linux go build -o golang-app
.PHONY: build

test:
    go test ./...
.PHONY: test

clean:
    rm -rf golang-app
.PHONY: clean
