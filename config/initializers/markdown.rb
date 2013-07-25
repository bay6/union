$markdown = Redcarpet::Markdown.new(MdEmoji::Render,
                                    :autolink => true,
                                    :fenced_code_blocks => true,
                                    :space_after_headers => true)
