require "lita"

Lita.load_locales Dir[File.expand_path(
  File.join("..", "..", "locales", "*.yml"), __FILE__
)]

Lita::Handlers::IrinaLita.template_root File.expand_path(
  File.join("..", "..", "templates"),
 __FILE__
)
require 'oci8'
require 'optparse'
require 'getoptlong'
require "lita/handlers/irina_lita"