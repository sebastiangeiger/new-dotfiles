require_relative "package_list"
require "test/unit"

class TestPackageList < Test::Unit::TestCase

  def test_from_file
    string = <<-eos
      package "program_1"
      package "program_2"
    eos
    File.delete("sandbox") if File.exists? "sandbox"
    File.open("sandbox", "w+") {|f| f.write(string)}
    list = PackageList.from_file("sandbox").list_for(:mac)
    assert_equal ["program_1", "program_2"], list
    File.delete("sandbox") if File.exists? "sandbox"
  end

  def test_list_for_1_program_returns_that_program
    string = %{package "program_1"}
    list = PackageList.new(string).list_for
    assert_equal ["program_1"], list
  end

  def test_list_for_with_2_program_returns_these_programs
    string = <<-eos
      package "program_1"
      package "program_2"
    eos
    list = PackageList.new(string).list_for
    assert_equal ["program_1", "program_2"], list
  end

  def test_list_for_with_alternative_names_for_platforms_returns_platform_specific_names
    string = <<-eos
      package "program_1_mac", :linux => "program_1_linux"
      package "program_2"
    eos
    mac = PackageList.new(string).list_for(:mac)
    linux = PackageList.new(string).list_for(:linux)
    assert_equal ["program_1_mac", "program_2"], mac
    assert_equal ["program_1_linux", "program_2"], linux
  end

  def test_list_for_with_programs_that_only_work_on_specific_platforms
    string = <<-eos
      package "program_1_mac", :only => :mac
      package "program_2"
    eos
    mac = PackageList.new(string).list_for(:mac)
    linux = PackageList.new(string).list_for(:linux)
    assert_equal ["program_1_mac", "program_2"], mac
    assert_equal ["program_2"], linux
  end

end
