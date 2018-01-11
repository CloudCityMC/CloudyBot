class Links
  include Cinch::Plugin

  match /forum/, method: :forums
  match /rules/, method: :rules
  match /vote/, method: :vote
  match /irc/, method: :irc
  match /report/, method: :report
  match /sell/, method: :sell
  match /shop/, method: :shop
  match /store/, method: :store
  match /donate/, method: :store
  match /feedback/, method: :feedback
  match /twitter/, method: :twitter
  match /linktwitter/, method: :linktwitter
  match /website/, method: :website
  match /site/, method: :website
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

  def store(m)
    m.reply 'Want to donate to the server? Do it here: https://store.cloudcitymc.us/'
  end

  def feedback(m)
    m.reply 'Want to suggest something for the server? Do it here: https://feedback.cloudcitymc.us/'
  end

  def twitter(m)
    m.reply 'Want to follow us on twitter? Do it here: https://twitter.com/CloudCityMC'
  end

  def linktwitter(m)
    m.reply 'Want to link your twitter account? Do it here: https://forums.cloudcitymc.us/threads/new-twitter-integration-in-game-and-how-to-link.12/'
  end

  def website(m)
    m.reply 'You can visit the official server website here: https://cloudcitymc.us/'
  end

  def links(m)
    m.reply 'Possible links: forums, rules, vote, irc, report, sell, shop, store/donate, feedback, twitter, linktwitter, website. Reference it with @[link].'
  end
end
