# frozen_string_literal: true

require 'yaml'

# Storage class
class Storage

  @file_name = 'library.yml'

  def self.load
    YAML.load(File.open(@file_name)) if storage_exist?
  end

  def self.save(object)
    File.open(@file_name, 'w') { |file| file.write(YAML.dump(object)) }
  end

  def self.storage_exist?
    File.exist?(@file_name)
  end
end