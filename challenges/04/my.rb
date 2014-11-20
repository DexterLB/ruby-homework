def remove_duplicates(collection)
    filtered = []
    collection.each { |x| filtered << x unless filtered.include? x }
    filtered
end
