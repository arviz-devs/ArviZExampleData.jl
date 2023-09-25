using ArviZExampleData
using Documenter

DocMeta.setdocmeta!(
    ArviZExampleData, :DocTestSetup, :(using ArviZExampleData); recursive=true
)

makedocs(;
    modules=[ArviZExampleData],
    authors="Seth Axen <seth.axen@gmail.com> and contributors",
    repo=Remotes.GitHub("arviz-dev", "ArviZExampleData.jl"),
    sitename="ArviZExampleData.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://arviz-devs.github.io/ArviZExampleData.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
        "Datasets" => "datasets.md",
        "API" => "api.md",
        "For developers" => "for_developers.md",
    ],
    warnonly=:missing_docs,
)

deploydocs(; repo="github.com/arviz-devs/ArviZExampleData.jl", devbranch="main")
