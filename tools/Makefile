VERSION=0.1
PACKAGE=croit-bench

BUILD ?= ${PACKAGE}-${VERSION}

.PHONY: all
all:
	@echo usage: build, clean, check

.PHONY: build
build:
	pp --output=${BUILD} croit-bench --log=${BUILD}.log --compress=9 --verbose

.PHONY: clean
clean:
	rm -f ${BUILD} ${BUILD}.log

.PHONY: check
check:
	perl -I${INCLUDE_DIR} -Mstrict -Mdiagnostics -cw croit-bench
