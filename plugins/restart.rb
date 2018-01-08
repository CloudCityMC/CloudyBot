class Restart
  include Cinch::Plugin

  match /restart/, method: :restart
  match /update/, method: :update

  def getrank(m, nick)
    rank = Staff[nick]['Rank']
    host = Staff[nick]['Host']
    userhost = m.user.host
    if userhost != host
      return 'none'
    else
      return rank
    end
  end

  def restart(m)
    return if Time.now - STARTTIME < 10
    unless getrank(m, m.user.name) == 'Admin' || getrank(m, m.user.name) == 'Owner'
      m.reply 'Only Admins and Owners may restart me! What are you, a bean?'
      return
    end
    m.reply 'Restarting the bot without updating...'
    sleep 1
    exec('ruby bot.rb')
  end

  def update(m)
    return if Time.now - STARTTIME < 10
    unless getrank(m, m.user.name) == 'Admin' || getrank(m, m.user.name) == 'Owner'
      m.reply 'Only Admins and Owners may restart me! What are you, a bean?'
      return
    end
    m.reply 'Restarting and Updating!'
    sleep 1
    `git pull`
    exec('ruby bot.rb')
  end
end
