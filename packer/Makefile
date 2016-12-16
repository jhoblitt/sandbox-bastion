UNAME := $(shell uname -s | tr A-Z a-z)
BIN_DIR=./bin
PRODUCT=packer
VERSION=0.12.1
ZIP_FILE=$(PRODUCT)_$(VERSION)_$(UNAME)_amd64.zip

all: $(BIN_DIR)

$(BIN_DIR):
	mkdir $@
	cd $@; wget -nc https://releases.hashicorp.com/$(PRODUCT)/$(VERSION)/$(ZIP_FILE)
	cd $@; unzip $(ZIP_FILE)

fmt:
	$(foreach src, $(tf), $(BIN_DIR)/terraform fmt $(src);)

clean:
	-rm -rf bin
