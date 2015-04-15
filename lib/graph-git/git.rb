require 'open3'

class Git
  def self.clone(clone_url)
    stdin, stdout, stderr, exit_code = Open3.popen3("git", "clone", clone_url, "/tmp/graph-git")
    stdin.close
    stdout.gets(nil)
    stderr.gets(nil)
    stdout.close
    stderr.close
    
    if ! exit_code.value.success?
      puts "Error during git clone!"
      return false
    end
    return true
  end
  
  def self.get_name
    stdin, stdout, stderr, exit_code = Open3.popen3("git",  "config", "--get", "remote.origin.url")
    stdin.close
    name = stdout.gets(nil)
    stderr.gets(nil)
    stdout.close
    stderr.close
    
    if ! exit_code.value.success?
      puts "Error during git clone!"
      return false
    end
    
    return name.to_s.strip.sub("\n", "").sub(".git", "").split("/").last.capitalize
  end
  
  def self.get_date_commit(commit)
    stdin, stdout, stderr, exit_code = Open3.popen3("git", "show", "-s", "--format=%ci", commit)
    stdin.close
    date = stdout.gets(nil)
    stderr.gets(nil)
    stdout.close
    stderr.close
    
    if ! exit_code.value.success?
      puts "Error during git clone!"
      return false
    end
    
    date = date.to_s.split("-")
    
    if "#{date[0]}/#{date[1]}" == "1970/01"
      return ""
    end
    
    "#{date[0]}/#{date[1]}"
  end
  
  def self.get_commit_count
    stdin, stdout, stderr, exit_code = Open3.popen3("git", "rev-list",  "HEAD", "--count")
    stdin.close
    commit_count = stdout.gets(nil)
    stderr.gets(nil)
    stdout.close
    stderr.close
    
    if ! exit_code.value.success?
      puts "Error during git commit count!"
      return false
    end
    
    return commit_count.to_i
  end
  
  def self.get_stats
    stdin, stdout, stderr, exit_code = Open3.popen3("git", "log", "--shortstat", "--reverse", "--pretty=oneline")
    stdin.close
    logs = stdout.gets(nil)
    stderr.gets(nil)
    stdout.close
    stderr.close
    
    lines = [0]
    dates = {}
    commit = nil
    commit_count = get_commit_count
    
    logs = logs.split("\n")
    
    i = 0
    logs.each do |line|
      line = line.strip.gsub(',', '').split(' ')
      
      if (line[0].length > 10)
        commit = line[0]
      else
        insertions = 0
        deletions = 0
        
        if !line[4].nil?
          if line[4] == "insertions(+)"
            insertions = line[3].to_i
          elsif line[4] == "deletions(-)"
            deletions = line[3].to_i
          end
        end
        
        if !line[6].nil?
          if line[6] == "insertions(+)"
            insertions = line[5].to_i
          elsif line[6] == "deletions(-)"
            deletions = line[5].to_i
          end
        end
        
        date = get_date_commit(commit)
        
        next if date == ""
        
        date = "" if (i % (commit_count / 6) != 0)
        
        lines.push(lines.last + insertions - deletions)
        dates[dates.length] = date
        
        i += 1
      end
    end
    
    if ! exit_code.value.success?
      puts "Error during git log!"
      return false
    end
    
    {lines: lines, dates: dates}
  end
end
