module Pelican
  def self.scad_layout
    max_length = []
    cols = 0
    offset_y = 0
    offset_x = 0

    lines = []
    Pelican::extract.each do |product|
      cols = cols + 1
      lines << "translate([#{offset_x},#{offset_y},0]) cube([#{product[:length]},#{product[:width]},#{product[:height]}]);"
      offset_y = offset_y + product[:width] + 10
      max_length << product[:length]

      if cols % 10 == 0
        offset_x = offset_x + max_length.max + 10
        max_length = []
        cols = 0
        offset_y = 0
      end

    end
    return lines * "\n"
  end
end