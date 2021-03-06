run 'rm .gitignore'
file '.gitignore', <<-TXT
# Created by .ignore support plugin (hsz.mobi)
*.rbc
capybara-*.html
.rspec
/log
/tmp
/db/*.sqlite3
/db/*.sqlite3-journal
/public/system
/coverage/
/spec/tmp
*.orig
rerun.txt
pickle-email-*.html
config/initializers/secret_token.rb
.env
/.bundle
/vendor/bundle
.rvmrc
/vendor/assets/bower_components
*.bowerrc
bower.json
.powenv
.byebug_history
*~
.fuse_hidden*
.directory
.Trash-*
.nfs*
.sass-cache/
*.css.map
.idea/**/workspace.xml
.idea/**/tasks.xml
.idea/dictionaries
.idea/**/dataSources/
.idea/**/dataSources.ids
.idea/**/dataSources.xml
.idea/**/dataSources.local.xml
.idea/**/sqlDataSources.xml
.idea/**/dynamic.xml
.idea/**/uiDesigner.xml
.idea/**/gradle.xml
.idea/**/libraries
cmake-build-debug/
.idea/**/mongoSettings.xml
*.iws
out/
.idea_modules/
atlassian-ide-plugin.xml
.idea/replstate.xml
com_crashlytics_export_strings.xml
crashlytics.properties
crashlytics-build.properties
fabric.properties
*.gem
*.rbc
/.config
/coverage/
/InstalledFiles
/pkg/
/spec/reports/
/spec/examples.txt
/test/tmp/
/test/version_tmp/
/tmp/
.dat*
.repl_history
build/
*.bridgesupport
build-iPhoneOS/
build-iPhoneSimulator/
/.yardoc/
/_yardoc/
/doc/
/rdoc/
/.bundle/
/vendor/bundle
/lib/bundler/man/
.rvmrc
.idea
*.iml
out
gen
TXT

gem 'haml-rails'
gem 'devise'



after_bundle do
  git :init
  git add: '.'
  git commit: "-m 'Initial commit with template.rb'"
end
