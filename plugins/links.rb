class Links
  include Cinch::Plugin

  match /forums/, method: :forums
  match /forum/, method: :forums
  match /rules/, method: :rules

  def forums(m)
    m.reply 'You can chat on the forums here: http://forums.cloudcitymc.us'
  end

  def rules(m)
    m.reply 'You can read the rules here: http://cloudcitymc.us/rules'
  end
end
