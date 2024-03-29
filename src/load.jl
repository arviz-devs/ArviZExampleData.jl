"""
    load_example_data(name; kwargs...) -> InferenceObjects.InferenceData
    load_example_data() -> Dict{String,AbstractFileMetadata}

Load a local or remote pre-made dataset.

`kwargs` are forwarded to `InferenceObjects.from_netcdf`.

Pass no parameters to get a `Dict` listing all available datasets.

Data files are handled by DataDeps.jl.
A file is downloaded only when it is requested and then cached for future use.

# Examples

```jldoctest
julia> keys(load_example_data())
KeySet for a OrderedCollections.OrderedDict{String, ArviZExampleData.AbstractFileMetadata} with 10 entries. Keys:
  "centered_eight"
  "non_centered_eight"
  "radon"
  "rugby"
  "rugby_field"
  "regression1d"
  "regression10d"
  "classification1d"
  "classification10d"
  "glycan_torsion_angles"

julia> load_example_data("centered_eight")
InferenceData with groups:
  > posterior
  > posterior_predictive
  > log_likelihood
  > sample_stats
  > prior
  > prior_predictive
  > observed_data
  > constant_data
```
"""
function load_example_data end
function load_example_data(name::AbstractString; kwargs...)
    if haskey(LOCAL_EXAMPLE_DATA, name)
        path = joinpath(LOCAL_DATA_DIR, LOCAL_EXAMPLE_DATA[name].filename)
    elseif haskey(REMOTE_EXAMPLE_DATA, name)
        metadata = REMOTE_EXAMPLE_DATA[name]
        filename = joinpath(metadata.name, metadata.filename)
        # none of our downloads require license agreements, so we always agree to the download
        path = withenv("DATADEPS_ALWAYS_ACCEPT" => true) do
            return DataDeps.resolve(filename, @__FILE__)
        end
    else
        throw(
            ArgumentError(
                "Dataset $name not found. Valid datasets are: $(keys(load_example_data()))"
            ),
        )
    end
    return InferenceObjects.from_netcdf(path; kwargs...)
end
load_example_data() = merge(LOCAL_EXAMPLE_DATA, REMOTE_EXAMPLE_DATA)
