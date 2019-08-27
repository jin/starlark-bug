## Pre-reqs ##
bazel installed on machine

## Works ##
`bazel run //src/main/scala:echo -- hello world`

## Fails ##
Both of the following fail
- `bazel build //...`
- `bazel run test_echo`

```
ERROR: .../src/main/scala/BUILD:3:1: scala //src/main/scala:scala failed (Exit 1)
src/main/scala/Echo.scala:13: error: value mkString is not a member of java.util.stream.Stream[String]
       case (arg, index) => s"\t$index: '${arg.lines.mkString("\\n")}'"
                                                     ^
one error found
one error found
java.lang.RuntimeException: Build failed
	at io.bazel.rulesscala.scalac.ScalacProcessor.compileScalaSources(ScalacProcessor.java:244)
	at io.bazel.rulesscala.scalac.ScalacProcessor.processRequest(ScalacProcessor.java:69)
	at io.bazel.rulesscala.worker.GenericWorker.runPersistentWorker(GenericWorker.java:45)
	at io.bazel.rulesscala.worker.GenericWorker.run(GenericWorker.java:111)
	at io.bazel.rulesscala.scalac.ScalaCInvoker.main(ScalaCInvoker.java:41)
Target //:test_echo failed to build
```

## "Fix" ##
To get a working version of the bazel rule, remove the usage of the problematic
Seq.mkString call from scala
1. Flip from `failingVerboseDescription` to
   `workingVerboseDescription` in `src/main/scala/Echo.scala`
2. `bazel run test_echo`
