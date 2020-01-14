require 'yaml'

# TOP_BANNER = YAML.load_file('top.yml')
# EDGE_BANNER = YAML.load_file('edges.yml')
# BOTTOM_BANNER = YAML.load_file('bottom.yml')
# SINGLE_EDGE = "|"

def prompt(message)
  puts("#{message}")
end

# def print_to_banner(str)
#   str.center(42)
# end

# prompt(TOP_BANNER['top']) 
# prompt(EDGE_BANNER['edges'])
# puts("#{SINGLE_EDGE} #{print_to_banner("To boldly go where no one has gone before.")} #{SINGLE_EDGE}")
# #print_to_banner("Hello")
# prompt(EDGE_BANNER['edges'])
# prompt(BOTTOM_BANNER['bottom'])

TOP_BANNER = '+-'
BOTTOM_BANNER = '-+'


def test
  puts("#{TOP_BANNER} #{BOTTOM_BANNER}")
end

str = "To boldly go where no one has gone before."
puts str.size

test
