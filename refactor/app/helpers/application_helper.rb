module ApplicationHelper
  require 'rouge'
  require 'rouge/plugins/redcarpet'

  class HTMLwithRouge < Redcarpet::Render::HTML
    include Rouge::Plugins::Redcarpet
  end

  def markdown(text)
    render_options = {
      filter_html: true,
      hard_wrap: true,
    }
    renderer = HTMLwithRouge.new(render_options)

    extensions = {
      fenced_code_blocks: true,
      disable_indented_code_blocks: true,
      no_intra_emphasis: true,
      autolink: true,
      space_after_headers: true,
      lax_spacing: true,
      superscript: true,
      strikethrough: true
    }

    Redcarpet::Markdown.new(renderer, extensions).render(text).html_safe
  end
end
