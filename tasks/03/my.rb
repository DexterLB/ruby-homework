module RBFS
  class File
    attr_accessor :data

    def initialize(data=nil)
      @data = data
    end

    def data_type
      case data
        when nil         then :nil
        when String      then :string
        when Symbol      then :symbol
        when Numeric     then :number
        when true, false then :boolean
      end
    end

    def serialize
        data_type.to_s + ':' + data.to_s
    end

    def self.parse(serial)
        serial_type, serial_data = serial.split(':', 2)
        self.new case serial_type
            when 'nil'
                nil
            when 'string'
                serial_data
            when 'symbol'
                serial_data.to_sym
            when 'number'
                if serial_data.include? '.'
                    serial_data.to_f
                else
                    serial_data.to_i
                end
            when 'boolean'
                case serial_data
                    when 'true' then true
                    when 'false' then false
                end
        end
    end
  end

  class Directory
    attr_reader :files, :directories

    def initialize
      @files = {}
      @directories = {}
    end

    def add_file(name, file = File.new)
      @files[name] = file
    end

    def add_directory(name, directory = Direcroty.new)
      @directories[name] = directory
    end

    def [](name)
      children[name]
    end

    private
    def children
      files.merge(directories)
    end
  end
end

module RBFS
end
