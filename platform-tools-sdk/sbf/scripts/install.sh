#!/usr/bin/env bash

mkdir -p "$(dirname "$0")"/../dependencies
cd "$(dirname "$0")"/../dependencies

unameOut="$(uname -s)"
case "${unameOut}" in
  Linux*)
    criterion_suffix=
    machine=linux;;
  Darwin*)
    criterion_suffix=
    machine=osx;;
  MINGW*)
    criterion_suffix=-mingw
    machine=windows;;
  *)
    criterion_suffix=
    machine=linux
esac
unameOut="$(uname -m)"
case "${unameOut}" in
  arm64*)
    arch=aarch64;;
  *)
    arch=x86_64
esac

download() {
  declare url="$1/$2/$3"
  declare filename=$3
  declare wget_args=(
    "$url" -O "$filename"
    "--progress=dot:giga"
    "--retry-connrefused"
    "--read-timeout=30"
  )
  declare curl_args=(
    -L "$url" -o "$filename"
  )
  if hash wget 2>/dev/null; then
    wget_or_curl="wget ${wget_args[*]}"
  elif hash curl 2>/dev/null; then
    wget_or_curl="curl ${curl_args[*]}"
  else
    echo "Error: Neither curl nor wget were found" >&2
    return 1
  fi

  set -x
  if $wget_or_curl; then
    tar --strip-components 1 -jxf "$filename" || return 1
    { set +x; } 2>/dev/null
    rm -rf "$filename"
    return 0
  fi
  return 1
}

get() {
  declare version=$1
  declare dirname=$2
  declare job=$3
  declare cache_root=~/.cache/solana
  declare cache_dirname="$cache_root/$version/$dirname"
  declare cache_partial_dirname="$cache_dirname"_partial

  if [[ -r $cache_dirname ]]; then
    ln -sf "$cache_dirname" "$dirname" || return 1
    return 0
  fi

  rm -rf "$cache_partial_dirname" || return 1
  mkdir -p "$cache_partial_dirname" || return 1
  pushd "$cache_partial_dirname"

  if $job; then
    popd
    mv "$cache_partial_dirname" "$cache_dirname" || return 1
    ln -sf "$cache_dirname" "$dirname" || return 1
    return 0
  fi
  popd
  return 1
}

# Install Criterion
if [[ $machine == "linux" ]]; then
  version=v2.3.3
else
  version=v2.3.2
fi
if [[ ! -e criterion-$version.md || ! -e criterion ]]; then
  (
    set -e
    rm -rf criterion*
    job="download \
           https://github.com/Snaipe/Criterion/releases/download \
           $version \
           criterion-$version-$machine$criterion_suffix-x86_64.tar.bz2 \
           criterion"
    get $version criterion "$job"
  )
  exitcode=$?
  if [[ $exitcode -ne 0 ]]; then
    exit 1
  fi
  touch criterion-$version.md
fi

# Install platform tools
tools_version=v1.50
rust_version=1.84.1
if [[ ! -e platform-tools-$tools_version.md || ! -e platform-tools ]]; then
  (
    set -e
    rm -rf platform-tools*
    job="download \
           https://github.com/anza-xyz/platform-tools/releases/download \
           $tools_version \
           platform-tools-${machine}-${arch}.tar.bz2 \
           platform-tools"
    get $tools_version platform-tools "$job"
  )
  exitcode=$?
  if [[ $exitcode -ne 0 ]]; then
    exit 1
  fi
  touch platform-tools-$tools_version.md
  set -ex
  ./platform-tools/rust/bin/rustc --version
  ./platform-tools/rust/bin/rustc --print sysroot

  if [[ "${BASH_VERSINFO[0]}" -lt 4 ]]; then
    # MacOS has an outdated version of bash and does not support the safer 'mapfile' alternative
    toolchains=()
    while IFS='' read -r line; do toolchains+=("$line"); done < <(rustup toolchain list)
  else
    mapfile -t toolchains < <(rustup toolchain list)
  fi

  set +e
  for item in "${toolchains[@]}"
  do
    if [[ $item == *"solana"* ]]; then
      rustup toolchain uninstall "$item"
    fi
  done
  set -e

  rustup toolchain link "$rust_version-sbpf-solana-$tools_version" platform-tools/rust
fi

exit 0
