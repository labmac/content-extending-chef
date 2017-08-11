Ohai.plugin :Apache do
  provides 'apache'
  provides 'apache/modules'

  collect_data :default do
    apache Mash.new

    apache[:modules] = Dir.entries("/usr/lib64/httpd/modules").reject { |x| x =~ /^\./ }.map { |x| x[4..-4] }
  end
end

