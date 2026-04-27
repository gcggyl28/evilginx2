TARGET=evilginx
PACKAGES=core database log parser

.PHONY: all build clean install
all: build

build:
	@go build -o ./build/$(TARGET) -mod=vendor main.go

# install to ~/go/bin for easy access from PATH
install: build
	@mkdir -p $(HOME)/go/bin
	@cp ./build/$(TARGET) $(HOME)/go/bin/$(TARGET)
	@echo "Installed $(TARGET) to $(HOME)/go/bin/$(TARGET)"

clean:
	@go clean
	@rm -f ./build/$(TARGET)
	@rm -rf ./build/
