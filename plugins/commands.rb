class Commands
  include Cinch::Plugin

  match /ban (.+) (.+) (.+)/, method: :ban
  match /mute (.+) (.+) (.+)/, method: :mute
  match /kick (.+) (.+)/, method: :kick
  match /warn (.+) (.+)/, method: :warn

  def authenticate(m)
    name = m.user.name
    staffdata = YAML.load_file('staff.yaml')
    return true if staffdata[name]['Host'] == m.user.host
    false
  end

  def checkperm(_m, user, perm)
    rank = YAML.load_file('staff.yaml')[user]['Rank']
    return true if rank == 'Admin' || rank == 'Owner'
    if perm == 'ban' || perm == 'kick'
      return true if rank == 'Mod'
    end
    if perm == 'mute' || perm == 'warn'
      return true if rank == 'Mod'
      return true if rank == 'Helper'
    end
    false
  end

  def loadstaff
    YAML.load_file('staff.yaml')
  end

  def ban(m, user, time, message)
    bob = loadstaff
    unless authenticate(m) && checkperm(m, m.user.name, 'ban')
      m.reply 'You cannot ban! What are you, a bean?'
      return
    end
    User('CloudCityMC').send("#{bob[m.user.name]['Command']} ban #{time} #{user} #{message}")
    m.reply 'You have successfully banned that user!'
  end

  def mute(m, user, time, message)
    bob = loadstaff
    unless authenticate(m) && checkperm(m, m.user.name, 'mute')
      m.reply 'You cannot mute! What are you, a bean?'
      return
    end
    User('CloudCityMC').send("#{bob[m.user.name]['Command']} mute #{time} #{user} #{message}")
    m.reply 'You have successfully muted that user!'
  end

  def kick(m, user, message)
    bob = loadstaff
    unless authenticate(m) && checkperm(m, m.user.name, 'kick')
      m.reply 'You cannot kick! What are you, a bean?'
      return
    end
    User('CloudCityMC').send("#{bob[m.user.name]['Command']} kick #{user} #{message}")
    m.reply 'You have successfully kicked that user!'
  end

  def warn(m, user, message)
    bob = loadstaff
    unless authenticate(m) && checkperm(m, m.user.name, 'warn')
      m.reply 'You cannot warn! What are you, a bean?'
      return
    end
    User('CloudCityMC').send("#{bob[m.user.name]['Command']} warn #{user} #{message}")
    m.reply 'You have successfully warned that user!'
  end
end
