Ohai.plugin :Systemd do
  provides 'systemd'
  provides 'systemd/units'

  def from_cmd(cmd)
    so = shell_out(cmd)

    so.stdout
  end

  collect_data :default do
    systemd Mash.new

    begin
      systemd[:units] = from_cmd('systemctl list-units').lines[1..-7].map { |x| x.split.first }.reject { |x| !(x.is_a? String) }.sort
    rescue Exception => e
      Ohai::Log.debug('I caught this exception: #{e}')
    end
  end
end

