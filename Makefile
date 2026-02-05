setup: install build

install:
	npm install

build:
	npm run build

start:
	npm start

test:
	npm test

lint:
	@echo "Running ESLint..."
	@if [ ! -f node_modules/.bin/eslint ]; then \
		echo "ESLint not found, installing..."; \
		npm install --no-save eslint@8.x eslint-config-airbnb-base eslint-plugin-import; \
	fi
	./node_modules/.bin/eslint . --ext .js,.jsx,.ts,.tsx

.PHONY: build
