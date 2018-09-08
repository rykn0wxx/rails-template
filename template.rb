require "fileutils"
require "shellwords"

def add_my_template
	add_template_repository_to_source_path

	set_application_name

	template "Gemfile.tt", force: true

	template "README.md.tt", force: true

	copy_file "editorconfig", ".editorconfig"
  copy_file "gitignore", ".gitignore", force: true

	apply "app/template.rb"
	apply "config/template.rb"
	apply "lib/template.rb"

end

def gemfile_requirement(name)
  @original_gemfile ||= IO.read("Gemfile")
  req = @original_gemfile[/gem\s+['"]#{name}['"]\s*(,[><~= \t\d\.\w'"]*)?.*$/, 1]
  req && req.gsub("'", %(")).strip.sub(/^,\s*"/, ', "')
end

def add_template_repository_to_source_path
  if __FILE__ =~ %r{\Ahttps?://}
    require "tmpdir"
    source_paths.unshift(tempdir = Dir.mktmpdir("rails-template-"))
    at_exit { FileUtils.remove_entry(tempdir) }
    git clone: [
      "--quiet",
      "https://github.com/rykn0wxx/rails-template.git",
      tempdir
    ].map(&:shellescape).join(" ")

    if (branch = __FILE__[%r{rails-template/(.+)/template.rb}, 1])
      Dir.chdir(tempdir) { git checkout: branch }
    end
  else
    source_paths.unshift(File.dirname(__FILE__))
  end
end

def set_application_name
  environment "config.application_name = Rails.application.class.parent_name"
  puts "You can change application name inside: ./config/application.rb"
end

add_my_template
