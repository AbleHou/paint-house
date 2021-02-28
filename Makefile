# note: call scripts from /scripts

# project name
PROJECTNAME=$(shell basename "$(PWD)")

# project path
ROOT=$(shell pwd)

.PHONY: help
all: help
help: Makefile
	@echo
	@echo " Choose a command run in "$(PROJECTNAME)":"
	@echo
	@sed -n 's/^##//p' $< | column -t -s ':' |  sed -e 's/^/ /'
	@echo

## init-local: init local env
init-local:
	@./scripts/init_db_local.sh

## test: run all unit test
test:
	@echo '------initing test env'
	@./scripts/init_db_test.sh
	@echo ''
	@echo '------run all unit test'
	@go test -cover ./...

## run-local: run main.go with config locally
run-local:
	@echo
	@echo "------ run gin ------"
	@echo
	@go run ./cmd/main.go -conf ./configs