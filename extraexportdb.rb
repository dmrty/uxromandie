require 'mysql2'
require 'yaml'
client = Mysql2::Client.new(host: "localhost", username: "root", database:'uxromandie')

Dir["./_posts/*.html"].each { |file| 
		wordpress_id = File.open(file) { |fileio|
			fileio.grep(/^wordpress_id:.*$/)[0][/\d+/] }

		results = client.query("SELECT meta_key, meta_value FROM cms__postmeta where post_id = #{wordpress_id} and meta_key not REGEXP '^_'")
		extra_keys = Hash.new
		results.each { |row|
			extra_keys[row['meta_key']]=row['meta_value']
		}
		# results.to_a.to_yaml

	new_file = file + '.new'
	File.open(new_file, 'w') do |fo|
  	fo.puts extra_keys.to_yaml
	  File.foreach(file) do |li| 
	    fo.puts li
	  end
	  File.rename(file, file + '.old')
		File.rename(new_file, file)
	end
}
