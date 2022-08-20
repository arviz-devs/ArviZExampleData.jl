using ArviZExampleData
using Test

@testset "metadata" begin
    @testset "LocalFileMetadata" begin
        md = ArviZExampleData.LocalFileMetadata(; name="foo", filename="bar.nc")
        @test md.name == "foo"
        @test md.filename == "bar.nc"
        @test md.description === nothing
        @test startswith(sprint(show, "text/plain", md), "foo\n===\n\nlocal:")

        md = ArviZExampleData.LocalFileMetadata(;
            name="foo", filename="bar.nc", description="desc"
        )
        @test startswith(sprint(show, "text/plain", md), "foo\n===\n\ndesc\n\nlocal:")
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
        @test sprint(show, "text/plain", md) == "foo\n===\n\nremote: http://baq.baz"

        md = ArviZExampleData.RemoteFileMetadata(;
            name="foo", filename="bar.nc", url="http://baq.baz", description="desc"
        )
        @test sprint(show, "text/plain", md) == "foo\n===\n\ndesc\n\nremote: http://baq.baz"
    end
end
