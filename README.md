## Java Version Switcher

---

Switches between java and maven versions for cmd/bash/zsh sessions.

![](https://img.shields.io/github/repo-size/cccaaannn/java-version-switcher?color=blue&style=for-the-badge) [![GitHub license](https://img.shields.io/github/license/cccaaannn/java-version-switcher?color=green&style=for-the-badge)](https://github.com/cccaaannn/java-version-switcher/blob/master/LICENSE) ![GitHub top language](https://img.shields.io/github/languages/top/cccaaannn/java-version-switcher?color=orange&style=for-the-badge) 


## Script setup
1. In addition to regular `JAVA_HOME` environment variable, different java versions has to be set as environment variables in order to script to work. See [Environment example](#Environment-example).
2. Environment variable naming should follow this convention `JAVA_HOME_<VERSION>`. 
    - Ex: JAVA_HOME_18
3. Using same naming convention, more `M2_HOME` variables can also be set for maven version switching `M2_HOME_<VERSION>`. 
    - Ex: M2_HOME_3.6
- For linux, script has to be run with `source` for new environment variables to be active on the session, you can create an alias for it `alias jvs="source jvs.sh"`
##
## Commands
- `-h`, `--help` Prints help message.
- `-a`, `--about` Shows about jvs.
- `-m <MAVEN_VERSION>`, `--maven <MAVEN_VERSION>` Used for switching maven version.
##
## Usage
- jvs <JAVA_VERSION>
- jvs <JAVA_VERSION> -m <MAVEN_VERSION>
##
## Examples
- jvs 11
- jvs 1.8 -m 3.6
- jvs 18 --maven 3.8

&nbsp;

## Environment example

1. Windows

    <img src="https://github.com/cccaaannn/readme_media/blob/master/media/java-version-switcher/images/environment_example.png?raw=true" alt="drawing" width="200"/>

2. Linux

    ```
    export JAVA_HOME=/home/<user>/.jdks/openjdk-23
    export JAVA_HOME_23=/home/<user>/.jdks/openjdk-23
    export JAVA_HOME_22=/home/<user>/.jdks/temurin-22.0.1
    export M2_HOME=/home/<user>/maven/apache-maven-3.9.8
    export M2_HOME_39=/home/<user>/maven/apache-maven-3.9.8
    export M2_HOME_36=/home/<user>/maven/apache-maven-3.6.0
    ```
