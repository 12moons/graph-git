require 'open3'
require 'gruff'
require 'fileutils'
require 'graph-git/graph'
require 'graph-git/git'

module GraphGit
  def self.graph_lines(clone_url, output_path)
    puts "Cloning repository..."
    if (!Git.clone(clone_url))
      FileUtils.rm_r("/tmp/graph-git", force: true)
      return false
    end

    puts "Counting lines of code..."
    current_dir = Dir.pwd
    Dir.chdir("/tmp/graph-git")
    if (!(stats = Git.get_stats))
      FileUtils.rm_r("/tmp/graph-git", force: true)
      return false
    end
    name = Git.get_name
    Dir.chdir(current_dir)

    puts "Deleting cloned repository..."
    FileUtils.rm_r("/tmp/graph-git", force: true)

    puts "Creating graph..."
    Graph.graph(clone_url, output_path, stats[:lines], stats[:dates], name)

    puts "Done."
  end
end
