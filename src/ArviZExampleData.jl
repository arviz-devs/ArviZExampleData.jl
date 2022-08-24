module ArviZExampleData

using Artifacts: @artifact_str
using DataDeps: DataDeps
using InferenceObjectsNetCDF: InferenceObjectsNetCDF
using JSON3: JSON3
using OrderedCollections: OrderedDict
using StructTypes: StructTypes

export describe_example_data, load_example_data

const EXAMPLE_DATA_DIR = only(readdir(artifact"arviz_example_data"; join=true))
const LOCAL_DATA_DIR = joinpath(EXAMPLE_DATA_DIR, "data")
const LOCAL_DATA_FILE = joinpath(EXAMPLE_DATA_DIR, "data_local.json")
const REMOTE_DATA_FILE = joinpath(EXAMPLE_DATA_DIR, "data_remote.json")
const DATA_HTTP_PROTOCOL = "https"

include("metadata.jl")

const LOCAL_EXAMPLE_DATA = OrderedDict(
    md.name => md for md in JSON3.read(read(LOCAL_DATA_FILE), Vector{LocalFileMetadata})
)
const REMOTE_EXAMPLE_DATA = OrderedDict(
    md.name => md for md in JSON3.read(read(REMOTE_DATA_FILE), Vector{RemoteFileMetadata})
)

include("register.jl")
include("load.jl")
include("describe.jl")

function __init__()
    return register_all_data()
end

end
