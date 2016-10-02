###
# Page options, layouts, aliases and proxies
###


compass_config do |config|
  config.output_style = :compressed
  config.sass_options = { :line_comments => false, :debug_info => false }
end

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

# General configuration
class Op < Middleman::Extension
  def after_build(builder)
    builder.thor.run 'gulp optimize'
  end
end

::Middleman::Extensions.register(:optimize, Op)

set :css_dir, 'css'
set :images_dir, 'images'
set :js_dir, 'js'

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

###
# Helpers
###

helpers do
	def is_page_selected(page)
		current_page.url == page ? "active" : ''
	end
end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Build-specific configuration
configure :build do
	activate :optimize
	activate :minify_html, :remove_input_attributes => false
	# activate :minify_javascript
	# activate :minify_css

end