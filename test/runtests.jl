using ArviZExampleData
using Test

@testset "ArviZExampleData.jl" begin
    include("metadata.jl")
    include("load.jl")
    include("list.jl")
end
