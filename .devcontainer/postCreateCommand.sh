#!/usr/bin/env sh

# Install tools
curl -sLS https://get.arkade.dev | sudo sh
arkade get kind
arkade get kubectl
arkade get helm
arkade get gh
echo "export PATH=\$PATH:/home/vscode/.arkade/bin" >> $HOME/.bashrc

# Compile idpbuilder
echo "Compiling idpbuilder"
export PATH=$PATH:/usr/local/go/bin
git clone --depth 1 https://github.com/cnoe-io/idpbuilder && cd idpbuilder && make build
# Add idpbuilder to PATH
echo "export PATH=\$PATH://workspaces/cnoe-examples/idpbuilder" >> $HOME/.bashrc
