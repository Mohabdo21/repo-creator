# GitHub Repository Automation Script 🚀

[![Shell Script Validation](https://img.shields.io/badge/Shell_Script-Validated-green.svg?logo=gnu-bash)](https://github.com/koalaman/shellcheck)
[![GitHub License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-Welcome-brightgreen.svg)](CONTRIBUTING.md)

A robust Bash script for automating GitHub repository creation with enterprise-grade features. Streamlines local/remote repo setup with enhanced security and customization options.

## Features ✨

- 🛡️ **Auto SSH/HTTPS Detection** - Smart remote URL configuration
- 🔄 **Existing Repo Handling** - Safe override confirmation
- 🧩 **Modular Architecture** - Easy maintenance and extension
- 🔧 **CLI Options**:
  - Private/public repository flag
  - Custom commit messages
  - Branch name customization
  - Post-creation hooks
- ✅ **Pre-flight Checks**:
  - GitHub CLI authentication
  - Valid repository naming
  - Dependency verification
- 📊 **Verbose Mode** - Detailed execution logging (`-v` flag)

## Installation ⚙️

### Requirements

- `bash` (v5.0+)
- `git` (v2.25+)
- [GitHub CLI](https://cli.github.com/) (v2.40+)

```bash
# Install GitHub CLI
# macOS
brew install gh

# Linux (Debian/Ubuntu)
sudo apt install gh

# Windows (WSL)
winget install --id GitHub.cli
```

### Setup

1. Authenticate GitHub CLI:

```bash
gh auth login
```

2. Clone repository:

```bash
git clone https://github.com/Mohabdo21/repo-creator.git
cd repo-creator
chmod +x create_repo.sh
```

## Usage 📖

### Basic Example

```bash
./create_repo.sh -p -m "Project initialization"
```

### Command Options

| Flag              | Description               | Example                |
| ----------------- | ------------------------- | ---------------------- |
| `-p`              | Create private repository | `-p`                   |
| `-m <message>`    | Custom commit message     | `-m "Initial setup"`   |
| `-b <branch>`     | Specify default branch    | `-b develop`           |
| `-v`              | Enable verbose output     | `-v`                   |
| `--no-readme`     | Skip README.md creation   | `--no-readme`          |
| `--hook <script>` | Post-creation hook script | `--hook post_setup.sh` |

### Advanced Scenarios

**1. Create Feature Branch Repo**

```bash
./create_repo.sh -b feature/new-auth -m "Auth system setup"
```

**2. Enterprise Workflow with Hooks**

```bash
# 1. Create repo
./create_repo.sh -p --hook enterprise_hook.sh

# 2. post-creation hook example (enterprise_hook.sh):
#!/bin/bash
echo "Configuring branch protections..."
gh api repos/$GH_USER/$REPO_NAME/branches/main/protection \
  --input - <<EOF
{
  "required_status_checks": null,
  "enforce_admins": true,
  "required_pull_request_reviews": {
    "dismiss_stale_reviews": true,
    "require_code_owner_reviews": true
  },
  "restrictions": null
}
EOF
```

## Technical Requirements 🖥️

### Dependency Matrix

| Component  | Minimum Version | Recommended Version |
| ---------- | --------------- | ------------------- |
| GitHub CLI | 2.30            | 2.40+               |
| Git        | 2.25            | 2.40+               |
| Bash       | 5.0             | 5.2+                |
| OpenSSL    | 1.1.1           | 3.0+                |

### Post-Creation Hooks

Create executable scripts to automate post-creation tasks:

```bash
#!/bin/bash
# Example hook: post_create.sh
gh secret set API_KEY -b"${API_KEY}"
gh workflow enable ci-cd.yml
```

## License 📄

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## Contributing 🤝

We welcome contributions! Please read our [Contribution Guidelines](CONTRIBUTING.md) before:
- Submitting PRs
- Reporting issues
- Suggesting enhancements

```bash
# Development Setup
git clone https://github.com/Mohabdo21/repo-creator.git
cd repo-creator
git checkout -b feature/your-feature
# Make changes and submit PR
```

---

> **Note**: This README was created using the very script it documents! 🎉
> `./create_repo.sh -m "Initialize repo-creator project" --hook docs_hook.sh`

## Usage Documentation

See [USAGE.md](docs/USAGE.md)
