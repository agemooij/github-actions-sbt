Simple dockerfile for building sbt-based projects using Github Actions.

- Base image: openjdk:8-jdk-alpine
- Sbt version: 1.2.8
- Entrypoint: sbt
- Extra Alpine packages installed: bash, git

There is builtin support for resolving dependencies from a private Bintray repository by provinding the following two [secrets](https://developer.github.com/actions/creating-workflows/storing-secrets/) in your Github project. The values of these secrets must be set in your repository's "Settings" tab, sub-section "Secrets":

- `BINTRAY_USERNAME`
- `BINTRAY_PASSWORD`
