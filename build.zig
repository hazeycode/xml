const std = @import("std");

pub fn build(b: *std.build.Builder) void {
    const target = b.standardTargetOptions(.{});
    const mode = b.standardOptimizeOption(.{});

    const lib = b.addStaticLibrary(.{
        .name = "xml",
        .root_source_file = .{ .path = "Xml.zig" },
        .target = target,
        .optimize = mode,
    });
    lib.install();

    const main_tests = b.addTest(.{
        .root_source_file = .{ .path = "Xml.zig" },
        .optimize = mode,
    });

    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&main_tests.step);
}
