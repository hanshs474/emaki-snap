# emaki snap

Snap package of the official [emaki](https://emaki.ai/?utm_source=snapcraft&utm_medium=package) CLI. emaki is the Japanese-language AI video generator for [Seedance 2.5](https://emaki.ai/seedance-2-5) and [Seedance 2.0](https://emaki.ai/seedance-2).

```
sudo snap install emaki
export EMAKI_API_KEY=sk-...   # from https://emaki.ai/settings/apikeys
emaki -credits
emaki "a paper lantern drifting over a night river"
```

Runs cost credits on your emaki account, the same price as on the website. On the web: [image to video](https://emaki.ai/image-to-video) and the [AI video upscaler](https://emaki.ai/video-upscaler). 日本語での使い方は [シーダンス](https://emaki.ai/) へ。

`build.sh` packs the `emaki-linux-{amd64,arm64}` assets of [emaki-go v0.1.0](https://github.com/hanshs474/emaki-go/releases/tag/v0.1.0) into `.snap` files (no snapcraft or LXD needed); `upload.py` pushes and releases them to the stable channel with craft-store. MIT licensed.
