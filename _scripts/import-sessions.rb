require 'fileutils'
require 'json'

# Load JSON data from source
data = JSON.parse(File.read("_data/schedule.json"))

# Proceed to create post files if the value array is not empty
array = data
if data && !data.empty?

  # create the `sessions` directories if they don't exist already
  talks_dir = File.expand_path('../sessions/talk/_drafts', __dir__)
  tutorials_dir = File.expand_path('../sessions/tutorial/_drafts', __dir__)
  workshops_dir = File.expand_path('../sessions/workshop/_drafts', __dir__)
  FileUtils.mkdir_p(talks_dir) unless Dir.exist?(talks_dir)
  FileUtils.mkdir_p(tutorials_dir) unless Dir.exist?(tutorials_dir)
  FileUtils.mkdir_p(workshops_dir) unless Dir.exist?(workshops_dir)

  # iterate through the array and generate files for each entry
  # where entry.first will be the "content" and entry.last the "title"
  array.each do |entry|
    if entry['decision'] == "Accepted And Announced"
      dir = workshops_dir
      if entry['options']['submission-type'] == "Talk"
        dir = talks_dir
      elsif entry['options']['submission-type'] == "Tutorial"
        dir = tutorials_dir
      end

      File.open(File.join(dir, "#{entry['title'].downcase.strip.gsub(/ +/, '-').gsub(/[^\w-]/, '')}.md"), 'wb') do |draft|
        draft.puts("---\ntitle: '#{entry['title']}'\nlabel: #{entry['options']['submission-label']}\npid: #{entry['submitted_at']}\nauthors:\n")
        entry['authors'].each do |author|
          draft.puts("  - #{author['first']} #{author['last']}\n")
        end
        draft.puts("\n")

        if entry['options']['talk-slides'] || entry['options']['talk-paper'] || entry['options']['video']
          draft.puts("contents:\n")
          if entry['options']['talk-slides']
            entry['options']['talk-slides'].each do |slide|
              draft.puts("  - type: slides\n    href: ../../slides/#{entry['pid']}/#{slide['filename']}\n")
            end
          end
          if entry['options']['talk-paper']
            draft.puts("  - type: paper\n    href: ../../papers/#{entry['pid']}/#{entry['options']['talk-paper']['filename']}\n")
          end
          if entry['options']['video']
            draft.puts("  - type: video\n    href: #{entry['options']['video']}\n")
          end
        end
        draft.puts("---\n\n#{entry['abstract']}")
      end
    end
  end
end
