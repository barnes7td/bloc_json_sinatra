require 'json'

class People
  attr_reader :names

  def initialize
    @names = {}
    Dir.glob("./people/*.json").each do |file|
      person = read_file file
      @names[person["name"]] = file
    end
  end

  def find(name)
    person = read_file names[name]
  end

  def find_all_names
    names.keys
  end

  def include?(person)
    names.keys.include? person
  end

  private

  def read_file(filename)
    JSON.parse(File.readlines("#{filename}").join)
  end

end