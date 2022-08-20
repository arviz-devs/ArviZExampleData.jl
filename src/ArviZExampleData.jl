module ArviZExampleData

using DataDeps: DataDeps
using InferenceObjects: InferenceObjects
using JSON3: JSON3
using NCDatasets: NCDatasets
using OrderedCollections: OrderedDict
using StructTypes: StructTypes

export list_example_data, load_example_data

const DEPS_DATA_DIR = joinpath(pkgdir(ArviZExampleData), "deps", "data")
const EXAMPLE_DATA_DIR = joinpath(DEPS_DATA_DIR, "example_data")
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
include("list.jl")

function __init__()
    return register_all_data()
end

end
