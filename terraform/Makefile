UNAME := $(shell uname -s | tr A-Z a-z)
BIN_DIR=./bin
PRODUCT=terraform
VERSION=0.7.13
ZIP_FILE=$(PRODUCT)_$(VERSION)_$(UNAME)_amd64.zip

all: $(BIN_DIR) validate

$(BIN_DIR):
	mkdir $@
	cd $@; wget -nc https://releases.hashicorp.com/$(PRODUCT)/$(VERSION)/$(ZIP_FILE)
	cd $@; unzip $(ZIP_FILE)

tf := $(wildcard *.tf)

fmt:
	$(foreach src, $(tf), $(BIN_DIR)/terraform fmt $(src);)

validate:
	$(BIN_DIR)/terraform validate

clean:
	-rm -rf bin
