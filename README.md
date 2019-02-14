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

## License

MIT License

Copyright (c) 2019 **Age Mooij**

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
