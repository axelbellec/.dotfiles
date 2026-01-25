# Work-related configuration (Synapse Medicine)
# Go, Kubernetes, SOPS, VPN, and work tools

# Go environment (via asdf)
export GOPATH="$(asdf where golang)/packages"
export GOROOT="$(asdf where golang)/go"
export PATH="${PATH}:${GOROOT}/bin:${GOPATH}/bin"

# Kubernetes
alias k=kubectl
compdef __start_kubectl k
alias kx=kubectx
compdef __start_kubectx kx

# Krew (kubectl plugin manager)
export PATH="${PATH}:${HOME}/.krew/bin"

# SOPS (secrets management)
export SOPS_AGE_KEY_FILE="$HOME/Library/Application Support/sops/age.txt"

# GNU sed (replace macOS default)
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"

# MySQL client
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

# Custom binaries
export PATH="$PATH:$HOME/.my-binaries"

# VPN auto-connect (silent)
vpn connect > /dev/null 2>&1
