using ArviZExampleData, Test

@testset "describing datasets" begin
    @test describe_example_data() isa String
end
