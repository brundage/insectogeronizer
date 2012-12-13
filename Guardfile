guard :rspec, all_after_pass: false do

  watch( %r{^spec/.+_spec\.rb$} )
  watch( 'spec/spec_helper.rb' )         { |m| "spec" }
  watch( %r{^spec/support/.+\.rb$} )     { |m| "spec" }
  watch( %r{^spec/factories/(.+)\.rb$} ) { |m| "spec/models/#{m[1]}_spec.rb" }

  watch( %r{^app/(.+)\.rb$} )            { |m| "spec/m[1]}_spec.rb" }
  watch( %r{^app/(.*)(\.erb|\.haml)$} )  { |m| "spec/m[1]}#{m[2]}_spec.rb" }

  watch('app/controllers/application_controller.rb') { |m| "spec/controllers" }
  watch('app/decorators/application_decorator.rb') { |m| "spec/decorators" }

end
