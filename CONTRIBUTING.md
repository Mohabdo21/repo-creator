# Contribution Guidelines

## How to Contribute
1. **Fork** the repository
2. **Clone** your fork locally
```bash
git clone https://github.com/Mohabdo21/repo-creator.git
```
3. Create a **feature branch**:
```bash
git checkout -b feature/your-feature
```
4. Follow our coding standards:
   - Use ShellCheck-validated bash syntax
   - Include detailed comments
   - Maintain consistent indentation (2 spaces)
5. **Test** your changes:
```bash
./create_repo.sh -v --hook test_hook.sh
```
6. Submit a **Pull Request** with:
   - Description of changes
   - Testing evidence
   - Related issue number (if applicable)

## Issue Reporting
- Check existing issues before creating new ones
- Use clear, descriptive titles
- Include:
  ```markdown
  - OS Version
  - Script Version
  - Error Output
  - Reproduction Steps
  ```

## Code Review Process
- PRs will be reviewed within 48 hours
- Must pass CI checks:
  - ShellCheck validation
  - Integration tests
- Maintainers may request:
  - Additional tests
  - Documentation updates
  - Code optimizations

## Documentation Standards
- Update README.md for new features
- Keep comments in sync with code
- Use Markdown linting (MD013, MD040)

## License
By contributing, you agree to license your work under the [MIT License](LICENSE)
