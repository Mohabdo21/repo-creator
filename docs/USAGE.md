# Script Usage Documentation
```text
Usage:
  ./create_repo.sh [OPTIONS]

Options:
  -p               Create as private repository
  -m MESSAGE       Custom initial commit message
  -b BRANCH        Custom branch name (default: main)
  -v               Verbose output mode
  -h / --help      Show this help message
  --no-readme      Skip README.md creation/modification
  --hook FILE      Post-creation hook script to execute

Examples:
  # Create private repo with custom message
  ./create_repo.sh -p -m "Project initialization"

  # Create repo with custom branch and hook
  ./create_repo.sh -b develop --hook post_create.sh
```
