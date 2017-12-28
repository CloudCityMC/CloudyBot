class NickServ
  include Cinch::Plugin

  listen_to :connect, method: :identify

  def identify(_m)
    User('NickServ').send("identify #{NS['pass']}")
  end
end
