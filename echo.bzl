
def _echo_impl(ctx):

    command = "%s %s" % (ctx.executable._echo_tool.short_path, " ".join(ctx.attr.custom_args))

    ctx.actions.write(
        output = ctx.outputs.executable,
        content = command,
        is_executable = True,
    )

    runfiles = ctx.runfiles(files = [ctx.executable._echo_tool])
    runfiles = runfiles.merge(ctx.attr._echo_tool[DefaultInfo].default_runfiles)

    return [
        DefaultInfo(
            executable = ctx.outputs.executable,
            runfiles = runfiles,
        ),
    ]

echo = rule(
    implementation = _echo_impl,
    attrs = {
        "custom_args": attr.string_list(
            mandatory = True,
        ),
        "_echo_tool": attr.label(
            default = Label("//src/main/scala:echo"),
            cfg = "host",
            executable = True,
            allow_files = True,
        ),
    },
    executable = True,
)
