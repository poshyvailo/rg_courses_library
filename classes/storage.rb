require 'yaml'

class Storage

  @@FileName = 'storage.yml'

  def Storage.load
    unless File.exist?(@@FileName)
      raise "Not Found file #{@@FileName}"
    end
    YAML::load(File.open(@@FileName))
  end

  def Storage.save (object)
    File.open(@@FileName, 'w') { |file| file.write(YAML::dump(object)) }
  end

end