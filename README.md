# Godot on Cloudflare Pages

An example repo showing how to deploy a Godot project to Cloudflare Pages using GitHub Actions.

## Features
- [Export](.github/workflows/export.yml) workflow using [godot-ci](https://github.com/abarichello/godot-ci)
- [Deploy](.github/workflows/deploy.yml) to Cloudflare Pages when PR is [merged](.github/workflows/merge.yml) into main
- Compress Wasm with Brotli to reduce size from ~35 MB to ~5 MB

## Demo
[godotexample.pages.dev](https://godotexample.pages.dev)

The demo uses [Squash The Creeps](https://github.com/godotengine/godot-demo-projects/tree/master/3d/squash_the_creeps) from the Godot tutorial.
Its license can be found in the [LICENSE](src/LICENSE) and [README](src/README.md#copying) files in the `src` directory.
