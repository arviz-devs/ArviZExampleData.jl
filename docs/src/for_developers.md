# For developers

This package has [`arviz_example_data`](https://github.com/arviz-devs/arviz_example_data) as a data dependency, which is included using [`git subtree`](https://www.atlassian.com/git/tutorials/git-subtree):

```bash
$ git subtree add --prefix deps/data/example_data https://github.com/arviz-devs/arviz_example_data.git main --squash
```

When `arviz_example_data` is updated, a `git subtree` pull must be run within this repo to keep the data dependency up-to-date:

```bash
$ git subtree pull --prefix deps/data/example_data https://github.com/arviz-devs/arviz_example_data.git main --squash
```

!!! info "Why git subtree instead of git submodule?"
    `git submodule` avoids copying the data from one repo into another, but it is incompatible with Julia's package registration.
    See [this comment](https://github.com/JuliaLang/Pkg.jl/issues/708#issuecomment-578149661) for an explanation.
