require 'pathname'

class REPL
  def initialize(file_path)
    @path = file_path
    load_file
    show_repl
  end

  def load_file
    lines = File.readlines(@path)
    @objects = []

    lines.each do |line|
      item = Item.new(line)
      @objects.push(item)
    end

    puts "  #{@objects.length} items loaded from: #{@path}"
  rescue
    puts "  Error: failed to load file: #{@path}"
  end

  def show_repl
    while true
      line_num ||= 1
      ("%03d" % line_num + ' > ').display
      statement = $stdin.gets.chomp

      puts eval(statement.strip)

      line_num += 1
    end
  end

  def display_list(items)
    items.each do |o|
      puts " " + o.content
    end
  end

  def eval(statement)
    output_text = ""

    case statement
    when /((^exit$)|(^quit$))/i
      #Exit application
      exit
    when /^show(\s+all)?$/i
      #Display all loaded items
      display_list @objects
    when /^load\s+((?<path>[^\'\"\s]+)|([\'\"](?<path>.*)[\'\"]))$/i
      #Load a file's items
      @path = $~[:path]

      # Expand relative path
      if not /([a-zA-Z]:)?(\\\\[a-zA-Z0-9_.-]+)+\\\\?/.match(@path)
        @path = File.expand_path(@path, Dir.pwd)
      end

      load_file
    end

    output_text
  end
end

# Object for each item in file

class Item
  attr_reader :tags, :content

  def initialize(text)
    @content = text.chomp
    @tags = Item.get_tags(text)
  end

  def has_tag?(tag)
    tags.include? tag
  end

  def self.get_tags(text)
    text.scan(/#(\w+)/).flatten.map(&:downcase)
  end

end

# Entry Point

def display_help
	puts "Usage:"
	puts "   ruby taga.rb \'path_input_file.txt\'"
end

def main
  if ARGV.length != 1 or ARGV[0].chomp.downcase == "help"
    display_help
  else
  	repl = REPL.new(ARGV[0])
  end
end

main