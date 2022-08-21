using ArviZExampleData, Test

@testset "describing datasets" begin
    @testset "describe" begin
        md = ArviZExampleData.LocalFileMetadata(; name="foo", filename="bar.nc")
        @test startswith(ArviZExampleData.describe(md), "foo\n===\n\nlocal:")

        md = ArviZExampleData.LocalFileMetadata(;
            name="foo", filename="bar.nc", description="desc"
        )
        @test startswith(ArviZExampleData.describe(md), "foo\n===\n\ndesc\n\nlocal:")

        md = ArviZExampleData.RemoteFileMetadata(;
            name="foo", filename="bar.nc", url="http://baq.baz"
        )
        @test ArviZExampleData.describe(md) == "foo\n===\n\nremote: http://baq.baz"

        md = ArviZExampleData.RemoteFileMetadata(;
            name="foo", filename="bar.nc", url="http://baq.baz", description="desc"
        )
        @test ArviZExampleData.describe(md) == "foo\n===\n\ndesc\n\nremote: http://baq.baz"
    end

    @testset "describe_example_data" begin
        data = load_example_data()
        desc = describe_example_data()
        @test desc isa String

        @test startswith(desc, ArviZExampleData.describe(first(values(data))))
        @test endswith(desc, ArviZExampleData.describe(last(collect(values(data)))))
    end
end
