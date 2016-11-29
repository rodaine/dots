# Homebrew casks cannot redirect from an insecure URL
export HOMEBREW_NO_INSECURE_REDIRECT=1

# Homebrew casks must include a SHA to verify correctness
export HOMEBREW_CASK_OPTS=--require-sha

# Opt-out of Homebrew analytics events
export HOMEBREW_NO_ANALYTICS=1
