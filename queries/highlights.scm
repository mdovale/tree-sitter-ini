(section_name
  (text) @type) ; consistency with toml

(comment) @comment @spell

[
  "["
  "]"
] @punctuation.bracket

"=" @operator

(setting
  (setting_name) @property)

; Values: generic string first; #match? refinements below override (tree-sitter: later wins).
(setting
  (setting_value) @string)

((setting_value) @number
 (#match? @number "^[0-9]+$"))

((setting_value) @number
 (#match? @number "^[0-9]+\\.[0-9]+$"))

((setting_value) @boolean
 (#match? @boolean "^(true|false)$"))

((setting_value) @constant.numeric.color
 (#match? @constant.numeric.color "^#[0-9a-fA-F]{3,8}$"))
