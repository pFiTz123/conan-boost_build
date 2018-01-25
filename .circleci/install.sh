#!/bin/bash

set -e
set -x

brew update || brew update
brew install cmake || true

if which pyenv > /dev/null; then
    eval "$(pyenv init -)"
fi

pyenv install 2.7.10
pyenv virtualenv 2.7.10 conan
pyenv rehash
pyenv activate conan

pip install conan --upgrade
pip install conan_package_tools bincrafters_package_tools
conan user
