abstract type AbstractFileMetadata end

function StructTypes.StructType(::Type{T}) where {T<:AbstractFileMetadata}
    return StructTypes.Struct()
end

Base.@kwdef struct LocalFileMetadata <: AbstractFileMetadata
    name::String
    filename::String
    description::Union{String,Nothing} = nothing
end

function Base.show(io::IO, ::MIME"text/plain", md::LocalFileMetadata)
    println(io, md.name)
    println(io, repeat("=", length(md.name)))
    println(io)
    if md.description !== nothing
        println(io, md.description)
        println(io)
    end
    print(io, "local: ", joinpath(LOCAL_DATA_DIR, md.filename))
    return nothing
end
Base.@kwdef struct RemoteFileMetadata <: AbstractFileMetadata
    name::String
    filename::String
    url::String
    checksum::Union{String,Nothing} = nothing
    description::Union{String,Nothing} = nothing
end

function Base.show(io::IO, ::MIME"text/plain", md::RemoteFileMetadata)
    println(io, md.name)
    println(io, repeat("=", length(md.name)))
    println(io)
    if md.description !== nothing
        println(io, md.description)
        println(io)
    end
    print(io, "remote: ", md.url)
    return nothing
end
