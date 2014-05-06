require 'god'

God.watch do |w|
  w.name = "reginald"
  w.start = "bundle exec ruby /home/goggin/projects/butler/main.rb"
  w.keepalive(
    :memory_max => 100.megabytes,
    :cpu_max => 10.percent
  )
  w.log = '/home/goggin/projects/butler/log/reginald.log'
end
