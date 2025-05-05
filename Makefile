################################################################################

include .env

environment := 'devl'
app_name := 'firestarter'

################################################################################

.PHONY: publish
publish: ## Publish a release to PyPI.
	@echo "🚀 Publishing: Dry run..."
	@uvx --from build pyproject-build --installer uv
	@echo "🚀 Publishing..."
	@uvx twine upload --repository-url https://upload.pypi.org/legacy/ dist/*

################################################################################

.PHONY: test
test: ## Test the code with pytest
	@echo "🚀 Testing code: Running pytest"
	@uv run python -m pytest --cov --cov-config=pyproject.toml --cov-report=xml

.PHONY: build-wheel
build-wheel: clean-build ## Build wheel file
	@echo "🚀 Creating wheel file"
	@uvx --from build pyproject-build --installer uv

.PHONY: clean-build
clean-build: ## Clean up any crap from previous builds
	@echo "🚀 Removing any crap from previous builds..."
	@uv run python -c "import shutil; import os; shutil.rmtree('dist') if os.path.exists('dist') else None"

.PHONY: build-and-publish
build-and-publish: build publish ## Build and publish.

.PHONY: docs-test
docs-test: ## Test if documentation can be built without warnings or errors
	@uv run mkdocs build -s

.PHONY: docs
docs: ## Build and serve the documentation
	@echo "🚀 Generating local PDF documentation"
	@pandoc --toc=true -o '/Volumes/SharedSpace/Users/jeff/Project Documentation/Active/TROLoad System Guide.pdf' 'docs/TROLoad System Guide.md'
	@pandoc --toc=true -o "/Volumes/SharedSpace/Users/jeff/Project Documentation/Active/TROLoad User's Guide.pdf" "docs/TROLoad User's Guide.md"
	@uv run mkdocs serve

.PHONY: dr-get-ip
dr-get-ip:
	@echo "🚀  Cionnecting to running docker container..."
	@docker inspect --format '{{ .NetworkSettings.IPAddress }}' jasmit/troloadtrans:latest

.PHONY: dr-status
dr-status:
	@echo "🚀  Checking the status of all docker containers..."
	@docker ps --all

.PHONY: dr-push-image
dr-push-image:
	docker push jasmit/troloadtrans:${app_version}

################################################################################

.PHONY: help
help:
	@uv run python -c "import re; \
	[[print(f'\033[36m{m[0]:<20}\033[0m {m[1]}') for m in re.findall(r'^([a-zA-Z_-]+):.*?## (.*)$$', open(makefile).read(), re.M)] for makefile in ('$(MAKEFILE_LIST)').strip().split()]"

.DEFAULT_GOAL := help
