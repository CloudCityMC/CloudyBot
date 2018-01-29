class Commands
  include Cinch::Plugin

  match /ban (.+)/, method: :ban
  match /mute (.+)/, method: :mute
  match /kick (.+)/, method: :kick
  match /warn (.+)/, method: :warn
  match /commands/, method: :commands
  match /help/, method: :commands
  match /prefix/, method: :prefix
  match /versions/, method: :versions

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

  def ban(m, message)
    bob = loadstaff
    unless authenticate(m) && checkperm(m, m.user.name, 'ban')
      m.reply 'You cannot ban! What are you, a bean?'
      return
    end
    User('CloudCityMC').send("#{bob[m.user.name]['Command']} ban #{message}")
    m.reply 'You have successfully banned that user!'
  end

  def mute(m, message)
    bob = loadstaff
    unless authenticate(m) && checkperm(m, m.user.name, 'mute')
      m.reply 'You cannot mute! What are you, a bean?'
      return
    end
    User('CloudCityMC').send("#{bob[m.user.name]['Command']} mute  #{message}")
    m.reply 'You have successfully muted that user!'
  end

  def kick(m, message)
    bob = loadstaff
    unless authenticate(m) && checkperm(m, m.user.name, 'kick')
      m.reply 'You cannot kick! What are you, a bean?'
      return
    end
    User('CloudCityMC').send("#{bob[m.user.name]['Command']} kick #{message}")
    m.reply 'You have successfully kicked that user!'
  end

  def warn(m, message)
    bob = loadstaff
    unless authenticate(m) && checkperm(m, m.user.name, 'warn')
      m.reply 'You cannot warn! What are you, a bean?'
      return
    end
    User('CloudCityMC').send("#{bob[m.user.name]['Command']} warn #{message}")
    m.reply 'You have successfully warned that user!'
  end

  def commands(m)
    m.reply 'Admin commands include: ban, kick, warn, mute; Player commands include: prefix, help, commands'
  end

  def prefx(m)
    m.reply 'My current prefix is "@".'
  end

  def versions(m)
    m.reply 'CloudCityMC supports the following released versions of minecraft: 1.9.x, 1.10.x, 1.11.x, 1.12.x'
  end
end
