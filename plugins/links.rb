class Links
  include Cinch::Plugin

  match /forums/, method: :forums

  def forums(m)
    m.reply 'You can chat on the forums here: http://cloudcitymc.us'
  end
end
