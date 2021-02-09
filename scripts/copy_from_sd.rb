require "date"
require "rsync"
require "pry"
#
# rsync commands to copy raw and jpg

binding.pry

MONTH = Date.today.year
DAY = format("%02d", Date.today.day)
SRC = "/media/andrew/disk/DCIM/693_FUJI/"
DEST = "~/pix/photography/2021/01-january"

Rsync.run("/path/to/src", "/path/to/dest") do |result|
  if result.success?
    result.changes.each do |change|
      puts "#{change.filename} (#{change.summary})"
    end
  else
    puts result.error
  end
end
