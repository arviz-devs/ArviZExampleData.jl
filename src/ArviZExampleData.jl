module ArviZExampleData

using DataDeps: DataDeps
using InferenceObjects: InferenceObjects
using JSON3: JSON3
using NCDatasets: NCDatasets
using StructTypes: StructTypes

const DEPS_DATA_DIR = joinpath(pkgdir(ArviZExampleData), "deps", "data")
const EXAMPLE_DATA_DIR = joinpath(DEPS_DATA_DIR, "example_data")
const LOCAL_DATA_DIR = joinpath(EXAMPLE_DATA_DIR, "data")
const LOCAL_DATA_FILE = joinpath(EXAMPLE_DATA_DIR, "data_local.json")
const REMOTE_DATA_FILE = joinpath(EXAMPLE_DATA_DIR, "data_remote.json")
const DATA_HTTP_PROTOCOL = "https"

end
