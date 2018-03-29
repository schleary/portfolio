require 'redcarpet'
require 'rouge'
require 'rouge/plugins/redcarpet'

module ApplicationHelper
	class HTML < Redcarpet::Render::HTML
	  include Rouge::Plugins::Redcarpet # yep, that's it.
	end

	def markdown(content)
		renderer = HTML.new(hard_wrap: true, filter_html: true)
		options = {
			autolink: true, 
			no_intra_emphasis: true, 
			disable_indented_code_blocks: false,
			fenced_code_blocks: true,
			lax_html_blocks: true,
			strikethrough: true,
			superscript: true
		}
		puts "*******  RENDERER:   ******"
		puts renderer
		puts "*******  OPTIONS:   ******"
		puts options
		puts "*******  CONTENT:   ******"
		puts content
		Redcarpet::Markdown.new(renderer, options).render(content).html_safe
	end
end