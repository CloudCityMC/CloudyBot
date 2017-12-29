class Links
  include Cinch::Plugin

  match /forum/, method: :forums
  match /rules/, method: :rules
  match /vote/, method: :vote
  match /irc/, method: :irc

  def forums(m)
    m.reply 'You can chat on the forums here: http://forums.cloudcitymc.us'
  end

  def rules(m)
    m.reply 'You can read the rules here: http://cloudcitymc.us/rules'
  end

  def vote(m)
    m.reply 'You can find the vote links here: https://forums.cloudcitymc.us/threads/official-server-vote-links.5/'
  end

  def irc(m)
    m.reply 'You can chat with us on IRC here: http://cloudcitymc.us/irc'
  end
end
