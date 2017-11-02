# frozen_string_literal: true

require 'yaml'

# Storage class
class Storage

  FILE_NAME = 'library.yml'

  def self.load
    YAML.load(File.open(FILE_NAME)) if storage_exist?
  end

  def self.save(object)
    File.open(FILE_NAME, 'w') { |file| file.write(YAML.dump(object)) }
  end

  def self.storage_exist?
    File.exist?(FILE_NAME)
  end
end