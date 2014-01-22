class PackageList

  def self.from_file(path)
    new(IO.read(path))
  end

  def initialize(code)
    @code = code
    @list = []
  end

  def list_for(platform = :mac)
    instance_eval(@code)
    @list.map{|package| package.for(platform)}.compact
  end
  def package(package_name, options = {})
    @list << Package.new(package_name, options)
  end

  class Package
    def initialize(name, options)
      @name = name
      @options = options
    end
    def for(platform)
      if @options.has_key?(:only) and @options[:only] != platform
        nil
      else
        @options[platform] || @name
      end
    end
  end

end
