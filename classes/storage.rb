require 'yaml'

class Storage

  @@FileName = 'library.yml'

  def Storage.load
    YAML::load(File.open(@@FileName)) if self.storage_exist?
  end

  def Storage.save (object)
    File.open(@@FileName, 'w') { |file| file.write(YAML::dump(object)) }
  end

  def Storage.storage_exist?
    File.exist?(@@FileName)
  end

end