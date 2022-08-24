using ArviZExampleData
using Test

@testset "metadata" begin
    @testset "LocalFileMetadata" begin
        md = ArviZExampleData.LocalFileMetadata(; name="foo", filename="bar.nc")
        @test md.name == "foo"
        @test md.filename == "bar.nc"
        @test md.description === nothing
    end

    @testset "RemoteFileMetadata" begin
        md = ArviZExampleData.RemoteFileMetadata(;
            name="foo", filename="bar.nc", url="http://baq.baz"
        )
        @test md.name == "foo"
        @test md.filename == "bar.nc"
        @test md.url == "http://baq.baz"
        @test md.description === nothing
        @test md.checksum === nothing
    end
end
