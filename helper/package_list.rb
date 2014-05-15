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
    @list.map{|package| package.for(platform).name}.compact
  end
  def repositories_for(platform = :mac)
    instance_eval(@code)
    @list.map{|package| package.for(platform).repository}.compact
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
        NullPackage.new
      else
        @desired_platform = platform
        self
      end
    end
    def name
      @options[@desired_platform] || @name
    end
    def repository
      @options[:repository]
    end
  end

  class NullPackage
    def name; nil; end
    def repository; nil; end
  end

end
