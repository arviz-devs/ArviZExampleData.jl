# For developers

This package has [`arviz_example_data`](https://github.com/arviz-devs/arviz_example_data) as a data dependency, which is included as an [artifact](https://pkgdocs.julialang.org/v1/artifacts/).

When `arviz_example_data` is updated, and a new release is made, `Artifacts.toml` should be updated to point to the new tarball corresponding to the release:

```julia
julia> using ArtifactUtils

julia> version = v"0.1.0";

julia> tarball_url = "https://github.com/arviz-devs/arviz_example_data/archive/refs/tags/v$version.tar.gz";

julia> add_artifact!("Artifacts.toml", "arviz_example_data", tarball_url; force=true);
```
