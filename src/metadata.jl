abstract type AbstractFileMetadata end

function StructTypes.StructType(::Type{T}) where {T<:AbstractFileMetadata}
    return StructTypes.Struct()
end

Base.@kwdef struct LocalFileMetadata <: AbstractFileMetadata
    name::String
    filename::String
    description::Union{String,Nothing} = nothing
end

Base.@kwdef struct RemoteFileMetadata <: AbstractFileMetadata
    name::String
    filename::String
    url::String
    checksum::Union{String,Nothing} = nothing
    description::Union{String,Nothing} = nothing
end
