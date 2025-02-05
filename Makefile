SHELL := /bin/bash

# Makefile

.PHONY: install build deploy dd

install:
	@echo "Installing dependencies..."
	forge install

build:
	@echo "Building project..."
	forge build

deploy: install build
	@echo "Deploying contract..."
	forge script script/DeployMarket.s.sol --rpc-url=$(BUILDBEAR_RPC_URL) --broadcast --mnemonics="$(MNEMONIC)" --legacy --slow

exe: install build deploy
	@echo "All commands executed successfully"


	

