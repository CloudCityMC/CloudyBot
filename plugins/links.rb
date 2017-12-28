class Links
  include Cinch::Plugin

  match /forums/, method: :forums
  match /forum/, method: :forums

  def forums(m)
    m.reply 'You can chat on the forums here: http://forums.cloudcitymc.us'
  end
end
