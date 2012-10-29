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

  def find(name, format = :ruby)
    return read_file names[name] if format == :ruby
    (read_file names[name]).to_json if format == :json
  end

  def find_all_names(format = :ruby)
    return names.keys if format == :ruby
    names.keys.to_json if format == :json
  end

  def include?(person)
    names.keys.include? person
  end

  private

  def read_file(filename)
    JSON.parse(File.readlines("#{filename}").join)
  end

end