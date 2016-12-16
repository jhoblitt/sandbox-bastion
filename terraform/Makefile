UNAME := $(shell uname -s | tr A-Z a-z)
BIN_DIR=./bin
PRODUCT=terraform
VERSION=0.8.1
ZIP_FILE=$(PRODUCT)_$(VERSION)_$(UNAME)_amd64.zip

all: $(BIN_DIR) validate id_rsa id_rsa.pub

$(BIN_DIR):
	mkdir $@
	cd $@; wget -nc https://releases.hashicorp.com/$(PRODUCT)/$(VERSION)/$(ZIP_FILE)
	cd $@; unzip $(ZIP_FILE)

tf := $(wildcard *.tf)

fmt:
	$(foreach src, $(tf), $(BIN_DIR)/terraform fmt $(src);)

validate:
	$(BIN_DIR)/terraform validate

id_rsa id_rsa.pub:
	ssh-keygen -t rsa -b 2048 -C terraform -N "" -f id_rsa

clean:
	-rm -rf bin .terraform
