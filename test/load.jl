using ArviZExampleData
using InferenceObjects
using Test

@testset "data loading" begin
    @testset "load_example_data" begin
        names = [
            "anes",
            "censored_cats",
            "centered_eight",
            "crabs_hurdle_nb",
            "crabs_poisson",
            "glycan_torsion_angles",
            "non_centered_eight",
            "periwinkles",
            "radon",
            "roaches_nb",
            "roaches_zinb",
            "rugby",
            "rugby_field",
            "sbc",
        ]
        datasets = load_example_data()
        @test datasets isa AbstractDict{String,ArviZExampleData.AbstractFileMetadata}
        @test issubset(names, keys(datasets))
        @testset for name in keys(datasets)
            idata = load_example_data(name)
            @test idata isa InferenceData
            if name != "sbc"
                @test InferenceObjects.hasgroup(idata, :posterior)
            end
        end
        @test_throws ArgumentError load_example_data("test_absent_dataset")
    end
end
