"""
    describe_example_data() -> String

Return a string containing descriptions of all available datasets.
"""
function describe_example_data()
    data = load_example_data()
    descriptions = map(values(data)) do metadata
        return sprint(show, "text/plain", metadata)
    end
    return join(descriptions, "\n\n")
end
