module Helpers
  module FileSystem
    def write_file(file_name, contents)
      FileUtils.mkdir_p(File.dirname(file_name)) unless File.directory?(File.dirname(file_name))
      ::File.open(file_name.to_s, 'w+') {|f| f.write(contents) }
    end

    def delete_directory(name)
      FileUtils.rm_rf(name)
    end
  end
end
