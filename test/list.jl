using ArviZExampleData, Test

@testset "listing datasets" begin
    @test list_example_data() isa String
end
