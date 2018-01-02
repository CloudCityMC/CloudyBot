class Links
  include Cinch::Plugin

  match /forum/, method: :forums
  match /rules/, method: :rules
  match /vote/, method: :vote
  match /irc/, method: :irc
  match /report/, method: :report
  match /sell/, method: :sell
  match /shop/, method: :shop
  match /links/, method: :links

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

  def report(m)
    m.reply 'You can report players on the forums here: https://forums.cloudcitymc.us/forums/report-players.10/'
  end

  def sell(m)
    m.reply 'Want to report a missing item from /sell? Do it on the forums here: https://forums.cloudcitymc.us/threads/items-that-cant-be-should-but-should.9'
  end

  def shop(m)
    m.reply 'Want to suggest an item to be added to the shop? Do it on the forums here: https://forums.cloudcitymc.us/threads/items-that-should-be-sold-in-the-shop.10/'
  end

  def links(m)
    m.reply 'Possible links: forums, rules, vote, irc, report, sell, shop. Reference it with @[link].'
  end
end
