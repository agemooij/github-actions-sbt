Simple Dockerfile for building sbt-based projects using Github Actions.

- Base image: openjdk:8-jdk-alpine
- Extra Alpine packages installed: bash, git
- Sbt version: 1.2.8
- Entrypoint: sbt

There is builtin support for resolving dependencies from a private Bintray repository by providing the following two [secrets](https://developer.github.com/actions/creating-workflows/storing-secrets/) to your Github project:

- `BINTRAY_USERNAME`
- `BINTRAY_PASSWORD`

The values of these secrets must be set in your repository's "Settings" tab, sub-section "Secrets"

Example usage in a Github workflow:

```
workflow "on push, build and test" {
  on = "push"
  resolves = ["build-and-test"]
}

action "build-and-test" {
  uses = "agemooij/github-actions-sbt@master"
  args = "test"
  secrets = ["BINTRAY_USERNAME", "BINTRAY_PASSWORD"]
  env = {
    SBT_OPTS = "-Xms512M -Xmx2048M -Xss2M -XX:MaxMetaspaceSize=1024M"
  }
}
```
