Ohai.plugin :Apache do
  provides 'apache'
  provides 'apache/modules'

  collect_data :default do
    apache Mash.new

    apache[:modules] = Dir.entries('<%= @mod_path %>').reject { |x| x =~ /^\./ }.map { |x| x[4..-4] }
  end
end
