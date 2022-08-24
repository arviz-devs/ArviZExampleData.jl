"""
    describe_example_data() -> String

Return a string containing descriptions of all available datasets.

# Examples

```jldoctest
julia> describe_example_data("radon") |> println
radon
=====

Radon is a radioactive gas that enters homes through contact points with the ground. It is a carcinogen that is the primary cause of lung cancer in non-smokers. Radon levels vary greatly from household to household.

This example uses an EPA study of radon levels in houses in Minnesota to construct a model with a hierarchy over households within a county. The model includes estimates (gamma) for contextual effects of the uranium per household.

See Gelman and Hill (2006) for details on the example, or https://docs.pymc.io/notebooks/multilevel_modeling.html by Chris Fonnesbeck for details on this implementation.

remote: http://ndownloader.figshare.com/files/24067472
```
"""
function describe_example_data end
function describe_example_data(name::AbstractString)
    haskey(LOCAL_EXAMPLE_DATA, name) && return describe(LOCAL_EXAMPLE_DATA[name])
    haskey(REMOTE_EXAMPLE_DATA, name) && return describe(REMOTE_EXAMPLE_DATA[name])
    throw(
        ArgumentError(
            "Dataset $name not found. Valid datasets are: $(keys(load_example_data()))"
        ),
    )
end
function describe_example_data()
    data = load_example_data()
    return join(map(describe, values(data)), "\n\n")
end

"""
    describe(md::AbstractFileMetadata) -> String

Return description of the metadata of a dataset.
"""
describe
function describe(md::LocalFileMetadata)
    io = IOBuffer()
    println(io, md.name)
    println(io, repeat("=", length(md.name)))
    println(io)
    if md.description !== nothing
        println(io, md.description)
        println(io)
    end
    print(io, "local: ", joinpath(LOCAL_DATA_DIR, md.filename))
    return String(take!(io))
end
function describe(md::RemoteFileMetadata)
    io = IOBuffer()
    println(io, md.name)
    println(io, repeat("=", length(md.name)))
    println(io)
    if md.description !== nothing
        println(io, md.description)
        println(io)
    end
    print(io, "remote: ", md.url)
    return String(take!(io))
end
