function register_data(md::LocalFileMetadata)
    return DataDeps.register(DataDeps.ManualDataDep(md.name, md.description))
end
function register_data(md::RemoteFileMetadata)
    return DataDeps.register(DataDeps.DataDep(md.name, md.description, md.url, md.checksum))
end

register_all_data() = map(register_data, values(REMOTE_EXAMPLE_DATA))
