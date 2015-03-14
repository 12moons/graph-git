require 'gruff'
require 'time'

class Graph
  def self.graph(clone_url, output_path, lines, dates, name)
    g = Gruff::Line.new()
    g.marker_font_size = 16
    g.title = name
    g.data :"code lines count", lines
    g.labels = dates
    g.write(output_path)
  end
end
