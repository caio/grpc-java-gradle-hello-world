# Java gRPC Hello World using Gradle

This code is pretty much gRPC's java hello world example, but on
a separate repository and a bit opinionated on generated code placement.

## Project Status

I don't have much of a reason to keep this up-to-date and have been doing
so in an ad-hoc manner. Feel free to open issues and/or pull-requests and
I will jump on it as soon as I can, just don't expect this repository
to be always up-to-date and following the best practices of the month.

## Contents

* Java 1.8
* Gradle 4.8
* gRPC-java 1.12.0


### Gradle Plugins

The following plugins are already setup (in `build.gradle`):

* [protobuf-gradle-plugin](https://github.com/google/protobuf-gradle-plugin)
* [gradle-versions-plugin](https://github.com/ben-manes/gradle-versions-plugin)
* [IDEA plugin](https://docs.gradle.org/current/userguide/idea_plugin.html)

## Quick start

**NOTE**: If you are behind a proxy, make sure you configure it by
editing `gradle.properties`.

* Rename the package

```
NEW_PACKAGE_NAME=my.company.and.project
./rename_package.bash $NEW_PACKAGE_NAME
```

(The `rename_package.bash` script is very hacky. It also relies on
gnu-sed, so if yours is not in your `PATH` variable you can manually set
it: `SED=gsed ./rename_package.bash my.new.package`)

* Generate code and the IntelliJ's IDEA configuration:

```sh
./gradlew build
./gradlew idea
```

* Import the project into IDEA

* Start the server:

```sh
./gradlew runServer
# In another terminal
./gradlew runClient
```

If you want, you can also generate execution scripts and whatnot:

```sh
./gradlew installDist
```

Then you'll have the server at
`./build/install/grpc-java-gradle-hello-world/bin/hello-world-server` and the client at
`./build/install/grpc-java-gradle-hello-world/bin/hello-world-client`.

## Generating code

A simple `./gradlew build` will generate all code derived from the `*.proto`
files and if using IDEA the same will happen and source sets will be properly
configured (meaning that the IDE will automatically know about the generated
files). If for whatever reason you need to generate code but don't want to
call the `build` task, you can issue the following:

```sh
./gradlew generateProto
```

## Updating dependencies

This project has the [gradle-versions](https://github.com/ben-manes/gradle-versions-plugin)
plugin set up, so if you want to check for updates you can run:

```sh
./gradlew dependencyUpdates -Drevision=release
```

And then update `build.gradle` with the new versions accordingly.
