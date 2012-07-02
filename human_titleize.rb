#from https://gist.github.com/1165054 by deefour

class String
  # Converts a string into a properly capitalized English title
  # 
  # @param [String] string the string to titleize
  # @return [String] the titleized string
  def proper_titleize
    words = self.downcase.split(/\s+/) 
    combination_exceptions = [
                              'even though', 'so that', 'even if', # subordinating conjunctions
                              'to do', 'to be' # infinitives
                             ]
    exceptions = %w( because if after when although while since ) # subordinating conjunctions
    exceptions += %w( the a an ) # articles
    exceptions += %w( to do ) # infinitives
    exceptions += %w( nor but or yet so both and either neither not
                      of in is for on with as by at from
                      amid anti as down into like minus near off
                      onto over past per plus save than up upon via ) # adposition

    title = []
    i = 0

    while i < words.length do
      if i == 0 or i == words.length-1 or words[i].upcase === words[i]
        title.push(words[i].capitalize)
      elsif combination_exceptions.include?("%s %s" % [words[i], words[i+1]])
        title += [words[i], words[i+1]]
        i += 1
      elsif !exceptions.include?(words[i])
        title.push(words[i].capitalize)
      else 
        title.push(words[i])
      end

      i += 1
    end

    return title.join(' ').strip
  end
end