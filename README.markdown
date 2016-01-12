# Java gRPC Hello World using Gradle

So, it's the first time I'm using `gradle`. And the first time I'm using
`grpc`. And the first time I'm really using `IntelliJ's IDEA`. Took me
a while to get this set up working nicely so I decided to save it for
posterity.

This code is pretty much gRPC's java hello world example, but on
a separate repository and a bit opinionated on generated code placement.

Quick start:

**NOTE**: If you are behind a proxy, make sure you configure it by
editing `gradle.properties`.

1. Generate code and the `IDEA` configuration:

```sh
./gradlew build
./gradlew idea
```

2. Import the project into `IDEA` (or just use whatever you prefer,
   actually)

3. Start the server:

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

