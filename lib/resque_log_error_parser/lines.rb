module ResqueLogErrorParser
  class Lines < Array

    def filter_by(*filters)
      filters = [filters].flatten
      filtered_lines = self.dup
      filters.each do |filter|
        filtered_lines = filtered_lines.grep(/#{filter}/)
      end
      self.class.new(filtered_lines)
    end

    def strip_newlines
      stripped_lines = self.map { |line| line.gsub("\n", "") }
      self.class.new(stripped_lines)
    end

  end
end
