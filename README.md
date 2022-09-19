## Java Version Switcher

---

Switches between java and maven versions for cmd sessions.

![](https://img.shields.io/github/repo-size/cccaaannn/java-version-switcher?color=blue&style=for-the-badge) [![GitHub license](https://img.shields.io/github/license/cccaaannn/java-version-switcher?color=green&style=for-the-badge)](https://github.com/cccaaannn/java-version-switcher/blob/master/LICENSE) ![GitHub top language](https://img.shields.io/github/languages/top/cccaaannn/java-version-switcher?color=orange&style=for-the-badge) 


## Script setup
1. In addition to regular `JAVA_HOME` environment variable, different java versions has to be set as environment variables in order to script to work. See [Environment example](#Environment-example).
2. Environment variable naming should follow this standard `JAVA_HOME_<VERSION>`. 
    - Ex: JAVA_HOME_18
3. Using same naming standard, more `M2_HOME` variables can also be set for maven version switching `M2_HOME_<VERSION>`. 
    - Ex: M2_HOME_3.6
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
<img src="https://github.com/cccaaannn/readme_media/blob/master/media/java-version-switcher/images/environment_example.png?raw=true" alt="drawing" width="200"/>

