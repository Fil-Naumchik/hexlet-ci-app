setup: install build

install:
	npm install

build:
	npm run build

start:
	npm start

test:
	@echo "Running tests..."
	@if [ -f node_modules/.bin/jest ]; then \
		JWT_SECRET=secret ./node_modules/.bin/jest --forceExit --detectOpenHandles; \
	else \
		echo "Jest not found, installing..."; \
		npm install --no-save jest supertest; \
		JWT_SECRET=secret npx jest --forceExit --detectOpenHandles; \
	fi

lint:
	@echo "Running ESLint..."
	@if [ ! -f node_modules/.bin/eslint ]; then \
		echo "ESLint not found, installing..."; \
		npm install --no-save eslint@8.x eslint-config-airbnb-base eslint-plugin-import; \
	fi
	./node_modules/.bin/eslint . --ext .js,.jsx,.ts,.tsx

.PHONY: build
