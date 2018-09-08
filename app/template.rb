copy_file "app/assets/javascripts/application.js", force: true
copy_file "app/assets/stylesheets/application.scss"
remove_file "app/assets/stylesheets/application.css"

directory "app/assets/stylesheets/administrate", "app/assets/stylesheets/administrate"
directory "app/assets/stylesheets/app", "app/assets/stylesheets/app"
directory "app/assets/stylesheets/components", "app/assets/stylesheets/components"
directory "app/assets/stylesheets/utility", "app/assets/stylesheets/utility"

directory "app/assets/fonts", "app/assets/fonts"
directory "app/assets/images", "app/assets/images"

copy_file "app/controllers/application_controller.rb", force: true
copy_file "app/helpers/application_helper.rb", force: true
copy_file "app/helpers/layout_helper.rb"

directory "app/classes", "app/classes", force: true
directory "app/views", "app/views", force: true
