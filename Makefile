build:
    GOARCH=amd64 GOOS=linux go build -o copilot-app
.PHONY: build

test:
    go test ./...
.PHONY: test

clean:
    rm -rf copilot-app
.PHONY: clean
