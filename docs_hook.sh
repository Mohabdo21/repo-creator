#!/bin/bash
# Documentation Generation Hook
# Usage: ./create_repo.sh --hook docs_hook.sh

DOCS_DIR="docs"
SCRIPT_NAME="create_repo.sh"

generate_usage() {
	echo "# Script Usage Documentation" >"$DOCS_DIR/USAGE.md"
	echo "\`\`\`text" >>"$DOCS_DIR/USAGE.md"
	./create_repo.sh -h >>"$DOCS_DIR/USAGE.md"
	echo "\`\`\`" >>"$DOCS_DIR/USAGE.md"
}

update_readme() {
	if ! grep -q "## Usage Documentation" README.md; then
		echo -e "\n## Usage Documentation\nSee [USAGE.md](docs/USAGE.md)" >>README.md
	fi
}

main() {
	# Create documentation directory
	mkdir -p "$DOCS_DIR"

	# Generate usage documentation
	info_msg "Generating usage documentation..."
	generate_usage

	# Update README links
	info_msg "Updating README..."
	update_readme

	# Generate manual page
	if command -v help2man &>/dev/null; then
		info_msg "Generating man page..."
		help2man "./$SCRIPT_NAME" >"$DOCS_DIR/create_repo.1"
	else
		echo "Install help2man to generate man pages:"
		echo "sudo apt install help2man"
	fi

	success_msg "Documentation updated in $DOCS_DIR/"
}

main
