BREW_BUNDLE_FILE = infra/Brewfile

PIP_REQUIREMENTS_FILE = infra/requirements.txt

PRE_COMMIT_CONFIG = infra/pre-commit-config.yaml

PROJECT_NAME = CoreKit
PROJECT_IS_PACKAGE = true
XCODE_IDE_TEMPLATE_MACROS_PATH = infra/templates/xcode/IDETemplateMacros.plist
XCODE_PROJECT_SHARED_DATA_PATH = $(PROJECT_NAME)/$(PROJECT_NAME).xcodeproj/project.xcworkspace/xcshareddata/

.PHONY: all

all:
	@echo "🚀 Setting up $(PROJECT_NAME) project"
	@make install-brew-bundle
	@make install-pip-tools
	@make install-hooks
	@make install-xcode-templates

install-brew-bundle:
	@which brew > /dev/null || { echo "❌ Homebrew is not installed. Please install Homebrew first."; exit 1; }
	@echo "⏳ Installing brew bundle"
	@brew bundle install --file=$(BREW_BUNDLE_FILE) || \
		{ echo "❌ Error installing brew bundle"; exit 1; }
	@echo "✅ Brew bundle installed"

install-pip-tools:
	@echo "⏳ Installing pip-tools"
	@python3 -m pip install --quiet -r $(PIP_REQUIREMENTS_FILE) || \
		{ echo "❌ Error installing pip-tools"; exit 1; }
	@echo "✅ Pip-tools installed"

install-hooks:
	@echo "⏳ Installing pre-commit hooks"
	@pre-commit install --config $(PRE_COMMIT_CONFIG) --overwrite || \
		{ echo "❌ Error installing pre-commit hooks"; exit 1; }
	@pre-commit install --config $(PRE_COMMIT_CONFIG) --hook-type commit-msg --overwrite || \
		{ echo "❌ Error installing commit-msg hooks"; exit 1; }
	@echo "✅ Pre-commit hooks installed"

install-xcode-templates:
ifeq ($(PROJECT_IS_PACKAGE), true)
	@echo "✅ Project is a package, no need to install Xcode templates"
else
	@echo "⏳ Installing Xcode templates"
	@cp $(XCODE_IDE_TEMPLATE_MACROS_PATH) $(XCODE_PROJECT_SHARED_DATA_PATH) || \
		{ echo "❌ Error installing Xcode file template"; exit 1; }
	@echo "✅ Xcode templates installed"
endif
