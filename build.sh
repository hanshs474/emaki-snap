#!/bin/sh
# Pack the emaki-go v0.1.0 CLI (release assets) into one snap per architecture.
set -e
V=0.1.0
for a in amd64 arm64; do
  mkdir -p build/$a/meta build/$a/bin && sed "s/ARCH/$a/" snap.yaml > build/$a/meta/snap.yaml
  curl -sSfL -o build/$a/bin/emaki https://github.com/hanshs474/emaki-go/releases/download/v$V/emaki-linux-$a
  chmod 755 build/$a/bin/emaki
done
docker run --rm -v "$PWD/build:/b" node:22-alpine sh -c 'apk add -q squashfs-tools &&
  for a in amd64 arm64; do mksquashfs /b/$a /b/emaki_'$V'_$a.snap -noappend -comp xz -all-root -no-xattrs -no-fragments -quiet; done'
ls -la build/*.snap
