require "jekyll-import";
JekyllImport::Importers::WordPress.run({
  "dbname"   => "uxromandie",
  "user"     => "root",
  "password" => "",
  "host"     => "localhost",
  "port"     => "3306",
  "table_prefix"   => "cms__",
  "site_prefix"    => "",
  "clean_entities" => true,
  "comments"       => true,
  "categories"     => true,
  "tags"           => true,
  "more_excerpt"   => true,
  "more_anchor"    => true,
  "extension"      => "html",
  "status"         => ["publish"]
})
