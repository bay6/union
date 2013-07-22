$markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                                    :autolink => true,
                                    :fenced_code_blocks => true,
                                    :space_after_headers => true)
