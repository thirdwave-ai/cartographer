# Copyright 2018 The Cartographer Authors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

"""External dependencies for Cartographer."""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

def cartographer_repositories():
    _maybe(
        http_archive,
        name = "com_github_nelhage_rules_boost",
        sha256 = "371f49e7b29e44a718baf8b9a2dd3eca865005a851c9ecf8fb6a10a715aa58dd",
        strip_prefix = "rules_boost-a5a95642f6097f8949020646ffe89d7243008981",
        urls = [
            "https://mirror.bazel.build/github.com/nelhage/rules_boost/archive/a5a95642f6097f8949020646ffe89d7243008981.tar.gz",
            "https://github.com/nelhage/rules_boost/archive/a5a95642f6097f8949020646ffe89d7243008981.tar.gz",
        ],
    )

    _maybe(
        http_archive,
        name = "com_github_antonovvk_bazel_rules",
        sha256 = "ba75b07d3fd297375a6688e9a16583eb616e7a74b3d5e8791e7a222cf36ab26e",
        strip_prefix = "bazel_rules-98ddd7e4f7c63ea0868f08bcc228463dac2f9f12",
        urls = [
            "https://mirror.bazel.build/github.com/antonovvk/bazel_rules/archive/98ddd7e4f7c63ea0868f08bcc228463dac2f9f12.tar.gz",
            "https://github.com/antonovvk/bazel_rules/archive/98ddd7e4f7c63ea0868f08bcc228463dac2f9f12.tar.gz",
        ],
    )

    _maybe(
        git_repository,
        name = "com_github_gflags_gflags",
        commit = "e292e0452fcfd5a8ae055b59052fc041cbab4abf",
        remote = "https://github.com/gflags/gflags.git",
    )

    _maybe(
        http_archive,
        name = "com_google_glog",
        sha256 = "dfc074b41a5b86fc5dda4f0e2e2d6cc5b21f798c9fcc8ed5fea9c8f7c4613be6",
        strip_prefix = "glog-dd2b93d761a19860190cb3fa92066c8031e912e3",
        urls = [
            "https://mirror.bazel.build/github.com/google/glog/archive/dd2b93d761a19860190cb3fa92066c8031e912e3.tar.gz",
            "https://github.com/google/glog/archive/dd2b93d761a19860190cb3fa92066c8031e912e3.tar.gz",
        ],
    )

    _maybe(
        http_archive,
        name = "net_zlib_zlib",
        sha256 = "6d4d6640ca3121620995ee255945161821218752b551a1a180f4215f7d124d45",
        build_file = "@com_github_thirdwave_ai_cartographer//bazel/third_party:zlib.BUILD",
        strip_prefix = "zlib-cacf7f1d4e3d44d871b605da3b647f07d718623f",
        urls = [
            "https://mirror.bazel.build/github.com/madler/zlib/archive/cacf7f1d4e3d44d871b605da3b647f07d718623f.tar.gz",
            "https://github.com/madler/zlib/archive/cacf7f1d4e3d44d871b605da3b647f07d718623f.tar.gz",
        ],
    )

    _maybe(
        http_archive,
        name = "org_cairographics_pixman",
        build_file = "@com_github_thirdwave_ai_cartographer//bazel/third_party/pixman:pixman.BUILD",
        sha256 = "21b6b249b51c6800dc9553b65106e1e37d0e25df942c90531d4c3997aa20a88e",
        strip_prefix = "pixman-0.34.0",
        urls = [
            "https://mirror.bazel.build/www.cairographics.org/releases/pixman-0.34.0.tar.gz",
            "https://www.cairographics.org/releases/pixman-0.34.0.tar.gz",
        ],
    )

    _maybe(
        http_archive,
        name = "org_cairographics_cairo",
        build_file = "@com_github_thirdwave_ai_cartographer//bazel/third_party/cairo:cairo.BUILD",
        sha256 = "7e87878658f2c9951a14fc64114d4958c0e65ac47530b8ac3078b2ce41b66a09",
        strip_prefix = "cairo-1.14.10",
        urls = [
            "https://mirror.bazel.build/www.cairographics.org/releases/cairo-1.14.10.tar.xz",
            "https://www.cairographics.org/releases/cairo-1.14.10.tar.xz",
        ],
    )

    _maybe(
        http_archive,
        name = "org_freetype_freetype2",
        build_file = "@com_github_thirdwave_ai_cartographer//bazel/third_party:freetype2.BUILD",
        sha256 = "33a28fabac471891d0523033e99c0005b95e5618dc8ffa7fa47f9dadcacb1c9b",
        strip_prefix = "freetype-2.8",
        urls = [
            "https://mirror.bazel.build/download.savannah.gnu.org/releases/freetype/freetype-2.8.tar.gz",
            "http://download.savannah.gnu.org/releases/freetype/freetype-2.8.tar.gz",
        ],
    )

    _maybe(
        http_archive,
        name = "org_libgd_libgd",
        build_file = "@com_github_thirdwave_ai_cartographer//bazel/third_party:gd.BUILD",
        sha256 = "a66111c9b4a04e818e9e2a37d7ae8d4aae0939a100a36b0ffb52c706a09074b5",
        strip_prefix = "libgd-2.2.5",
        urls = [
            "https://mirror.bazel.build/github.com/libgd/libgd/releases/download/gd-2.2.5/libgd-2.2.5.tar.gz",
            "https://github.com/libgd/libgd/releases/download/gd-2.2.5/libgd-2.2.5.tar.gz",
        ],
    )

    _maybe(
        http_archive,
        name = "org_freedesktop_fontconfig",
        build_file = "@com_github_thirdwave_ai_cartographer//bazel/third_party/fontconfig:fontconfig.BUILD",
        sha256 = "fd5a6a663f4c4a00e196523902626654dd0c4a78686cbc6e472f338e50fdf806",
        strip_prefix = "fontconfig-2.12.4",
        urls = [
            "https://mirror.bazel.build/www.freedesktop.org/software/fontconfig/release/fontconfig-2.12.4.tar.gz",
            "https://www.freedesktop.org/software/fontconfig/release/fontconfig-2.12.4.tar.gz",
        ],
    )

    _maybe(
        http_archive,
        name = "org_ceres_solver_ceres_solver",
        build_file = "@com_github_thirdwave_ai_cartographer//bazel/third_party:ceres.BUILD",
        sha256 = "ede5b4205ee8d7c7e029e9da74c7ee759fee6961f7e6bfa694274e4a55b8c7ca",
        strip_prefix = "ceres-solver-58c5edae2f7c4d2533fe8a975c1f5f0b892dfd3e",
        urls = [
            "https://mirror.bazel.build/github.com/ceres-solver/ceres-solver/archive/58c5edae2f7c4d2533fe8a975c1f5f0b892dfd3e.tar.gz",
            "https://github.com/ceres-solver/ceres-solver/archive/58c5edae2f7c4d2533fe8a975c1f5f0b892dfd3e.tar.gz",
        ],
    )           
    
    _maybe(
        http_archive,
        name = "com_github_libexpat_libexpat",
        build_file = "@com_github_thirdwave_ai_cartographer//bazel/third_party:expat.BUILD",
        sha256 = "b5dcb503e40f615a0296a18acc6d975f2f1a3d01c7b3a4b3bb69de27bc9475c3",
        strip_prefix = "libexpat-R_2_2_4/expat",
        urls = [
            "https://mirror.bazel.build/github.com/libexpat/libexpat/archive/R_2_2_4.tar.gz",
            "https://github.com/libexpat/libexpat/archive/R_2_2_4.tar.gz",
        ],
    )

    _maybe(
        http_archive,
        name = "libjpeg",
        build_file = "@com_github_thirdwave_ai_cartographer//bazel/third_party:libjpeg.BUILD",
        sha256 = "240fd398da741669bf3c90366f58452ea59041cacc741a489b99f2f6a0bad052",
        strip_prefix = "jpeg-9b",
        urls = [
            "https://mirror.bazel.build/www.ijg.org/files/jpegsrc.v9b.tar.gz",
            "http://www.ijg.org/files/jpegsrc.v9b.tar.gz",
        ],
    )

    _maybe(
        http_archive,
        name = "org_libpng_libpng",
        build_file = "@com_github_thirdwave_ai_cartographer//bazel/third_party:libpng.BUILD",
        sha256 = "7f415186d38ca71c23058386d7cf5135c8beda821ee1beecdc2a7a26c0356615",
        strip_prefix = "libpng-1.2.57",
        urls = [
            "https://mirror.bazel.build/github.com/glennrp/libpng/archive/v1.2.57.tar.gz",
            "https://github.com/glennrp/libpng/archive/v1.2.57.tar.gz",
        ],
    )

    _maybe(
        git_repository,
        name = "com_google_googletest",
        commit = "1f605414cc4137f0ad0cde4d0c7366ff2dfac590",
        remote = "https://github.com/google/googletest",
    )

    _maybe(
        http_archive,
        name = "com_google_protobuf",
        sha256 = "2244b0308846bb22b4ff0bcc675e99290ff9f1115553ae9671eba1030af31bc0",
        strip_prefix = "protobuf-3.6.1.2",
        urls = [
            "https://mirror.bazel.build/github.com/google/protobuf/archive/v3.6.1.2.tar.gz",
            "https://github.com/google/protobuf/archive/v3.6.1.2.tar.gz",
        ],
    )

    _maybe(
        http_archive,
        name = "org_lua_lua",
        build_file = "@com_github_thirdwave_ai_cartographer//bazel/third_party:lua.BUILD",
        sha256 = "b9e2e4aad6789b3b63a056d442f7b39f0ecfca3ae0f1fc0ae4e9614401b69f4b",
        strip_prefix = "lua-5.2.4",
        urls = [
            "https://mirror.bazel.build/www.lua.org/ftp/lua-5.2.4.tar.gz",
            "https://www.lua.org/ftp/lua-5.2.4.tar.gz", 
        ], 
    )

    _maybe(
        http_archive,
        name = "com_github_grpc_grpc",
        sha256 = "e699efa9422e071a42f052ba8369fbc810e6f7c6fb0a5b1c021f54ac1a92a1f3",
        strip_prefix = "grpc-b250f34b1225cde1bb19496c5cc5d66e40111052",
        urls = [
            "https://mirror.bazel.build/github.com/grpc/grpc/archive/b250f34b1225cde1bb19496c5cc5d66e40111052.tar.gz",
            "https://github.com/grpc/grpc/archive/b250f34b1225cde1bb19496c5cc5d66e40111052.tar.gz",
        ],
    )

    _maybe(
        http_archive,
        name = "com_github_jupp0r_prometheus_cpp",
        sha256 = "6604ea0b5ef75f405c09218f13805d4141f6506eaf0da76f5f64625f62acfcd3",
        strip_prefix = "prometheus-cpp-4e0814ee3f93b796356a51a4795a332568940a72",
        urls = [
            "https://github.com/jupp0r/prometheus-cpp/archive/4e0814ee3f93b796356a51a4795a332568940a72.tar.gz",
        ],
    )

    _maybe(
        http_archive,
        name = "com_github_googlecartographer_async_grpc",
        sha256 = "83c2a27c92979787f38810adc4b6bb67aa09607c53dbadca3430a5f29e0a1cd3",
        strip_prefix = "async_grpc-771af45374af7f7bfc3b622ed7efbe29a4aba403",
        urls = [
            "https://github.com/googlecartographer/async_grpc/archive/771af45374af7f7bfc3b622ed7efbe29a4aba403.tar.gz",
        ],
    )

    _maybe(
        http_archive,
        name = "com_google_absl",
        sha256 = "c8ba586a9ab12bc4a67bb419fc0d2146200942b072bac95f50490f977b7fb04f",
        strip_prefix = "abseil-cpp-5441bbe1db5d0f2ca24b5b60166367b0966790af",
        urls = ["https://github.com/abseil/abseil-cpp/archive/5441bbe1db5d0f2ca24b5b60166367b0966790af.tar.gz"],
    )

    # TODO(rodrigoq): remove these binds once grpc#14140 has been merged, as well
    # as removing `use_external` in cartographer_grpc/BUILD.bazel.
    # https://github.com/grpc/grpc/pull/14140
    native.bind(
        name = "grpc_cpp_plugin",
        actual = "@com_github_grpc_grpc//:grpc_cpp_plugin",
    )
    native.bind(
        name = "grpc++_codegen_proto",
        actual = "@com_github_grpc_grpc//:grpc++_codegen_proto",
    )

def _maybe(repo_rule, name, **kwargs):
    if name not in native.existing_rules():
        repo_rule(name = name, **kwargs)
