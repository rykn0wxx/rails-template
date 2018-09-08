copy_file "config/application.rb", force: true

copy_file "config/environments/development.rb", force: true
directory "config/initializers", "config/initializers", force: true
directory "config/locales", "config/locales", force: true
