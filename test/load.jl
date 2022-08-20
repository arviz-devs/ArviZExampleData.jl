using ArviZExampleData
using InferenceObjects
using Test

@testset "data loading" begin
    @testset "load_example_data" begin
        names = [
            "centered_eight",
            "classification10d",
            "classification1d",
            "glycan_torsion_angles",
            "non_centered_eight",
            "radon",
            "regression10d",
            "regression1d",
            "rugby",
        ]
        datasets = load_example_data()
        @test datasets isa Dict{String,ArviZExampleData.AbstractFileMetadata}
        @test issubset(keys(datasets), names)
        for name in keys(datasets)
            idata = load_example_data(name)
            @test idata isa InferenceData
            @test InferenceObjects.hasgroup(idata, :posterior)
        end
        @test_throws ArgumentError load_example_data("test_absent_dataset")
    end
end
