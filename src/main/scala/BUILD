load("@io_bazel_rules_scala//scala:scala.bzl", "scala_binary", "scala_library",)

scala_library(
    name = "scala",
    visibility = ["//visibility:public"],
    srcs=glob(["**/*.scala"]),
)

scala_binary(
    name = "echo",
    deps = [
        ":scala",
    ],
    visibility = ["//visibility:public"],
    main_class = "Echo",
)
